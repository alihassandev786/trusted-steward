import 'package:get/get.dart';

class BottomnavigationController extends GetxController {
  static BottomnavigationController get to => Get.find();

  /// CURRENT SELECTED TAB INDEX
  final RxInt selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}