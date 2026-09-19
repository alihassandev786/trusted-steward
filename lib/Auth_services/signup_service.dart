import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

/// JSON API access only. UI feedback belongs in SignUpScreen.
class SignUpService {
  SignUpService({this.timeout = const Duration(seconds: 30)});

  final Duration timeout;

  static final Uri _signUpUrl = Uri.parse(
    'https://trustedsteward.digitalpreps.com/api/signup',
  );

  // Only "individual" is confirmed by the supplied API example.
  // Change the other values here if your backend uses different role names.
  static const List<String> roles = <String>[
    'individual',
    'couple',
    'family',
  ];

  static String? roleForSelection(int selectedId) {
    if (selectedId < 0 || selectedId >= roles.length) return null;
    return roles[selectedId];
  }

  Future<SignUpResult> signUp({
    required String fullName,
    required String email,
    required String password,
    required String role,
  }) async {
    if (!roles.contains(role)) {
      throw const SignUpException('Please select a valid account type.');
    }

    // A separate client per attempt lets finally close the connection even
    // after a timeout. Never automatically retry this account-creation POST.
    final client = http.Client();

    try {
      final response = await client
          .post(
        _signUpUrl,
        headers: const <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept-Language': 'en',
        },
        body: jsonEncode(<String, String>{
          'full_name': fullName.trim(),
          'email': email.trim(),
          'password': password, // Preserve spaces in the actual password.
          'role': role,
        }),
      )
          .timeout(timeout);

      final statusCode = response.statusCode;
      final body = _decodeObject(response.bodyBytes);

      if (statusCode < 200 || statusCode >= 300) {
        throw SignUpException(
          _httpErrorMessage(statusCode, body),
          statusCode: statusCode,
        );
      }

      if (body == null || body['status'] is! bool) {
        throw SignUpException(_unconfirmedResponse, statusCode: statusCode);
      }

      // HTTP success alone is not enough: the API must also report success.
      if (body['status'] != true) {
        throw SignUpException(
          _validationMessage(body) ??
              'We could not create your account. Please check your details.',
          statusCode: statusCode,
        );
      }

      final rawUser = body['data'];
      if (rawUser is! Map<String, dynamic>) {
        throw SignUpException(
          _incompleteCreatedAccount,
          statusCode: statusCode,
          accountCreated: true,
        );
      }

      final SignUpUser user;
      try {
        user = SignUpUser.fromJson(rawUser);
      } on FormatException {
        throw SignUpException(
          _incompleteCreatedAccount,
          statusCode: statusCode,
          accountCreated: true,
        );
      }
      if (user.role != role) {
        throw SignUpException(
          'Your account was created with a different account type. '
              'Please contact support before continuing.',
          statusCode: statusCode,
          accountCreated: true,
        );
      }

      return SignUpResult(
        message: _plainMessage(body['message']) ??
            'Your account has been created successfully.',
        user: user,
      );
    } on TimeoutException {
      throw const SignUpException(
        'The request timed out. Your account may have been created. '
            'Please try signing in before signing up again.',
      );
    } on http.ClientException {
      throw const SignUpException(
        'We could not confirm sign-up. Check your internet connection '
            'and try signing in before signing up again.',
      );
    } on FormatException {
      throw const SignUpException(_unconfirmedResponse);
    } finally {
      client.close();
    }
  }

  static const String _unconfirmedResponse =
      'The server returned an unexpected response. Your account may have '
      'been created. Please try signing in before signing up again.';

  static const String _incompleteCreatedAccount =
      'Your account was created, but the returned account details are '
      'incomplete. Please sign in to continue or contact support.';

  static Map<String, dynamic>? _decodeObject(List<int> bytes) {
    try {
      final decoded = jsonDecode(utf8.decode(bytes));
      return decoded is Map<String, dynamic> ? decoded : null;
    } on FormatException {
      return null;
    }
  }

  static String _httpErrorMessage(
      int statusCode,
      Map<String, dynamic>? body,
      ) {
    // Use a generic message for server errors instead of their response body.
    if (statusCode >= 500) {
      return 'The server could not confirm sign-up. Your account may have '
          'been created. Please try signing in before trying again.';
    }
    if (statusCode == 408) {
      return 'The request timed out. Please try signing in before '
          'signing up again.';
    }
    if (statusCode == 429) {
      return 'Too many sign-up attempts. Please wait a few minutes '
          'and try again.';
    }

    // These responses commonly contain useful field validation messages.
    if (statusCode == 400 || statusCode == 409 || statusCode == 422) {
      final validationMessage = _validationMessage(body);
      if (validationMessage != null) return validationMessage;
    }

    switch (statusCode) {
      case 400:
      case 422:
        return 'Some details are invalid. Please check the form and try again.';
      case 401:
      case 403:
        return 'Sign-up is not available right now. Please contact support.';
      case 404:
      case 405:
        return 'The sign-up service is unavailable. Please try again later.';
      case 409:
        return 'An account with these details already exists. '
            'Please sign in or use a different email address.';
      default:
        return 'We could not complete sign-up. Please try again later.';
    }
  }

  static String? _validationMessage(Map<String, dynamic>? body) {
    if (body == null) return null;
    final messages = <String>[];

    void collect(Object? value) {
      if (messages.length >= 3) return;
      if (value is Map) {
        for (final item in value.values) {
          collect(item);
          if (messages.length >= 3) break;
        }
      } else if (value is List) {
        for (final item in value) {
          collect(item);
          if (messages.length >= 3) break;
        }
      } else {
        final message = _plainMessage(value);
        if (message != null && !messages.contains(message)) {
          messages.add(message);
        }
      }
    }

    collect(body['errors']);
    if (messages.isNotEmpty) return messages.join('\n');
    return _plainMessage(body['message']) ?? _plainMessage(body['error']);
  }

  static String? _plainMessage(Object? value) {
    if (value is! String) return null;
    final message = value.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (message.isEmpty || message.length > 250) return null;
    if (RegExp(r'<[^>]+>').hasMatch(message)) return null;
    return message;
  }
}

class SignUpException implements Exception {
  const SignUpException(
      this.message, {
        this.statusCode,
        this.accountCreated = false,
      });

  final String message;
  final int? statusCode;
  // A successful write must not be retried just because its data was invalid.
  final bool accountCreated;

  @override
  String toString() => message;
}

class SignUpResult {
  const SignUpResult({required this.message, required this.user});

  final String message;
  final SignUpUser user;
}

class SignUpUser {
  const SignUpUser({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.role,
    this.profileImage,
    this.createdAt,
  });

  final int userId;
  final String fullName;
  final String email;
  final String role;
  final String? profileImage;
  // Keep the server value unchanged; the example does not specify a timezone.
  final String? createdAt;

  factory SignUpUser.fromJson(Map<String, dynamic> json) {
    final rawId = json['user_id'];
    final id = rawId is int
        ? rawId
        : rawId is String
        ? int.tryParse(rawId)
        : null;
    final fullName = json['full_name'];
    final email = json['email'];
    final role = json['role'];

    if (id == null ||
        id <= 0 ||
        fullName is! String ||
        fullName.trim().isEmpty ||
        email is! String ||
        email.trim().isEmpty ||
        role is! String ||
        !SignUpService.roles.contains(role)) {
      throw const FormatException('Invalid sign-up user data.');
    }

    return SignUpUser(
      userId: id,
      fullName: fullName,
      email: email,
      role: role,
      profileImage:
      json['profile_image'] is String ? json['profile_image'] as String : null,
      createdAt: json['created_at'] is String ? json['created_at'] as String : null,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'user_id': userId,
    'full_name': fullName,
    'email': email,
    'role': role,
    'profile_image': profileImage,
    'created_at': createdAt,
  };
}
