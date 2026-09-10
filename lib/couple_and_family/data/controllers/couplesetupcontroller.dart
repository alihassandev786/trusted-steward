import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/route/approutes.dart';

class CouplesetupController extends GetxController {
  static CouplesetupController get to => Get.find();

  /// PARTNER EMAIL FIELD
  final TextEditingController emailController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
  /// SEND INVITATION -> SIMPLE NAVIGATION VIA APPROUTES
  void sendInvitation() {
    Get.toNamed(AppRoutes.bottomnavigation);
  }
}