import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Circular "Add Profile picture" widget used on the Complete Profile
/// screen. Tapping it opens a themed bottom sheet letting the user pick
/// an image from the gallery or take a new photo with the camera.
///
/// Add this to pubspec.yaml:
///   dependencies:
///     image_picker: ^1.1.2
class ProfilePhotoPicker extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Color ringColor;
  final Color iconColor;
  final String label;
  final String changeLabel;
  final ValueChanged<File?>? onImageSelected;

  const ProfilePhotoPicker({
    super.key,
    this.size = 96,
    this.backgroundColor = const Color(0xFF2B5A3B),
    this.ringColor = const Color(0xFF4C8362),
    this.iconColor = Colors.white,
    this.label = 'Add Profile picture',
    this.changeLabel = 'Change Profile picture',
    this.onImageSelected,
  });

  @override
  State<ProfilePhotoPicker> createState() => _ProfilePhotoPickerState();
}

class _ProfilePhotoPickerState extends State<ProfilePhotoPicker> {
  final _picker = ImagePicker();
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    Navigator.of(context).pop(); // close the sheet first
    final picked = await _picker.pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1000,
    );
    if (picked == null) return;
    setState(() => _image = File(picked.path));
    widget.onImageSelected?.call(_image);
  }

  void _showPickerSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        decoration: const BoxDecoration(
          color: Color(0xFFFDFBF5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
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
                fontFamily: 'pops',
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 18),
            _PickerOptionTile(
              icon: Icons.photo_library_outlined,
              label: 'Choose from Gallery',
              onTap: () => _pickImage(ImageSource.gallery),
            ),
            const SizedBox(height: 12),
            _PickerOptionTile(
              icon: Icons.camera_alt_outlined,
              label: 'Take a Photo',
              onTap: () => _pickImage(ImageSource.camera),
            ),
            if (_image != null) ...[
              const SizedBox(height: 12),
              _PickerOptionTile(
                icon: Icons.delete_outline,
                label: 'Remove Photo',
                iconColor: Colors.redAccent,
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() => _image = null);
                  widget.onImageSelected?.call(null);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: _showPickerSheet,
          child: Container(
            width: w *0.6,
            height: h*0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.backgroundColor,

            ),
            child: _image != null
                ? ClipOval(
              child: Image.file(
                _image!,
                width: widget.size,
                height: widget.size*1,
                fit: BoxFit.cover,
              ),
            )
                : Icon(
              Icons.camera_alt,
              color: widget.iconColor,
              size: widget.size * 0.36,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _image != null ? widget.changeLabel : widget.label,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'pop',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _PickerOptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color iconColor;

  const _PickerOptionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor = const Color(0xFF306C3F),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F2E6),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 19),
            ),
            const SizedBox(width: 14),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'pop',
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}