import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum _PhotoAction { gallery, camera, remove }

class ProfilePicker extends StatefulWidget {
  const ProfilePicker({
    super.key,
    this.size = 96,
    this.backgroundColor = const Color(0xFF2B5A3B),
    this.ringColor = const Color(0xFF4C8362),
    this.iconColor = Colors.white,
    this.label = 'Add Profile picture',
    this.changeLabel = 'Change Profile picture',
    this.onImageSelected,
    this.initialImage,
    this.initialAsset,
    this.showCameraOverlay = false,
    this.enabled = true,
  });

  final double size;
  final Color backgroundColor;
  final Color ringColor;
  final Color iconColor;
  final String label;
  final String changeLabel;
  final ValueChanged<File?>? onImageSelected;

  final File? initialImage;
  final String? initialAsset;
  final bool showCameraOverlay;
  final bool enabled;

  @override
  State<ProfilePicker> createState() =>
      _ProfilePickerState();
}

class _ProfilePickerState extends State<ProfilePicker> {
  final ImagePicker _picker = ImagePicker();

  File? _image;
  String? _asset;
  bool _busy = false;

  bool get _hasImage => _image != null || _asset != null;

  @override
  void initState() {
    super.initState();
    _image = widget.initialImage;
    _asset = widget.initialAsset;
  }

  Future<void> _showPickerSheet() async {
    if (_busy || !widget.enabled) return;

    final action = await showModalBottomSheet<_PhotoAction>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          decoration: const BoxDecoration(
            color: Color(0xFFFDFBF5),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0DACB),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const Text(
                  'Profile Picture',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Popp',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 18),
                _PickerOptionTile(
                  icon: Icons.photo_library_outlined,
                  label: 'Choose from Gallery',
                  onTap: () => Navigator.pop(
                    sheetContext,
                    _PhotoAction.gallery,
                  ),
                ),
                const SizedBox(height: 12),
                _PickerOptionTile(
                  icon: Icons.camera_alt_outlined,
                  label: 'Take a Photo',
                  onTap: () => Navigator.pop(
                    sheetContext,
                    _PhotoAction.camera,
                  ),
                ),
                if (_hasImage) ...[
                  const SizedBox(height: 12),
                  _PickerOptionTile(
                    icon: Icons.delete_outline,
                    label: 'Remove Photo',
                    iconColor: Colors.redAccent,
                    onTap: () => Navigator.pop(
                      sheetContext,
                      _PhotoAction.remove,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );

    if (!mounted || action == null || !widget.enabled) return;

    if (action == _PhotoAction.remove) {
      setState(() {
        _image = null;
        _asset = null;
      });
      widget.onImageSelected?.call(null);
      return;
    }

    await _pickImage(
      action == _PhotoAction.camera
          ? ImageSource.camera
          : ImageSource.gallery,
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    setState(() => _busy = true);

    try {
      final picked = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1000,
      );

      if (!mounted || picked == null) return;

      final file = File(picked.path);

      setState(() {
        _image = file;
        _asset = null;
      });

      widget.onImageSelected?.call(file);
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Could not open the image picker. Please check permissions.',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider? image = _image != null
        ? FileImage(_image!)
        : _asset != null
        ? AssetImage(_asset!)
        : null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          button: true,
          label: 'Edit profile picture',
          child: GestureDetector(
            onTap: widget.enabled && !_busy
                ? _showPickerSheet
                : null,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.backgroundColor,
                border: Border.all(
                  color: widget.ringColor,
                  width: 1,
                ),
              ),
              child: ClipOval(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (image != null)
                      Image(
                        image: image,
                        fit: BoxFit.cover,
                        errorBuilder: (_, error, stackTrace) =>
                            Icon(
                              Icons.person,
                              color: widget.iconColor,
                              size: widget.size * 0.5,
                            ),
                      ),
                    if (image != null && widget.showCameraOverlay)
                      ColoredBox(
                        color: Colors.black.withValues(alpha: 0.25),
                      ),
                    if (image == null || widget.showCameraOverlay)
                      Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: widget.iconColor,
                          size: widget.size * 0.27,
                        ),
                      ),
                    if (_busy)
                      const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          _hasImage ? widget.changeLabel : widget.label,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'Popp',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _PickerOptionTile extends StatelessWidget {
  const _PickerOptionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor = const Color(0xFF306C3F),
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF6F2E6),
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 19),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Popp',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
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