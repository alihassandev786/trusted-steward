import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

/// Holds the bottom-nav's currently selected tab index.
/// Any screen (even one nested inside MainScreen) can call
/// `Get.find<MainScreenController>().changeTab(2)` to switch tabs
/// WITHOUT pushing a new MainScreen on top of the navigator stack.
class MainScreenController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    // Same tab dobara tap karne par kuch na karein — na rebuild,
    // na koi possible race condition.
    if (currentIndex.value == index) return;

    // 🔑 Normal taps hamesha idle phase mein hote hain (build ke
    // bahar) — un ke liye turant update karna 100% safe hai aur
    // koi lag mehsoos nahi hota. Sirf us rare situation mein delay
    // karte hain jab yeh call kisi widget ke build/layout/paint
    // cycle ke *dauran* trigger ho jaye (jaisa IndexedStack ke sath
    // ho sakta hai) — tab hi "called during build" error ka khatra
    // hota hai, aur sirf tab hi hum agle frame tak wait karte hain.
    final phase = SchedulerBinding.instance.schedulerPhase;
    final isMidBuild = phase == SchedulerPhase.persistentCallbacks ||
        phase == SchedulerPhase.midFrameMicrotasks;

    if (isMidBuild) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        currentIndex.value = index;
      });
    } else {
      currentIndex.value = index;
    }
  }
}