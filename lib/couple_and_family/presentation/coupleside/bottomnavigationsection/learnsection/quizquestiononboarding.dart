import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/quizonboardingcontroller.dart';
import '../../../Widgets/Backbutton.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';


class Quizquestiononboarding extends StatelessWidget {
  const Quizquestiononboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FinancialTreasureController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.heightPercent(0.02)),

            /// HEADER - FIXED, NEVER MOVES
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
              child: Row(
                children: [
                  CustomBackButton(
                    backgroundColor: AppColors.primary1,
                    iconColor: Colors.white,
                  ),
                  SizedBox(width: AppSize.widthPercent(0.04)),
                  Text(
                    controller.pageTitle,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.065),
                      color: AppColors.textcolor1,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.03)),

            /// "Question X of Y" TEXT - FIXED, ONLY VALUE CHANGES
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
              child: Obx(
                    () => Text(
                  "Question ${controller.currentIndex.value + 1} of ${controller.totalQuestions}",
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.034),
                    color: AppColors.textcolor1.withOpacity(0.8),
                  ),
                ),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.01)),

            /// LINEAR PROGRESS BAR - FIXED, ONLY FILL WIDTH CHANGES
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
              child: Obx(
                    () => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: (controller.currentIndex.value + 1) /
                        controller.totalQuestions,
                    minHeight: AppSize.heightPercent(0.012),
                    backgroundColor: Color(0xff888888),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xffD1A436),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.025)),

            /// SLIDING PAGES - ONLY THIS PART MOVES
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.totalQuestions,
                itemBuilder: (context, pageIndex) {
                  final question = controller.questions[pageIndex];

                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// QUESTION CARD
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(AppSize.widthPercent(0.04)),
                          decoration: BoxDecoration(
                            boxShadow: AppShadows.boxShadow,
                            color: AppColors.secondary1,
                            borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: AppSize.widthPercent(0.05),
                                backgroundColor: AppColors.primary1.withOpacity(0.25),
                                child: Text(
                                  "${pageIndex + 1}",
                                  style: TextStyle(
                                    fontFamily: "pb",
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.widthPercent(0.045),
                                    color: AppColors.primary1,
                                  ),
                                ),
                              ),
                              SizedBox(width: AppSize.widthPercent(0.035)),
                              Expanded(
                                child: Text(
                                  question.question,
                                  style: TextStyle(
                                    fontFamily: "pb",
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.widthPercent(0.04),
                                    color: AppColors.textcolor1,
                                    height: 1.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: AppSize.heightPercent(0.03)),

                        /// OPTIONS
                        Obx(
                              () => Column(
                            children: List.generate(
                              question.options.length,
                                  (optionIndex) => Padding(
                                padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.01)),
                                child: _OptionTile(
                                  text: question.options[optionIndex],
                                  selected: controller.selectedOptions[pageIndex].value ==
                                      optionIndex,
                                  onTap: () =>
                                      controller.selectOption(pageIndex, optionIndex),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// BOTTOM SECTION - FIXED, ONLY BUTTON LABEL CHANGES ON LAST QUESTION
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
              child: Column(
                children: [
                  Obx(
                        () => CustomButton(
                      title: controller.currentIndex.value ==
                          controller.totalQuestions - 1
                          ? "Finish"
                          : "Next Question",
                      onTap: controller.nextQuestion,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.025)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// SINGLE QUIZ OPTION ROW
class _OptionTile extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _OptionTile({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.widthPercent(0.045),
          vertical: AppSize.heightPercent(0.02),
        ),
        decoration: BoxDecoration(
          boxShadow: AppShadows.boxShadow,
          color: AppColors.secondary1,
          borderRadius: BorderRadius.circular(AppSize.widthPercent(0.08)),
        ),
        child: Row(
          children: [
            Container(
              height: AppSize.widthPercent(0.06),
              width: AppSize.widthPercent(0.06),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? AppColors.primary1 : Colors.transparent,
                border: Border.all(
                  color: selected ? AppColors.primary1 : AppColors.primary1.withOpacity(0.5),
                  width: 1.5,
                ),
              ),
              child: selected
                  ? Icon(Icons.check_rounded, color: Colors.white, size: AppSize.widthPercent(0.045))
                  : null,
            ),
            SizedBox(width: AppSize.widthPercent(0.04)),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.widthPercent(0.035),
                  color: AppColors.textcolor1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}