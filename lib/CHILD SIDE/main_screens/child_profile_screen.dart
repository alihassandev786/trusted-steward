import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/CHILD%20SIDE/main_screens/profile_items_screen/child_notification_screen.dart';
import 'package:trusted_steward/CHILD%20SIDE/main_screens/profile_items_screen/edit_profile_screen.dart';
import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_card.dart';
import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';
import '../../INDIVIDUAL SIDE/main_screens/profile_screen_items/help_support_screen.dart';
import '../../INDIVIDUAL SIDE/main_screens/profile_screen_items/privacy_scurity_screen.dart';
import '../../INDIVIDUAL SIDE/main_screens/profile_screen_items/rate_app_screen.dart';
import '../../INDIVIDUAL SIDE/profile_screen_widgets/logout_dialogue.dart';
import '../../INDIVIDUAL SIDE/profile_screen_widgets/profile_data.dart';
import '../../INDIVIDUAL SIDE/profile_screen_widgets/profile_widgets.dart';

class ChildProfileScreen extends StatefulWidget {
  const ChildProfileScreen({
    super.key,
    this.initialProfile = const ProfileData(
      name: 'Jamson Bold',
      email: 'Jamsonbold@gmail.com',
      country: 'United States',
      timezone: 'Pacific Time (PT)',
      photoAsset: 'assets/images/childPro.png',
    ),
    this.momImage = 'assets/images/mom.png',
    this.dadImage = 'assets/images/dad.png',
    this.onSaveProfile,
    this.onLogout,
  });

  final ProfileData initialProfile;
  final String momImage;
  final String dadImage;

  final Future<void> Function(ProfileData profile)? onSaveProfile;
  final Future<void> Function()? onLogout;

  @override
  State<ChildProfileScreen> createState() =>
      _ChildProfileScreenState();
}

class _ChildProfileScreenState extends State<ChildProfileScreen> {
  late ProfileData _profile;
  bool _loggingOut = false;

  @override
  void initState() {
    super.initState();
    _profile = widget.initialProfile;
  }

  Future<void> _editProfile() async {
    final updated = await Get.to<ProfileData>(
          () => ChildEditProfileScreen(
        profile: _profile,
        onSave: widget.onSaveProfile,
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

      final logout = widget.onLogout;

      if (logout == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logout is not connected yet.'),
          ),
        );
        return;
      }

      await logout();
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

  Widget _avatar({
    required double size,
    ImageProvider? image,
  }) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: image == null
            ? ColoredBox(
          color: learnIconBackground,
          child: Icon(
            Icons.person,
            size: size * 0.5,
            color: learnGreen,
          ),
        )
            : Image(
          image: image,
          fit: BoxFit.cover,
          errorBuilder: (_, error, stackTrace) {
            return ColoredBox(
              color: learnIconBackground,
              child: Icon(
                Icons.person,
                size: size * 0.5,
                color: learnGreen,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _familyMember({
    required String image,
    required String name,
    required String role,
  }) {
    return LearnCard(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 22,
      ),
      child: Row(
        children: [
          _avatar(
            size: 40,
            image: AssetImage(image),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: learnText(
                    14,
                    weight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(role, style: learnText(12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider? profileImage = _profile.photo != null
        ? FileImage(_profile.photo!)
        : _profile.photoAsset != null
        ? AssetImage(_profile.photoAsset!)
        : null;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: learnBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Profile header
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: learnGreen,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(70),
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 30, 24, 45),
                    child: Column(
                      children: [
                        _avatar(
                          size: 130,
                          image: profileImage,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _profile.name,
                          textAlign: TextAlign.center,
                          style: learnText(
                            20,
                            color: Colors.white,
                            weight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _profile.email,
                          textAlign: TextAlign.center,
                          style: learnText(
                            12,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF205B35),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.person,
                                size: 13,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'You',
                                style: learnText(
                                  10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _familyMember(
                      image: widget.momImage,
                      name: 'Sarah (Mom)',
                      role: 'Head of Household',
                    ),

                    const SizedBox(height: 12),

                    _familyMember(
                      image: widget.dadImage,
                      name: 'David John (Dad)',
                      role: 'Spouse',
                    ),

                    const SizedBox(height: 28),

                    Text(
                      'Settings',
                      style: learnText(
                        16,
                        weight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 24),

                    ProfileMenuTile(
                      icon: Icons.manage_accounts_outlined,
                      title: 'Edit Profile',
                      onTap: _editProfile,
                    ),

                    ProfileMenuTile(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      onTap: () {
                        Get.to(
                              () => const ChildNotificationsScreen(),
                        );
                      },
                    ),

                    ProfileMenuTile(
                      icon: Icons.lock_outline,
                      title: 'Privacy & Security',
                      onTap: () {
                        Get.to(
                              () => const PrivacySecurityScreen(),
                        );
                      },
                    ),

                    ProfileMenuTile(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      onTap: () {
                        Get.to(
                              () => const HelpSupportScreen(),
                        );
                      },
                    ),

                    ProfileMenuTile(
                      icon: Icons.star,
                      title: 'Rate App',
                      onTap: () {
                        Get.to(
                              () => const RateAppScreen(),
                        );
                      },
                    ),

                    const SizedBox(height: 48),

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