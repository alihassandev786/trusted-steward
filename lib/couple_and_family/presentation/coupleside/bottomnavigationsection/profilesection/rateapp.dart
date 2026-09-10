import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Button.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/rateappcontroller.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';




class Rateapp extends StatefulWidget {
  const Rateapp({super.key});

  @override
  State<Rateapp> createState() => _RateappState();
}

class _RateappState extends State<Rateapp> {
  final controller = Get.put(RateAppController());
  final TextEditingController _feedbackController = TextEditingController();
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = controller.initialRating;
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
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
                    Text(
                      controller.pageTitle,
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.058),
                        color: AppColors.textcolor1,
                      ),
                    ),
                  ],
                ),
          
                SizedBox(height: AppSize.heightPercent(0.09)),
          
                /// STAR RATING
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(controller.maxRating, (index) {
                    final starIndex = index + 1;
                    final filled = starIndex <= _rating;
                    return InkWell(
                      onTap: () => setState(() => _rating = starIndex),
                      borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.02)),
                        child: Icon(
                          filled ? Icons.star_rounded : Icons.star_border_rounded,
                          color: AppColors.primary1,
                          size: AppSize.widthPercent(0.13),
                        ),
                      ),
                    );
                  }),
                ),
          
                SizedBox(height: AppSize.heightPercent(0.07)),
          
                /// HEADING
                Align(
                  alignment: Alignment.center,
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
          
                SizedBox(height: AppSize.heightPercent(0.025)),
          
                /// FEEDBACK TEXT FIELD
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.widthPercent(0.05),
                    vertical: AppSize.heightPercent(0.02),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: AppShadows.boxShadow,
                    color: AppColors.secondary1,
                    borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
                  ),
                  child: TextField(
                    controller: _feedbackController,
                    maxLines: 6,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.04),
                      color: AppColors.textcolor1,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: controller.feedbackHint,
                      hintStyle: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.034),
                        color: AppColors.textcolor2,
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: AppSize.heightPercent(0.04)),
                CustomButton(title: controller.submitLabel, onTap: (){
                  Get.back();
                })
            ],
            ),
          ),
        ),
      ),
    );
  }
}