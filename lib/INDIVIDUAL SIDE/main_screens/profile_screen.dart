import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/dashboard_items/notification_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/profile_screen_items/edit_profile_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/profile_screen_items/help_support_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/profile_screen_items/privacy_scurity_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/profile_screen_items/rate_app_screen.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/auth%20screens/select_use_screen.dart';
import '../learn_screen_widgets/learn_theme.dart';
import '../profile_screen_widgets/logout_dialogue.dart';
import '../profile_screen_widgets/profile_data.dart';
import '../profile_screen_widgets/profile_widgets.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    this.onLogout,
    this.initialProfile = const ProfileData(
      name: 'Alex Peterson',
      email: 'Alex.peterson@gmail.com',
      country: 'United States',
      timezone: 'Pacific Time (PT)',
      photoAsset: 'assets/images/profile.png',

    ),
    this.onSaveProfile,
    this.onMenuTap,
  });

  final ProfileData initialProfile;
  final Future<void> Function()? onLogout;
  final Future<void> Function(ProfileData profile)? onSaveProfile;
  final ValueChanged<String>? onMenuTap;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileData _profile;
  bool _loggingOut = false;

  @override
  void initState() {
    super.initState();
    _profile = widget.initialProfile;
  }

  Future<void> _editProfile() async {
    final updated = await Navigator.of(context).push<ProfileData>(
      MaterialPageRoute(
        builder: (_) => EditProfileScreen(
          profile: _profile,
          onSave: widget.onSaveProfile,
        ),
      ),
    );

    if (!mounted || updated == null) return;

    setState(() {
      _profile = updated;
    });
  }

  Future<void> _logout() async {
    if (_loggingOut) return;

    setState(() => _loggingOut = true);

    try {
      final confirmed = await showLogoutDialog(context);

      if (!mounted || !confirmed) return;

      // Connected ho to pehle actual sign-out complete karein.
      final logout = widget.onLogout;
      if (logout != null) {
        await logout();
      }

      if (!mounted) return;

      Get.offAll(() => SelectUseScreen());
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not log out. Please try again.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _loggingOut = false);
      }
    }
  }

  void _openMenu(String title) {
    final onMenuTap = widget.onMenuTap;

    if (onMenuTap != null) {
      onMenuTap(title);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title is not available yet.'),
      ),
    );
  }

  Widget _menu(IconData icon, String title) {
    return ProfileMenuTile(
      icon: icon,
      title: title,
      onTap: () => _openMenu(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: learnBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(profile: _profile),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 38, 20, 40),
                child: Column(
                  children: [
                    const StewardshipScoreCard(
                      score: 903,
                    ),

                    const SizedBox(height: 24),

                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ProfileMetricCard(
                            icon: Icons.menu_book_outlined,
                            value: '65%',
                            label: 'Learning Progress',
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: ProfileMetricCard(
                            icon: Icons.outlined_flag,
                            value: '03',
                            label: 'Active Goals',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    ProfileMenuTile(
                      icon: Icons.manage_accounts_outlined,
                      title: 'Edit Profile',
                      onTap: _editProfile,
                    ),

                    ProfileMenuTile(
                     icon: Icons.notifications,
                      title:'Notifications',
                      onTap: (){Get.to(()=>NotificationsScreen());},
                    ),

                    ProfileMenuTile(
                     icon: Icons.lock_outline,
                      title:'Privacy & Security',
                      onTap: (){Get.to(()=>PrivacySecurityScreen());},
                    ),

                ProfileMenuTile(
                     icon: Icons.account_balance_outlined,
                      title:'Linked Accounts',
                  onTap: (){},
                    ),

                    ProfileMenuTile(
                      icon:Icons.help_outline,
                      title:'Help & Support',
                      onTap: (){Get.to(()=>HelpSupportScreen());},
                    ),

                    ProfileMenuTile(
                     icon: Icons.star,
                      title:'Rate App',
                      onTap: (){Get.to(()=>RateAppScreen());},
                    ),

                    const SizedBox(height: 38),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _loggingOut ? null : _logout,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAA0011),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(0, 45),
                          elevation: 0,
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          'Logout',
                          style: learnText(
                            14,
                            color: Colors.white,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}