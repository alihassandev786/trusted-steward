import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/route/approutes.dart';

class FamilySetupController extends GetxController {
  static FamilySetupController get to => Get.find();

  /// Family Account Name Input
  final TextEditingController familyNameController = TextEditingController();

  /// Reactive state variables
  final RxString primaryMemberName = 'Jamson Bold'.obs;
  final RxString primaryMemberRole = 'Primary Member'.obs;

  @override
  void onClose() {
    familyNameController.dispose();
    super.onClose();
  }

  /// Add Guardian Action
  void addGuardian() {
    Get.snackbar(
      "Guardian",
      "Add Guardian action triggered",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// Add Junior Action
  void addJunior() {
    Get.snackbar(
      "Junior",
      "Add Junior action triggered",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
//   /// Continue Button Handler
//   void onContinue() {
//     if (familyNameController.text.trim().isEmpty) {
//       Get.snackbar(
//         "Required",
//         "Please enter a family account name",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }
//
//     // Navigate to next step or dashboard
//     Get.toNamed(AppRoutes.fbottomnavigation);
//   }
// }