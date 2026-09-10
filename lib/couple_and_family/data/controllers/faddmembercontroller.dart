import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';

class FamilyMemberData {
  final String id;
  final String name;
  final String role;
  final String designation;
  final String imagePath;

  FamilyMemberData({
    required this.id,
    required this.name,
    required this.role,
    required this.designation,
    required this.imagePath,
  });
}

class FamilyStewardshipController extends GetxController {
  static FamilyStewardshipController get to => Get.find();

  final String title = "Family Stewardship";
  final String addMemberBtnText = "+ Add Member";

  /// GUARDIANS LIST
  final RxList<FamilyMemberData> guardians = <FamilyMemberData>[
    FamilyMemberData(
      id: "1",
      name: "Sarah (Guardian)",
      role: "Guardian",
      designation: "Head of Household",
      imagePath: "assets/images/home1.png",
    ),
    FamilyMemberData(
      id: "2",
      name: "David John (Guardian)",
      role: "Guardian",
      designation: "Spouse",
      imagePath: "assets/images/home1.png",
    ),
  ].obs;

  /// JUNIORS LIST
  final RxList<FamilyMemberData> juniors = <FamilyMemberData>[
    FamilyMemberData(
      id: "3",
      name: "James Sterling",
      role: "Junior",
      designation: "Junior Member",
      imagePath: "assets/images/home1.png",
    ),
  ].obs;

  /// ADD MEMBER ACTION
  void addMember() {
    AppNavigator.pushRight(AppRoutes.addfamilymember);
    // Add Member logic or navigation
  }

  /// MEMBER TAP ACTION
  void onMemberTap(FamilyMemberData member) {
    // Navigate to Member details / permissions page
  }
}