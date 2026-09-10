import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';

import '../../../../../core/theme/appcolors.dart';
import '../../../../Widgets/MediaqueryHelperfile.dart';




/// SHARED LEGAL CONTENT LAYOUT
/// Used by both Privacy Policy and Terms & Conditions screens,
/// keeping a single reusable UI while each screen only supplies
/// its own title + body text (pulled from the shared controller).
class LegalContentScreen extends StatelessWidget {
  final String title;
  final String body;

  const LegalContentScreen({
    super.key,
    required this.title,
    required this.body,
  });

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
                      title,
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

              SizedBox(height: AppSize.heightPercent(0.045)),

              /// BODY TEXT
              Text(
                body,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.widthPercent(0.042),
                  color: AppColors.textcolor1,
                  height: 1.5,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.04)),
            ],
          ),
        ),
      ),
    );
  }
}