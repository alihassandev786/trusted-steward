import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/fhomesection/fhome.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/flearnsection/flearn.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/fprofilesection/fprofile.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/ftime.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/ftreasuresection/ftreasure.dart';

import '../../../core/theme/appcolors.dart';
import '../../../data/controllers/bottomnavigationcontroller.dart';

class Fbottomnavigation extends StatefulWidget {
  const Fbottomnavigation({super.key});

  @override
  State<Fbottomnavigation> createState() => _FbottomnavigationState();
}

class _FbottomnavigationState extends State<Fbottomnavigation> {
  late BottomnavigationController controller;

  static const List<Widget> _pages = [
    Fhome(),
    Ftime(),
    Ftreasure(),
    Flearn(),
    Fprofile(),
  ];

  @override
  void initState() {
    super.initState();

    controller = Get.isRegistered<BottomnavigationController>()
        ? Get.find<BottomnavigationController>()
        : Get.put(BottomnavigationController());

    // Har dafa Fbottomnavigation open ho to Home tab show ho.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: _pages,
        ),
      ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.background,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          selectedItemColor: AppColors.primary1,
          unselectedItemColor: const Color(0xff9C9C9C),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_filled_rounded),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_rounded),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
