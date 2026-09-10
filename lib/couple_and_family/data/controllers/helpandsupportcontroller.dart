import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';

/// HELP & SUPPORT LIST ITEM MODEL
class HelpItemData {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  HelpItemData({required this.icon, required this.title,required this.onTap});
}

class HelpSupportController extends GetxController {
  static HelpSupportController get to => Get.find();

  /// HEADER
  final String pageTitle = "Help & Support";

  /// HERO SECTION
  final String heading = "How Can We Help you?";
  final String searchHint = "Search any kind of help you need...";

  /// LIST ITEMS
  final List<HelpItemData> items = [
    HelpItemData(icon: Icons.contact_phone_outlined, title: "Contact US",onTap: (){}),
    HelpItemData(icon: Icons.gpp_maybe_outlined, title: "Terms & Conditions",onTap: (){
      AppNavigator.pushRight(AppRoutes.termsandconsition);
    }),
    HelpItemData(icon: Icons.privacy_tip_outlined, title: "Privacy Policy",onTap: (){
      AppNavigator.pushRight(AppRoutes.privacypolicy);
    }),
  ];
}