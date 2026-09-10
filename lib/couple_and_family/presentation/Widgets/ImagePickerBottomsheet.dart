import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/appcolors.dart';
import 'MediaqueryHelperfile.dart';

class ImagePickerBottomSheet {
  static void show({
    required VoidCallback onCameraTap,
    required VoidCallback onGalleryTap,
  }) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width * 0.05,
          vertical: AppSize.height * 0.025,
        ),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// HANDLE BAR
            Container(
              width: AppSize.width * 0.14,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.primary2.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            SizedBox(height: AppSize.height * 0.02),

            /// TITLE
            Text(
              "Select Image Source",
              style: TextStyle(
                fontFamily: "pb",
                fontSize: AppSize.width * 0.05,
                fontWeight: FontWeight.bold,
                color: AppColors.primary2,
              ),
            ),

            SizedBox(height: AppSize.height * 0.03),

            Row(
              children: [
                /// CAMERA & GALLERY
                _buildOption(
                  icon: Icons.camera_alt_rounded,
                  label: "Camera",
                  onTap: () {
                    Get.back();
                    onCameraTap();
                  },
                ),
                SizedBox(width: AppSize.width * 0.04),
                _buildOption(
                  icon: Icons.photo_library_rounded,
                  label: "Gallery",
                  onTap: () {
                    Get.back();
                    onGalleryTap();
                  },
                ),
              ],
            ),
            SizedBox(height: AppSize.height * 0.02),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      isDismissible: true,
    );
  }

  static Widget _buildOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppSize.height * 0.022),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.secondary1.withOpacity(0.8), width: 1.5),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: AppSize.width * 0.07,
                backgroundColor: AppColors.secondary1,
                child: Icon(icon, color: AppColors.primary2, size: AppSize.width * 0.075),
              ),
              SizedBox(height: AppSize.height * 0.012),
              Text(
                label,
                style: TextStyle(
                  fontFamily: "pb",
                  fontSize: AppSize.width * 0.04,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}