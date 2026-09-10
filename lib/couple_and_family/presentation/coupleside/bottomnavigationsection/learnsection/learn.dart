import 'package:flutter/material.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Button.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';


class Learn extends StatefulWidget {
  const Learn({super.key});

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  /// RECOMMENDED FOR US DATA
  final List<_RecommendedData> _recommended = [
    _RecommendedData(
      image: "assets/images/home2.png",
      tag: "New Release",
      title: "The Heart of Giving",
      subtitle: "4 Lessons - 45 mins",
    ),
    _RecommendedData(
      image: "assets/images/home2.png",
      tag: "Popular",
      title: "Time for God",
      subtitle: "6 Lessons - 45 mins",
    ),
  ];

  /// COMPLETED TOGETHER DATA
  final List<_CompletedData> _completed = [
    _CompletedData(
      title: "Budget Basics",
      completedOn: "Completed Oct 22",
    ),
    _CompletedData(
      title: "Navigating Big Purchase",
      completedOn: "Completed Sep 20",
    ),
  ];

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

              /// TITLE
              Text(
                "Learn Dashboard",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.058),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// CONTINUE LESSON CARD
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: AppColors.secondary1,
                  borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.widthPercent(0.06)),
                        topRight: Radius.circular(AppSize.widthPercent(0.06)),
                      ),
                      child: Image.asset(
                        "assets/images/home2.png",
                        height: AppSize.heightPercent(0.23),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppSize.widthPercent(0.06)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Module 2",
                            style: TextStyle(
                              fontFamily: "pr",
                              fontSize: AppSize.widthPercent(0.034),
                              color: AppColors.textcolor2,
                            ),
                          ),
                          SizedBox(height: AppSize.heightPercent(0.008)),
                          Text(
                            "Biblical Stewardship 101",
                            style: TextStyle(
                              fontFamily: "pb",
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.widthPercent(0.045),
                              color: AppColors.textcolor1,
                            ),
                          ),
                          SizedBox(height: AppSize.heightPercent(0.02)),
                          Row(
                            children: [
                              Expanded(
                                child: _ProgressBar(percent: 0.65, color: AppColors.warning),
                              ),
                              SizedBox(width: AppSize.widthPercent(0.025)),
                              Text(
                                "65%",
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.036),
                                  color: AppColors.textcolor2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.heightPercent(0.025)),
                        CustomButton(title: "Continue Lesson", onTap: (){
                          AppNavigator.pushRight(AppRoutes.coursedetail);
                        })
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.028)),

              /// RECOMMENDED FOR US
              Text(
                "Recommended For Us",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.045),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.028)),

              SizedBox(
                height: AppSize.heightPercent(0.319),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _recommended.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: AppSize.widthPercent(0.035)),
                  itemBuilder: (context, index) {
                    return _RecommendedCard(data: _recommended[index]);
                  },
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.04)),

              /// COMPLETED TOGETHER
              Text(
                "Completed Together",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.045),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.022)),

              ...List.generate(_completed.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.012)),
                  child: _CompletedTile(data: _completed[index]),
                );
              }),

              SizedBox(height: AppSize.heightPercent(0.03)),
            ],
          ),
        ),
      ),
    );
  }
}

/// RECOMMENDED CARD DATA MODEL
class _RecommendedData {
  final String image;
  final String tag;
  final String title;
  final String subtitle;

  _RecommendedData({
    required this.image,
    required this.tag,
    required this.title,
    required this.subtitle,
  });
}

/// RECOMMENDED CARD
class _RecommendedCard extends StatelessWidget {
  final _RecommendedData data;

  const _RecommendedCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height*0.319,
      width: AppSize.widthPercent(0.48),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.widthPercent(0.06)),
              topRight: Radius.circular(AppSize.widthPercent(0.06)),
            ),
            child: Image.asset(
              data.image,
              height: AppSize.heightPercent(0.167),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.03),vertical: AppSize.widthPercent(0.05)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.tag,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.03),
                    color: AppColors.textcolor2,
                  ),
                ),
                SizedBox(height: AppSize.heightPercent(0.02)),
                Text(
                  data.title,
                  style: TextStyle(
                    fontFamily: "pb",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.widthPercent(0.035),
                    color: AppColors.textcolor1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppSize.heightPercent(0.008)),
                Text(
                  data.subtitle,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.029),
                    color: AppColors.textcolor2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// COMPLETED TOGETHER DATA MODEL
class _CompletedData {
  final String title;
  final String completedOn;

  _CompletedData({required this.title, required this.completedOn});
}

/// COMPLETED TOGETHER TILE
class _CompletedTile extends StatelessWidget {
  final _CompletedData data;

  const _CompletedTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSize.widthPercent(0.05),
        horizontal: AppSize.widthPercent(0.05),
      ),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.07)),
      ),
      child: Row(
        children: [
          IconCircle(
            icon: Icons.workspace_premium_outlined,
            iconColor: AppColors.primary1,
            backgroundColor: AppColors.primary1,
            height: AppSize.widthPercent(0.105),
            width: AppSize.widthPercent(0.105),
            iconSize: AppSize.widthPercent(0.05),
          ),
          SizedBox(width: AppSize.widthPercent(0.03)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                    fontFamily: "pb",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.widthPercent(0.038),
                    color: AppColors.textcolor1,
                  ),
                ),
                SizedBox(height: AppSize.heightPercent(0.004)),
                Text(
                  data.completedOn,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.029),
                    color: AppColors.textcolor2,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              "Review",
              style: TextStyle(
                fontFamily: "pm",
                fontWeight: FontWeight.w600,
                fontSize: AppSize.widthPercent(0.032),
                color: AppColors.primary1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// LINEAR PROGRESS BAR
class _ProgressBar extends StatelessWidget {
  final double percent;
  final Color color;

  const _ProgressBar({required this.percent, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: percent,
        minHeight: AppSize.heightPercent(0.012),
        backgroundColor: const Color(0xffB0B0B0),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}