import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';

/// PRIVACY & SECURITY LIST ITEM MODEL
class PrivacyItemData {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  PrivacyItemData({required this.icon, required this.title,required this.onTap});
}

class PrivacySecurityController extends GetxController {
  static PrivacySecurityController get to => Get.find();

  /// HEADER
  final String pageTitle = "Privacy & Security";

  /// LIST ITEMS
  final List<PrivacyItemData> items = [
    PrivacyItemData(icon: Icons.lock_outline_rounded, title: "Change Password",onTap: (){
      AppNavigator.pushRight(AppRoutes.updatepassword);
    }),
    PrivacyItemData(icon: Icons.gpp_maybe_outlined, title: "Terms & Conditions",onTap: (){
      AppNavigator.pushRight(AppRoutes.termsandconsition);
    }),
    PrivacyItemData(icon: Icons.privacy_tip_outlined, title: "Privacy Policy",onTap: (){
      AppNavigator.pushRight(AppRoutes.privacypolicy);
    }),
  ];
}