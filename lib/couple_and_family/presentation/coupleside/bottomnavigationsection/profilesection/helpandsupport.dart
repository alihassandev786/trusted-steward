import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Textfield.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/helpandsupportcontroller.dart';
import '../../../Widgets/Customtile.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';

class Helpandsupport extends StatefulWidget {
  const Helpandsupport({super.key});

  @override
  State<Helpandsupport> createState() => _HelpandsupportState();
}

class _HelpandsupportState extends State<Helpandsupport> {
  final controller = Get.put(HelpSupportController());
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.heightPercent(0.02)),

              /// HEADER (BACK BUTTON + TITLE)
              Row(
                children: [
                  CustomBackButton(),
                  SizedBox(width: AppSize.widthPercent(0.035)),
                  Expanded(
                    child: Text(
                      controller.pageTitle,
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.058),
                        color: AppColors.textcolor1,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.05)),

              /// HERO ICON
              Center(
                child: IconCircle(
                  icon: Icons.shield,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.primary1,
                  opacity: 1,
                  height: AppSize.widthPercent(0.25),
                  width: AppSize.widthPercent(0.25),
                  iconSize: AppSize.widthPercent(0.12),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.028)),

              /// HEADING
              Center(
                child: Text(
                  controller.heading,
                  style: TextStyle(
                    fontFamily: "pb",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.widthPercent(0.048),
                    color: AppColors.textcolor1,
                  ),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.023)),
              CustomTextField(
                hintText: "Search any kind of help you need...",
                prefixIcon: Icon(Icons.search),
                hintTextSize: AppSize.height*0.013,
                prefixIconColor: AppColors.primary1,
              ),
              SizedBox(height: AppSize.heightPercent(0.04)),

              /// LIST (CustomTile)
              ...controller.items.map(
                    (item) => Padding(
                  padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.01)),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: AppShadows.boxShadow,
                      borderRadius: BorderRadius.circular(AppSize.height * 0.03)
                    ),
                    child: CustomTile(
                      onTap: item.onTap,
                      height: AppSize.height * 0.088,
                      title: item.title,
                      titleSize: AppSize.height * 0.018,
                      borderRadius: AppSize.height * 0.03,
                      backgroundColor: AppColors.secondary1,
                      titleColor: AppColors.textcolor1,
                      subtitleColor: AppColors.textcolor2,
                      leading: IconCircle(
                        icon: item.icon,
                        iconColor: AppColors.primary1,
                        backgroundColor: AppColors.primary1,
                        height: AppSize.widthPercent(0.11),
                        width: AppSize.widthPercent(0.11),
                        iconSize: AppSize.widthPercent(0.045),
                      ),
                      trailing: Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.primary1,
                        size: AppSize.widthPercent(0.08),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.02)),
            ],
          ),
        ),
      ),
    );
  }
}