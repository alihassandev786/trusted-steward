import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Button.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/editprofilecontroller.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';


class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final controller = Get.put(EditProfileController());

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _countryController;
  late final TextEditingController _timezoneController;

  final List<bool> _editable = [false, false, false, false];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: controller.name);
    _emailController = TextEditingController(text: controller.email);
    _countryController = TextEditingController(text: controller.country);
    _timezoneController = TextEditingController(text: controller.timezone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    _timezoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// GREEN HEADER
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + AppSize.heightPercent(0.035),
                bottom: AppSize.heightPercent(0.035),
                left: AppSize.widthPercent(0.06),
                right: AppSize.widthPercent(0.06),
              ),
              decoration: BoxDecoration(
                boxShadow: AppShadows.boxShadow,
                color: AppColors.primary1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSize.widthPercent(0.14)),
                  bottomRight: Radius.circular(AppSize.widthPercent(0.14)),
                ),
              ),
              child: Column(
                children: [
                  /// BACK BUTTON
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomBackButton(
                      backgroundColor: AppColors.background.withOpacity(0.2),
                    ),
                  ),


                  /// AVATAR WITH CAMERA OVERLAY
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: AppSize.height * 0.155,
                        width: AppSize.height * 0.155,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            controller.avatarImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: AppSize.height * 0.15,
                        width: AppSize.height * 0.15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.15),
                        ),
                      ),
                      Icon(
                        Icons.camera_alt_rounded,
                        color: AppColors.background,
                        size: AppSize.widthPercent(0.07),
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.heightPercent(0.015)),

                  /// EDIT PROFILE PICTURE LABEL
                  Text(
                    controller.editPictureLabel,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.035),
                      color: AppColors.background,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.heightPercent(0.05)),

                  /// EDITABLE FIELDS
                  _EditableField(
                    controller: _nameController,
                    isEditing: _editable[0],
                    keyboardType: TextInputType.name,
                    onEditTap: () => setState(() => _editable[0] = !_editable[0]),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.01)),

                  _EditableField(
                    controller: _emailController,
                    isEditing: _editable[1],
                    keyboardType: TextInputType.emailAddress,
                    onEditTap: () => setState(() => _editable[1] = !_editable[1]),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.01)),

                  _EditableField(
                    controller: _countryController,
                    isEditing: _editable[2],
                    keyboardType: TextInputType.text,
                    onEditTap: () => setState(() => _editable[2] = !_editable[2]),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.01)),

                  _EditableField(
                    controller: _timezoneController,
                    isEditing: _editable[3],
                    keyboardType: TextInputType.text,
                    onEditTap: () => setState(() => _editable[3] = !_editable[3]),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.04)),

                  /// SAVE CHANGES BUTTON
                  CustomButton(title: controller.saveLabel, onTap: (){
                    Get.back();
                  }),
                  SizedBox(height: AppSize.heightPercent(0.03)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// EDITABLE FIELD PILL (TEXT + EDIT PENCIL ICON)
class _EditableField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEditing;
  final TextInputType keyboardType;
  final VoidCallback onEditTap;

  const _EditableField({
    required this.controller,
    required this.isEditing,
    required this.keyboardType,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthPercent(0.06),
        vertical: AppSize.heightPercent(0.021),
      ),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.07)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              readOnly: !isEditing,
              keyboardType: keyboardType,
              autofocus: isEditing,
              style: TextStyle(
                fontFamily: "pb",
                fontWeight: FontWeight.bold,
                fontSize: AppSize.widthPercent(0.039),
                color: AppColors.textcolor1,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          InkWell(
            onTap: onEditTap,
            child: Padding(
              padding: EdgeInsets.all(AppSize.widthPercent(0.02)),
              child: Icon(
                isEditing ? Icons.check_rounded : Icons.edit_outlined,
                color: AppColors.primary1,
                size: AppSize.widthPercent(0.055),
              ),
            ),
          ),
        ],
      ),
    );
  }
}