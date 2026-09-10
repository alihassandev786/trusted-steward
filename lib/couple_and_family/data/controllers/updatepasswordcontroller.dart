import 'package:get/get.dart';

class Updatepasswordcontroller extends GetxController {
  static Updatepasswordcontroller get to => Get.find();

  /// HEADER
  final String title = "Change Password";
  final String subtitle = "Create your password to proceed";

  /// FIELD HINTS
  final String currentPasswordHint = "Current Password";
  final String newPasswordHint = "New Password";
  final String confirmPasswordHint = "Confirm Password";

  /// BUTTON
  final String updateLabel = "Update Password";
}