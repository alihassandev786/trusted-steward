import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/appcolors.dart';
import '../../../data/controllers/bottomnavigationcontroller.dart';
import 'homesection/homescreen.dart';
import 'learnsection/learn.dart';
import 'timesection/time.dart';
import 'treasuresection/treasure.dart';
import 'profilesection/profile.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  late BottomnavigationController controller;

  static const List<Widget> _pages = [
    Homescreen(),
    Time(),
    Treasure(),
    Learn(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();

    controller = Get.isRegistered<BottomnavigationController>()
        ? Get.find<BottomnavigationController>()
        : Get.put(BottomnavigationController());

    // Screen open hote hi Home tab show hoga
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
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "",
            ),
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