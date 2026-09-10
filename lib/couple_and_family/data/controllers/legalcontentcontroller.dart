import 'package:get/get.dart';

class LegalContentController extends GetxController {
  static LegalContentController get to => Get.find();

  /// SHARED BODY CONTENT (same for both screens per provided design)
  final String _body =
      "Welcome to our platform. By accessing or using this application, you agree to comply with these Terms & Conditions. Please read them carefully before using our services.\n\n"
      "By creating an account or using any part of the platform, you acknowledge that you have read, understood, and agreed to these terms.\n\n"
      "Users are responsible for providing accurate information, maintaining the confidentiality of their account credentials, and using the platform in a lawful manner. You agree not to misuse the platform, interfere with its functionality, or engage in activities that may harm other users or the service. All content, including text, graphics, logos, icons, and software, is the property of the platform or its licensors and is protected by applicable intellectual property laws.\n\n"
      "We strive to provide reliable services; however, we do not guarantee uninterrupted or error-free operation. We shall not be liable for any indirect, incidental, or consequential damages arising from the use of the platform.\n\n"
      "We reserve the right to update or modify these Terms & Conditions at any time. Continued use of the platform after changes become effective constitutes acceptance of the revised terms.\n\n"
      "If you have any questions regarding these Terms & Conditions, please contact our support team.";

  /// PRIVACY POLICY
  final String privacyPolicyTitle = "Privacy Policy";
  String get privacyPolicyBody => _body;

  /// TERMS & CONDITIONS
  final String termsConditionsTitle = "Terms & Conditions";
  String get termsConditionsBody => _body;
}