import 'package:flutter/material.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Button.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../Widgets/Customtile.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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

              /// HEADER
              Row(
                children: [
                  SizedBox(
                    height: AppSize.widthPercent(0.13),
                    width: AppSize.widthPercent(0.22),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: CircleAvatar(
                            radius: AppSize.widthPercent(0.065),
                            backgroundImage: const AssetImage(
                              "assets/images/home1.png",
                            ),
                          ),
                        ),
                        Positioned(
                          left: AppSize.widthPercent(0.09),
                          child: CircleAvatar(
                            radius: AppSize.widthPercent(0.065),
                            backgroundImage: const AssetImage(
                              "assets/images/home1.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSize.widthPercent(0.015)),
                  Expanded(
                    child: Text(
                      "Good Morning\nDavid & Sarah!",
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.055),
                        color: AppColors.textcolor1,
                        height: 1.15,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppNavigator.pushRight(AppRoutes.notification);
                    },
                    child: IconCircle(
                      icon: Icons.notifications,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.primary1,
                      opacity: 1,
                      height: AppSize.widthPercent(0.13),
                      width: AppSize.widthPercent(0.13),
                      iconSize: AppSize.widthPercent(0.065),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// STEWARDSHIP SCORE CARD
              Container(
                width: double.infinity,
                height: AppSize.height * 0.48,
                padding: EdgeInsets.symmetric(
                  vertical: AppSize.heightPercent(0.02),
                  horizontal: AppSize.widthPercent(0.05),
                ),
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: AppColors.secondary1,
                  borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.05),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Shared with Partner",
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.03),
                        color: AppColors.textcolor2,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.018)),

                    /// SCORE RING
                    SizedBox(
                      height: AppSize.widthPercent(0.36),
                      width: AppSize.widthPercent(0.36),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: AppSize.widthPercent(0.4),
                            width: AppSize.widthPercent(0.4),
                            child: CircularProgressIndicator(
                              value: 885 / 1000,
                              strokeWidth: AppSize.widthPercent(0.02),
                              backgroundColor: AppColors.warning.withOpacity(
                                0.15,
                              ),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.warning,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "885",
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.07),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              Text(
                                "/1000",
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.03),
                                  color: AppColors.textcolor2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSize.heightPercent(0.02)),
                    Text(
                      "Couple Stewardship Score",
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.04),
                        color: AppColors.textcolor1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.004)),
                    Text(
                      "Top 15% of households",
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.03),
                        color: AppColors.textcolor2,
                      ),
                    ),

                    SizedBox(height: AppSize.heightPercent(0.012)),

                    /// TIME / TALENT / TREASURE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _StatIcon(
                          icon: Icons.access_time_rounded,
                          label: "Time",
                        ),
                        _StatIcon(
                          icon: Icons.psychology_outlined,
                          label: "Talent",
                        ),
                        _StatIcon(
                          icon: Icons.badge_outlined,
                          label: "Treasure",
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.height * 0.018),
                    CustomButton(
                      title: "View Details",
                      onTap: () {
                        AppNavigator.pushRight(AppRoutes.stewardscore);
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.028)),

              /// SHARED HOUSEHOLD
              Text(
                "Shared Household",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.04),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.018)),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.height * 0.028),
                  boxShadow: AppShadows.boxShadow,
                ),
                child: CustomTile(
                  height: AppSize.height * 0.105,
                  title: "Shared Budget",
                  subtitle: "85% Utilized",
                  borderRadius: AppSize.height * 0.028,
                  backgroundColor: AppColors.secondary1,
                  titleColor: AppColors.textcolor1,
                  subtitleColor: AppColors.textcolor2,
                  leading: IconCircle(
                    icon: Icons.credit_card_outlined,
                    iconColor: AppColors.primary1,
                    backgroundColor: AppColors.primary1,
                  ),
                  trailing: SizedBox(
                    width: AppSize.widthPercent(0.28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _ProgressBar(percent: 0.85, color: AppColors.warning),
                        SizedBox(height: AppSize.heightPercent(0.006)),
                        Text(
                          "\$ 1,200 left",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.03),
                            color: AppColors.textcolor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.01)),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.height * 0.028),
                  boxShadow: AppShadows.boxShadow,
                ),
                child: CustomTile(
                  title: "Shared Giving",
                  height: AppSize.height * 0.105,
                  subtitle: "Tithe Goal Reached",
                  backgroundColor: AppColors.secondary1,
                  titleColor: AppColors.textcolor1,
                  subtitleColor: AppColors.textcolor2,
                  leading: IconCircle(
                    icon: Icons.volunteer_activism_outlined,
                    iconColor: AppColors.primary1,
                    backgroundColor: AppColors.primary1,
                  ),
                  trailing: SizedBox(
                    width: AppSize.widthPercent(0.28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _ProgressBar(percent: 1, color: AppColors.warning),
                        SizedBox(height: AppSize.heightPercent(0.006)),
                        Text(
                          "100%",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.03),
                            color: AppColors.textcolor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.01)),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.height * 0.028),
                  boxShadow: AppShadows.boxShadow,
                ),                child: CustomTile(
                  title: "Emergency Fund",
                  subtitle: "40% Funded",
                  height: AppSize.height * 0.105,
                  backgroundColor: AppColors.secondary1,
                  titleColor: AppColors.textcolor1,
                  subtitleColor: AppColors.textcolor2,
                  leading: IconCircle(
                    icon: Icons.savings_outlined,
                    iconColor: AppColors.primary1,
                    backgroundColor: AppColors.primary1,
                  ),
                  trailing: SizedBox(
                    width: AppSize.widthPercent(0.28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _ProgressBar(percent: 0.4, color: AppColors.warning),
                        SizedBox(height: AppSize.heightPercent(0.006)),
                        Text(
                          "Goal: \$10K",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.03),
                            color: AppColors.textcolor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// TODAY'S PLAN
              Text(
                "Today's Plan",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.04),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.018)),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.height * 0.028),
                  boxShadow: AppShadows.boxShadow,
                ),                child: CustomTile(
                  title: "Review Monthly Budget",
                  subtitle: "Assigned to Sarah",
                  height: AppSize.height * 0.105,
                  backgroundColor: AppColors.secondary1,
                  titleColor: AppColors.textcolor1,
                  subtitleColor: AppColors.textcolor2,
                  leading: IconCircle(
                    icon: Icons.assignment_outlined,
                    iconColor: AppColors.primary1,
                    backgroundColor: AppColors.primary1,
                  ),
                  trailing: Icon(
                    Icons.people_alt_outlined,
                    color: AppColors.textcolor1,
                    size: AppSize.widthPercent(0.06),
                  ),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// SHARED LEARNING
              Text(
                "Shared Learning",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.04),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.018)),

              Container(
                width: double.infinity,
                height: AppSize.height * 0.37,
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: AppColors.secondary1,
                  borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.05),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSize.widthPercent(0.035),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/home2.png",
                            height: AppSize.heightPercent(0.2),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: AppSize.widthPercent(0.03),
                            bottom: AppSize.widthPercent(0.03),
                            child: IconCircle(
                              icon: Icons.arrow_outward_rounded,
                              iconColor: Colors.white,
                              backgroundColor: AppColors.primary1,
                              opacity: 1,
                              height: AppSize.widthPercent(0.11),
                              width: AppSize.widthPercent(0.11),
                              iconSize: AppSize.widthPercent(0.055),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.025)),
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppSize.widthPercent(0.04),
                      ),
                      child: Text(
                        "Module 3 of 5",
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.03),
                          color: AppColors.textcolor2,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.018)),
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppSize.widthPercent(0.04),
                      ),
                      child: Text(
                        "Biblical Foundations",
                        style: TextStyle(
                          fontFamily: "pb",
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.widthPercent(0.048),
                          color: AppColors.textcolor1,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.018)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.widthPercent(0.04),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: _ProgressBar(
                              percent: 0.65,
                              color: AppColors.warning,
                            ),
                          ),
                          SizedBox(width: AppSize.widthPercent(0.02)),
                          Text(
                            "65%",
                            style: TextStyle(
                              fontFamily: "pr",
                              fontSize: AppSize.widthPercent(0.033),
                              color: AppColors.textcolor2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// QUOTE CARD
              Container(
                width: double.infinity,
                height: AppSize.height * 0.217,
                padding: EdgeInsets.all(AppSize.widthPercent(0.045)),
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: AppColors.primary1,
                  borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.06),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "99",
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.08),
                        color: AppColors.warning,
                      ),
                    ),
                    Text(
                      "Two are better than one,Because they have a good return for their labor.\"",
                      style: TextStyle(
                        fontFamily: "pm",
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.widthPercent(0.038),
                        color: Colors.white,
                        height: 1.35,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.02)),
                    Text(
                      "ECCLESIASTES 4:9",
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.032),
                        color: Colors.white70,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
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

/// TIME / TALENT / TREASURE STAT ITEM
class _StatIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconCircle(
          icon: icon,
          iconColor: AppColors.primary1,
          backgroundColor: AppColors.primary1,
          height: AppSize.height * 0.053,
          width: AppSize.height * 0.053,
          iconSize: AppSize.widthPercent(0.05),
        ),
        SizedBox(height: AppSize.heightPercent(0.006)),
        Text(
          label,
          style: TextStyle(
            fontFamily: "pr",
            fontSize: AppSize.widthPercent(0.03),
            color: AppColors.textcolor2,
          ),
        ),
      ],
    );
  }
}

/// SMALL LINEAR PROGRESS BAR
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
        backgroundColor: const Color(0xffD9D9D9),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
