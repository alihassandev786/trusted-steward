import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';

import '../../presentation/Widgets/logoutdiologe.dart';

/// =========================================================
/// SHARED MODELS (used by both controllers)
/// =========================================================

/// FAMILY MEMBER ITEM MODEL
class FamilyMemberData {
  final String name;
  final String role;
  final String image;

  FamilyMemberData({
    required this.name,
    required this.role,
    required this.image,
  });
}

/// SETTINGS LIST ITEM MODEL
class SettingItemData {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  SettingItemData({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

/// =========================================================
/// CONTROLLER 1 — FAMILY / GUARDIAN PROFILE SCREEN
/// =========================================================
class FamilyProfileController extends GetxController {
  static FamilyProfileController get to => Get.find<FamilyProfileController>();

  /// HEADER SECTION
  final String avatarImage = "assets/images/home1.png";
  final String name = "Jamson Bold";
  final String email = "Jamsonbold@gmail.com";
  final String badgeLabel = "You";

  /// FAMILY MEMBERS LIST
  final List<FamilyMemberData> familyMembers = [
    FamilyMemberData(
      name: "Sarah (Guardian)",
      role: "Head of Household",
      image: "assets/images/home1.png",
    ),
    FamilyMemberData(
      name: "David John (Guardian)",
      role: "Spouse",
      image: "assets/images/home1.png",
    ),
    FamilyMemberData(
      name: "James Sterling",
      role: "Junior Member",
      image: "assets/images/home1.png",
    ),
  ];

  /// SETTINGS SECTION HEADING
  final String settingsTitle = "Settings";

  /// SETTINGS LIST (7 ITEMS MATCHING FIGMA DESIGN)
  final List<SettingItemData> settings = [
    SettingItemData(
      icon: Icons.person_outline_rounded,
      title: "Edit Profile",
      onTap: () => AppNavigator.pushRight(AppRoutes.editprofile),
    ),
    SettingItemData(
      icon: Icons.notifications_none_rounded,
      title: "Notifications",
      onTap: () => AppNavigator.pushRight(AppRoutes.notification),
    ),
    SettingItemData(
      icon: Icons.lock_outline_rounded,
      title: "Privacy & Security",
      onTap: () => AppNavigator.pushRight(AppRoutes.privacysecurity),
    ),
    SettingItemData(
      icon: Icons.account_balance_outlined,
      title: "Manage Permissions",
      onTap: () {
        AppNavigator.pushRight(AppRoutes.fpermission);
      },
    ),
    SettingItemData(
      icon: Icons.people_outline_rounded,
      title: "Family Members",
      onTap: () {
        AppNavigator.pushRight(AppRoutes.familymember);
      },
    ),
    SettingItemData(
      icon: Icons.help_outline_rounded,
      title: "Help & Support",
      onTap: () => AppNavigator.pushRight(AppRoutes.helpandsupport),
    ),
    SettingItemData(
      icon: Icons.star_border_rounded,
      title: "Rate App",
      onTap: () => AppNavigator.pushRight(AppRoutes.rateapp),
    ),
  ];

  /// LOGOUT
  final String logoutLabel = "Logout";

}

/// =========================================================
/// CONTROLLER 2 — GUARDIAN / STEWARD PROFILE SCREEN
/// =========================================================
class ProfileController extends GetxController {
  static ProfileController get to => Get.find<ProfileController>();

  /// HEADER
  final String avatarImage = "assets/images/home1.png";
  final String name = "Sarah Peterson";
  final String email = "Sarah.peter@gmail.com";
  final String connectedLabel = "Connected & Shared";

  /// STEWARDSHIP SCORE
  final String stewardshipTitle = "Stewardship Score";
  final String score = "903";
  final String scoreLabel = "Score";

  /// STATS
  final String learningProgress = "65%";
  final String learningProgressLabel = "Learning Progress";
  final String activeGoals = "03";
  final String activeGoalsLabel = "Active Goals";

  /// SETTINGS LIST
  final List<SettingItemData> settings = [
    SettingItemData(
      icon: Icons.edit_note_rounded,
      title: "Edit Profile",
      onTap: () => AppNavigator.pushRight(AppRoutes.editprofile),
    ),
    SettingItemData(
      icon: Icons.notifications_none_rounded,
      title: "Notifications",
      onTap: () => AppNavigator.pushRight(AppRoutes.notification),
    ),
    SettingItemData(
      icon: Icons.lock_outline_rounded,
      title: "Privacy & Security",
      onTap: () => AppNavigator.pushRight(AppRoutes.privacysecurity),
    ),
    SettingItemData(
      icon: Icons.account_balance_outlined,
      title: "Manage Permissions",
      onTap: () {

      },
    ),
    SettingItemData(
      icon: Icons.help_outline_rounded,
      title: "Help & Support",
      onTap: () => AppNavigator.pushRight(AppRoutes.helpandsupport),
    ),
    SettingItemData(
      icon: Icons.star_border_rounded,
      title: "Rate App",
      onTap: () => AppNavigator.pushRight(AppRoutes.rateapp),
    ),
  ];

  /// LOGOUT
  final String logoutLabel = "Logout";

  void logout() {
    AppNavigator.pushRight(AppRoutes.familysetup);
  }
}