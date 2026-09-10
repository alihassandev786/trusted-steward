import 'package:flutter/material.dart';

import '../learn_screen_widgets/learn_card.dart';
import '../learn_screen_widgets/learn_theme.dart';
import 'profile_data.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.profile,
  });

  final ProfileData profile;

  @override
  Widget build(BuildContext context) {
    final ImageProvider? image = profile.photo != null
        ? FileImage(profile.photo!)
        : profile.photoAsset != null
        ? AssetImage(profile.photoAsset!)
        : null;

    return Container(
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
              ClipOval(
                child: SizedBox(
                  width: 130,
                  height: 130,
                  child: image == null
                      ? const ColoredBox(
                    color: learnIconBackground,
                    child: Icon(
                      Icons.person,
                      color: learnGreen,
                      size: 70,
                    ),
                  )
                      : Image(
                    image: image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, error, stackTrace) =>
                    const ColoredBox(
                      color: learnIconBackground,
                      child: Icon(
                        Icons.person,
                        color: learnGreen,
                        size: 70,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                profile.name,
                textAlign: TextAlign.center,
                style: learnText(
                  20,
                  color: Colors.white,
                  weight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                profile.email,
                textAlign: TextAlign.center,
                style: learnText(12, color: Colors.white),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
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
                      Icons.verified_user_outlined,
                      size: 12,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Individual Account',
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
    );
  }
}

class StewardshipScoreCard extends StatelessWidget {
  const StewardshipScoreCard({
    super.key,
    this.score = 903,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return LearnCard(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      child: Column(
        children: [
          Text(
            'Stewardship Score',
            style: learnText(16, weight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: learnGold,
                width: 7,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$score',
                  style: learnText(
                    32,
                    color: learnGold,
                    weight: FontWeight.w700,
                  ),
                ),
                Text('Score', style: learnText(12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMetricCard extends StatelessWidget {
  const ProfileMetricCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return LearnCard(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 30,
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: learnIconBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: learnGreen, size: 22),
          ),
          const SizedBox(height: 18),
          Text(
            value,
            style: learnText(22, weight: FontWeight.w600),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            textAlign: TextAlign.center,
            style: learnText(12),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: GestureDetector(
        onTap: onTap,
        child: LearnCard(
          padding: const EdgeInsets.symmetric(
            horizontal: 19,
            vertical: 17,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: learnIconBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 21, color: learnGreen),
              ),
              const SizedBox(width: 21),
              Expanded(
                child: Text(
                  title,
                  style: learnText(14, weight: FontWeight.w600),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: learnGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileEditField extends StatelessWidget {
  const ProfileEditField({
    super.key,
    required this.controller,
    required this.label,
    required this.focusNode,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String label;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: LearnCard(
        padding: const EdgeInsets.fromLTRB(26, 12, 14, 12),
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          keyboardType: keyboardType,
          validator: validator,
          style: learnText(14, weight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            suffixIcon: IconButton(
              tooltip: 'Edit $label',
              onPressed: enabled
                  ? () => focusNode.requestFocus()
                  : null,
              icon: const Icon(
                Icons.edit_outlined,
                size: 19,
                color: learnGreen,
              ),
            ),
          ),
        ),
      ),
    );
  }
}