import 'package:get/get.dart';

class EditProfileController extends GetxController {
  static EditProfileController get to => Get.find();

  /// HEADER
  final String avatarImage = "assets/images/home1.png";
  final String editPictureLabel = "Edit Profile Picture";

  /// EDITABLE FIELDS (INITIAL VALUES)
  final String name = "Alex Peterson";
  final String email = "Alex.peterson@gmail.com";
  final String country = "Unites States";
  final String timezone = "Pacific Time (PT)";

  /// SAVE BUTTON
  final String saveLabel = "Save Changes";
}