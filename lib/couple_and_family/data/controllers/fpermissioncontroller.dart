import 'package:get/get.dart';

class PermissionItemData {
  final String id;
  final String title;
  final String description;
  RxBool isEnabled;

  PermissionItemData({
    required this.id,
    required this.title,
    required this.description,
    bool isEnabled = false,
  }) : isEnabled = isEnabled.obs;
}

class FamilyPermissionsController extends GetxController {
  static FamilyPermissionsController get to => Get.find();

  /// HEADER DATA
  final String avatarImage = "assets/images/home1.png";
  final String userName = "Jamson Bold";
  final String userBadge = "You";

  /// PERMISSIONS LIST
  final List<PermissionItemData> permissions = [
    PermissionItemData(
      id: "tasks",
      title: "Family Tasks",
      description: "View and claim household chores",
      isEnabled: true,
    ),
    PermissionItemData(
      id: "goals",
      title: "Family Goals",
      description: "Contribute to shared savings targets",
      isEnabled: true,
    ),
    PermissionItemData(
      id: "learning",
      title: "Learning Content",
      description: "Access financial literacy modules",
      isEnabled: true,
    ),
    PermissionItemData(
      id: "journal",
      title: "Journal & Reflection",
      description: "Record thoughts on financial lessons",
      isEnabled: false,
    ),
    PermissionItemData(
      id: "allowance",
      title: "Pocket Money Account",
      description: "Manage perosnal allowance",
      isEnabled: true,
    ),
    PermissionItemData(
      id: "budget",
      title: "Household Budget",
      description: "Restricted to Guardian roles",
      isEnabled: false,
    ),
  ];

  /// TOGGLE PERMISSION
  void togglePermission(int index, bool value) {
    permissions[index].isEnabled.value = value;
  }

  /// SAVE BUTTON ACTION
  void savePermissions() {
    Get.back();
  }
}