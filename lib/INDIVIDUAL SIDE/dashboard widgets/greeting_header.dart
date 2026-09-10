import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../main_screens/dashboard_items/notification_screen.dart';
import 'app_palette.dart';

class GreetingHeader extends StatelessWidget {
  final String name;
  final String date;
  final String avatarAsset;
  final VoidCallback? onBellTap;

  const GreetingHeader({
    super.key,
    required this.name,
    required this.date,
    required this.avatarAsset,
    this.onBellTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            avatarAsset,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 48,
              height: 48,
              color: AppPalette.cream,
              alignment: Alignment.center,
              child: const Icon(Icons.person, color: AppPalette.green),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning $name!',
                style: const TextStyle(
                  fontSize: 19,fontFamily: "pops",
                  fontWeight: FontWeight.w800,
                  color: AppPalette.text,
                ),
              ),
              const SizedBox(height: 2),
              Text(date, style: const TextStyle(fontSize: 12.5,fontFamily: "pop",fontWeight: FontWeight.w800, color: AppPalette.muted)),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){Get.to(()=>NotificationsScreen());},
          child: Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.green),
            child: const Icon(Icons.notifications, color: Colors.white, size: 22),
          ),
        ),
      ],
    );
  }
}
