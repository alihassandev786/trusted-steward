import 'package:flutter/material.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';

class Flearn extends StatefulWidget {
  const Flearn({super.key});

  @override
  State<Flearn> createState() => _FlearnState();
}

class _FlearnState extends State<Flearn> {
  int _selectedIndex = 3;

  /// FAMILY PROGRESS DATA
  final List<_FamilyProgressData> _familyProgress = [
    _FamilyProgressData(
      name: "David (Guardian)",
      subtitle: "4/5 Modules",
      image: "assets/images/home1.png",
    ),
    _FamilyProgressData(
      name: "Sarah (Guardian)",
      subtitle: "Completed Sep 20",
      image: "assets/images/home1.png",
    ),
  ];

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

              /// SCREEN TITLE
              Text(
                "Learn Dashboard",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.058),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// CONTINUE LESSON CARD
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.secondary1,
                    boxShadow: AppShadows.boxShadow,
                    borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.07),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.widthPercent(0.07)),
                        topRight: Radius.circular(AppSize.widthPercent(0.07)),
                      ),
                      child: Image.asset(
                        "assets/images/home2.png",
                        height: AppSize.heightPercent(0.24),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppSize.widthPercent(0.05)),
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
                          SizedBox(height: AppSize.heightPercent(0.006)),
                          Text(
                            "The Parable of the Talents",
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
                                child: _ProgressBar(
                                  percent: 0.65,
                                  color: AppColors.warning,
                                ),
                              ),
                              SizedBox(width: AppSize.widthPercent(0.03)),
                              Text(
                                "65%",
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.034),
                                  color: AppColors.textcolor2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.heightPercent(0.025)),
                          CustomButton(
                            title: "Continue Lesson",
                            onTap: () {
                              AppNavigator.pushRight(AppRoutes.coursedetail);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// FAMILY PROGRESS SECTION
              Text(
                "Family Progress",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.045),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.015)),

              ...List.generate(_familyProgress.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: AppSize.heightPercent(0.012),
                  ),
                  child: _FamilyProgressTile(data: _familyProgress[index]),
                );
              }),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// RECOMMENDED FOR US SECTION
              Text(
                "Recommended For Us",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.045),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.018)),

              SizedBox(
                height: AppSize.heightPercent(0.28),
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

              SizedBox(height: AppSize.heightPercent(0.03)),
            ],
          ),
        ),
      ),
    );
  }
}

/// FAMILY PROGRESS DATA MODEL
class _FamilyProgressData {
  final String name;
  final String subtitle;
  final String image;

  _FamilyProgressData({
    required this.name,
    required this.subtitle,
    required this.image,
  });
}

/// FAMILY PROGRESS TILE
class _FamilyProgressTile extends StatelessWidget {
  final _FamilyProgressData data;

  const _FamilyProgressTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSize.heightPercent(0.022),
        horizontal: AppSize.widthPercent(0.05),
      ),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.08)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSize.widthPercent(0.06),
            backgroundImage: AssetImage(data.image),
          ),
          SizedBox(width: AppSize.widthPercent(0.035)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.038),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.003)),
              Text(
                data.subtitle,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.widthPercent(0.031),
                  color: AppColors.textcolor2,
                ),
              ),
            ],
          ),
        ],
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
      width: AppSize.widthPercent(0.48),
      decoration: BoxDecoration(
        color: AppColors.secondary1,
          boxShadow: AppShadows.boxShadow,
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
              height: AppSize.heightPercent(0.165),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSize.widthPercent(0.035)),
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
                SizedBox(height: AppSize.heightPercent(0.012)),
                Text(
                  data.title,
                  style: TextStyle(
                    fontFamily: "pb",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.widthPercent(0.036),
                    color: AppColors.textcolor1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppSize.heightPercent(0.005)),
                Text(
                  data.subtitle,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.03),
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
        minHeight: AppSize.heightPercent(0.008),
        backgroundColor: AppColors.textcolor2.withOpacity(0.25),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}