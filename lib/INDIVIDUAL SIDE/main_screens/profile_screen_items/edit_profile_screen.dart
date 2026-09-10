import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../learn_screen_widgets/learn_button.dart';
import '../../learn_screen_widgets/learn_theme.dart';
import '../../profile_screen_widgets/image_picker.dart';
import '../../profile_screen_widgets/profile_data.dart';
import '../../profile_screen_widgets/profile_widgets.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
    required this.profile,
    this.onSave,
  });

  final ProfileData profile;

  // API/database save callback. Throw on failure.
  final Future<void> Function(ProfileData profile)? onSave;

  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _country;
  late final TextEditingController _timezone;

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _countryFocus = FocusNode();
  final _timezoneFocus = FocusNode();

  File? _photo;
  String? _photoAsset;
  bool _saving = false;

  @override
  void initState() {
    super.initState();

    _name = TextEditingController(text: widget.profile.name);
    _email = TextEditingController(text: widget.profile.email);
    _country = TextEditingController(text: widget.profile.country);
    _timezone = TextEditingController(text: widget.profile.timezone);

    _photo = widget.profile.photo;
    _photoAsset = widget.profile.photoAsset ??
        (_photo == null ? 'assets/images/profile.png' : null);
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _country.dispose();
    _timezone.dispose();

    _nameFocus.dispose();
    _emailFocus.dispose();
    _countryFocus.dispose();
    _timezoneFocus.dispose();

    super.dispose();
  }

  String? _required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  Future<void> _save() async {
    if (_saving || !_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    final updated = ProfileData(
      name: _name.text.trim(),
      email: _email.text.trim(),
      country: _country.text.trim(),
      timezone: _timezone.text.trim(),
      photo: _photo,
      photoAsset: _photoAsset,
    );

    setState(() => _saving = true);

    try {
      if (widget.onSave != null) {
        await widget.onSave!(updated);
      }

      if (!mounted) return;
      Navigator.pop(context, updated);
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
                            initialImage: widget.profile.photo,
                            initialAsset: widget.profile.photoAsset,
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
                        controller: _name,
                        label: 'Full name',
                        focusNode: _nameFocus,
                        validator: _required,
                        enabled: !_saving,
                      ),
                      ProfileEditField(
                        controller: _email,
                        label: 'Email address',
                        focusNode: _emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        enabled: !_saving,
                        validator: (value) {
                          if (_required(value) != null) {
                            return 'Email is required';
                          }

                          if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$')
                              .hasMatch(value!.trim())) {
                            return 'Enter a valid email';
                          }

                          return null;
                        },
                      ),
                      ProfileEditField(
                        controller: _country,
                        label: 'Country',
                        focusNode: _countryFocus,
                        validator: _required,
                        enabled: !_saving,
                      ),
                      ProfileEditField(
                        controller: _timezone,
                        label: 'Time zone',
                        focusNode: _timezoneFocus,
                        validator: _required,
                        enabled: !_saving,
                      ),
                      const SizedBox(height: 18),
                      LearnButton(
                        label: _saving ? 'Saving...' : 'Save Changes',
                        onPressed: _saving ? null : _save,
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