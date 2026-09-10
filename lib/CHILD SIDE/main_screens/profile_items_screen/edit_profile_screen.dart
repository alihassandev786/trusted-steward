import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_button.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';
import '../../../INDIVIDUAL SIDE/profile_screen_widgets/image_picker.dart';
import '../../../INDIVIDUAL SIDE/profile_screen_widgets/profile_data.dart';
import '../../../INDIVIDUAL SIDE/profile_screen_widgets/profile_widgets.dart';


class ChildEditProfileScreen extends StatefulWidget {
  const ChildEditProfileScreen({
    super.key,
    required this.profile,
    this.onSave,
  });

  final ProfileData profile;
  final Future<void> Function(ProfileData profile)? onSave;

  @override
  State<ChildEditProfileScreen> createState() =>
      _ChildEditProfileScreenState();
}

class _ChildEditProfileScreenState
    extends State<ChildEditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();

  File? _photo;
  String? _photoAsset;
  bool _saving = false;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(
      text: widget.profile.name,
    );
    _emailController = TextEditingController(
      text: widget.profile.email,
    );

    _photo = widget.profile.photo;
    _photoAsset = widget.profile.photoAsset;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (_saving || !_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    final updatedProfile = ProfileData(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      country: widget.profile.country,
      timezone: widget.profile.timezone,
      photo: _photo,
      photoAsset: _photoAsset,
    );

    setState(() => _saving = true);

    try {
      final save = widget.onSave;

      if (save != null) {
        await save(updatedProfile);
      }

      if (!mounted) return;

      Navigator.pop(context, updatedProfile);
    } catch (_) {
      if (!mounted) return;

      setState(() => _saving = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not save changes. Please try again.'),
        ),
      );
    }
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
                    padding: const EdgeInsets.fromLTRB(20, 28, 20, 60),
                    child: Stack(
                      children: [
                        Center(
                          child: ProfilePicker(
                            size: 130,
                            initialImage: _photo,
                            initialAsset: _photoAsset,
                            backgroundColor: learnIconBackground,
                            ringColor: Colors.transparent,
                            label: 'Edit Profile Picture',
                            changeLabel: 'Edit Profile Picture',
                            showCameraOverlay: true,
                            enabled: !_saving,
                            onImageSelected: (file) {
                              setState(() {
                                _photo = file;
                                _photoAsset = null;
                              });
                            },
                          ),
                        ),

                        Positioned(
                          top: 0,
                          left: 0,
                          child: Material(
                            color: const Color(0xFF205B35),
                            shape: const CircleBorder(),
                            clipBehavior: Clip.antiAlias,
                            child: IconButton(
                              tooltip: 'Back',
                              onPressed: _saving
                                  ? null
                                  : () => Navigator.maybePop(context),
                              icon: const Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 27,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 48, 20, 36),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ProfileEditField(
                        controller: _nameController,
                        label: 'Full name',
                        focusNode: _nameFocus,
                        enabled: !_saving,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter your name';
                          }
                          return null;
                        },
                      ),

                      ProfileEditField(
                        controller: _emailController,
                        label: 'Email address',
                        focusNode: _emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        enabled: !_saving,
                        validator: (value) {
                          final email = value?.trim() ?? '';

                          if (email.isEmpty) {
                            return 'Enter your email';
                          }

                          if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$')
                              .hasMatch(email)) {
                            return 'Enter a valid email';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      LearnButton(
                        label: _saving ? 'Saving...' : 'Save Changes',
                        onPressed: _saving ? null : _saveProfile,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}