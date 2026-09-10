import 'package:get/get.dart';

class AppNavigator {
  AppNavigator._();

  static void pushFade(String page) {
    Get.toNamed(page);
  }

  static void pushRight(String page) {
    Get.toNamed(page);
  }

  static void pushLeft(String page) {
    Get.toNamed(page);
  }

  static void pushUp(String page) {
    Get.toNamed(page);
  }

  static void pushReplace(String page) {
    Get.offNamed(page);
  }

  static void pushAndClear(String page) {
    Get.offAllNamed(page);
  }
}