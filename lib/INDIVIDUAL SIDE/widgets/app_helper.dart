import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

/// The same public helper methods and FadingCircle loader as your original.
/// Uses Get's navigator, so the application root must be GetMaterialApp.
class AppHelpers {
  AppHelpers._();

  // Uses the green from your sign-up screen without depending on a theme path.
  static const Color _green = Color(0xFF306C3F);
  static DialogRoute<void>? _loaderRoute;

  /// Returns false if this helper already has a visible loader.
  static bool showLoader({Color color = _green}) {
    if (_loaderRoute?.isActive == true) return false;

    final navigator = Get.key.currentState;
    final context = Get.overlayContext ?? Get.context;
    if (navigator == null || context == null) {
      throw StateError('AppHelpers requires a mounted GetMaterialApp.');
    }

    final route = DialogRoute<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.15),
      settings: const RouteSettings(name: '/app-loader'),
      builder: (_) => PopScope(
        canPop: false,
        child: Loader(color: color),
      ),
    );

    _loaderRoute = route;
    unawaited(
      navigator.push<void>(route).whenComplete(() {
        if (identical(_loaderRoute, route)) _loaderRoute = null;
      }),
    );
    return true;
  }

  /// Removes only our loader, so another dialog or screen is never popped.
  static void hideLoader() {
    final route = _loaderRoute;
    _loaderRoute = null;
    if (route == null) return;

    final navigator = route.navigator;
    if (navigator != null && route.isActive) {
      navigator.removeRoute(route);
    }
  }

  static void showSuccess(String message, {String title = 'Success'}) {
    _closeAnyOpenSnackbar();
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade50,
      colorText: Colors.green.shade800,
      margin: const EdgeInsets.all(16),
      icon: Icon(Icons.check_circle, color: Colors.green.shade800),
      duration: const Duration(seconds: 2),
    );
  }

  static void showError(String message, {String title = 'Error'}) {
    _closeAnyOpenSnackbar();
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade50,
      colorText: Colors.red.shade800,
      margin: const EdgeInsets.all(16),
      icon: Icon(Icons.error_outline, color: Colors.red.shade800),
      duration: const Duration(seconds: 5),
    );
  }

  static void showInfo(String message, {String title = 'Info'}) {
    _closeAnyOpenSnackbar();
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.shade50,
      colorText: Colors.blue.shade800,
      margin: const EdgeInsets.all(16),
      icon: Icon(Icons.info_outline, color: Colors.blue.shade800),
      duration: const Duration(seconds: 3),
    );
  }

  static void _closeAnyOpenSnackbar() {
    if (Get.isSnackbarOpen) Get.closeCurrentSnackbar();
  }
}

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.color = Colors.black,
    this.size = 50.0,
    this.strokeWidth = 2,
  });

  final Color color;
  final double size;
  // Retained for existing callers. SpinKitFadingCircle has no stroke width.
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Loading. Please wait.',
      liveRegion: true,
      child: Center(
        child: SpinKitFadingCircle(color: color, size: size),
      ),
    );
  }
}
