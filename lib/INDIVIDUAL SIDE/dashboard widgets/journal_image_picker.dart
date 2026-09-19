import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../teasure_dasbord_widgets/finance_theme.dart';
import 'journel_wedgits.dart';

class JournalImagePicker extends StatefulWidget {
  const JournalImagePicker({super.key, this.sampleImage = true});

  final bool sampleImage;

  @override
  State<JournalImagePicker> createState() => _JournalImagePickerState();
}

class _JournalImagePickerState extends State<JournalImagePicker> {
  final ImagePicker _picker = ImagePicker();

  XFile? _selectedImage;

  bool get showSample => _selectedImage == null && widget.sampleImage;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _showPicker() {
    showModalBottomSheet(
      context: context,

      backgroundColor: journalCardColor,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),

      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              ListTile(
                leading: const Icon(
                  Icons.photo_library_outlined,
                  color: journalGreen,
                ),

                title: const Text("Gallery"),

                onTap: () {
                  Navigator.pop(context);

                  _pickImage(ImageSource.gallery);
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.camera_alt_outlined,
                  color: journalGreen,
                ),

                title: const Text("Camera"),

                onTap: () {
                  Navigator.pop(context);

                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _imagePreview() {
    if (_selectedImage != null) {
      return ClipOval(
        child: Image.file(
          File(_selectedImage!.path),

          width: 32,

          height: 32,

          fit: BoxFit.cover,
        ),
      );
    }

    return const ClipOval(child: JournalPhoto());
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: JournalDashedBorder(),

      child: Padding(
        padding: const EdgeInsets.all(22),

        child: Column(
          children: [
            const CircleAvatar(
              radius: 20,

              backgroundColor: Color(0xFFBDCEB8),

              child: Icon(
                Icons.photo_library_outlined,

                color: journalGreen,

                size: 19,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Attach media (Optional)',

              style: FinanceText.subheading(size: 15),
            ),

            const SizedBox(height: 26),

            Container(
              padding: const EdgeInsets.fromLTRB(18, 17, 8, 17),

              decoration: BoxDecoration(
                color: journalYellow,

                borderRadius: BorderRadius.circular(30),
              ),

              child: Row(
                children: [
                  SizedBox(width: 32, height: 32, child: _imagePreview()),

                  const SizedBox(width: 9),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          _selectedImage == null
                              ? "Morning Scripture"
                              : "Uploaded Photo",

                          style: FinanceText.subheading(size: 14),
                        ),

                        Text(
                          _selectedImage == null
                              ? "1.8MB. High Fidelity Photo"
                              : _selectedImage!.name,

                          style: FinanceText.body(
                            size: 11,

                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: _showPicker,

                    icon: const Icon(
                      Icons.edit_outlined,

                      color: journalGreen,

                      size: 19,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedImage = null;
                      });
                    },

                    icon: const Icon(
                      Icons.delete,

                      color: Color(0xFFC82121),

                      size: 19,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
