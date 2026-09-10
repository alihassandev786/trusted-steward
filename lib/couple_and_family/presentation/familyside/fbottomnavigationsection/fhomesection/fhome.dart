import 'package:flutter/material.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/boxshadow.dart';

import '../../../../core/route/approutes.dart';
import '../../../../core/theme/appcolors.dart';
import '../../../Widgets/AppNavigator.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/iconcircle.dart';

class Fhome extends StatefulWidget {
  const Fhome({super.key});

  @override
  State<Fhome> createState() => _FhomeState();
}

class _FhomeState extends State<Fhome> {
  int _selectedIndex = 0;

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
              SizedBox(height: AppSize.heightPercent(0.015)),

              /// HEADER SECTION
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.widthPercent(0.065),
                    backgroundImage: const AssetImage(
                      "assets/images/home1.png",
                    ),
                  ),
                  SizedBox(width: AppSize.widthPercent(0.03)),
                  Expanded(
                    child: Text(
                      "Good Morning Smith\nFamily!",
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
                      height: AppSize.widthPercent(0.12),
                      width: AppSize.widthPercent(0.12),
                      iconSize: AppSize.widthPercent(0.06),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// STEWARDSHIP SCORE CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: AppSize.heightPercent(0.025),
                  horizontal: AppSize.widthPercent(0.05),
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondary1,
                  borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.06),
                  ),
                  boxShadow: AppShadows.boxShadow
                ),
                child: Column(
                  children: [
                    Text(
                      "Stewardship Score",
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.033),
                        color: AppColors.textcolor2,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.02)),

                    /// SCORE CIRCULAR PROGRESS RING
                    SizedBox(
                      height: AppSize.widthPercent(0.38),
                      width: AppSize.widthPercent(0.38),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: AppSize.widthPercent(0.38),
                            width: AppSize.widthPercent(0.38),
                            child: CircularProgressIndicator(
                              value: 845 / 1000,
                              strokeWidth: AppSize.widthPercent(0.028),
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
                                "845",
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.075),
                                  color: AppColors.warning,
                                ),
                              ),
                              Text(
                                "/1000",
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.032),
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
                      "Family Stewardship Score",
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.042),
                        color: AppColors.textcolor1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.008)),
                    Text(
                      "A holisitcmeasure of your family's time\ntalents and treasure by shared legacy.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.032),
                        color: AppColors.textcolor2,
                        height: 1.25,
                      ),
                    ),

                    SizedBox(height: AppSize.heightPercent(0.022)),

                    CustomButton(
                      title: "View Details",
                      onTap: () {
                        AppNavigator.pushRight(AppRoutes.fstewardscore);
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// YOUR RESOURCES SECTION
              _buildSectionHeader("Your Resources"),
              SizedBox(height: AppSize.heightPercent(0.015)),

              _buildResourceCard(
                icon: Icons.access_time_rounded,
                title: "Time",
                subtitle: "42 Hours",
                trailingText: "+4 hrs this week",
              ),
              SizedBox(height: AppSize.heightPercent(0.012)),

              _buildResourceCard(
                icon: Icons.psychology_outlined,
                title: "Talents",
                subtitle: "12 Skills",
                trailingText: "+1 shared",
              ),
              SizedBox(height: AppSize.heightPercent(0.012)),

              _buildResourceCard(
                icon: Icons.account_balance_wallet_outlined,
                title: "Treasure",
                subtitle: "\$12,400",
                trailingText: "On track",
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// HOUSEHOLD PROGRESS SECTION
              _buildSectionHeader("Household Progress"),
              SizedBox(height: AppSize.heightPercent(0.015)),

              _buildProgressCard(
                title: "Monthly Budget",
                amountText: "\$850 / \$850",
                percent: 1.0,
              ),
              SizedBox(height: AppSize.heightPercent(0.012)),

              _buildProgressCard(
                title: "Legacy Savings",
                amountText: "\$1,000 / \$1,275",
                percent: 1000 / 1275,
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// TODAY'S FOCUS SECTION
              _buildSectionHeader("Today's Focus"),
              SizedBox(height: AppSize.heightPercent(0.015)),

              _buildFocusCard(
                icon: Icons.assignment_outlined,
                title: "Review Q3 College Fund",
                subtitle: "Finance",
                avatarPath: "assets/images/home1.png",
              ),
              SizedBox(height: AppSize.heightPercent(0.012)),

              _buildFocusCard(
                icon: Icons.assignment_outlined,
                title: "Volunteer at Food Bank",
                subtitle: "Community",
                avatarPath: "assets/images/home1.png",
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// QUOTE CARD SECTION
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: AppSize.widthPercent(0.06),
                  right: AppSize.widthPercent(0.06),
                  top: AppSize.heightPercent(0.05),
                  bottom: AppSize.heightPercent(0.05),
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary1,
                  borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.08),
                  ),
                  boxShadow: AppShadows.boxShadow
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "99",
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.1),
                        color: AppColors.warning,
                        height: 0.6,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.025)),
                    Text(
                      "“For where your treasure is, there your heart will be also.”",
                      style: TextStyle(
                        fontFamily: "pm",
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.widthPercent(0.04),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.025)),
                    Text(
                      "MATTHEW 6:21",
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.03),
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

  /// Section Title Builder
  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: "pb",
        fontWeight: FontWeight.bold,
        fontSize: AppSize.widthPercent(0.042),
        color: AppColors.textcolor1,
      ),
    );
  }

  /// Resource Tile Builder
  Widget _buildResourceCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String trailingText,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthPercent(0.05),
        vertical: AppSize.heightPercent(0.023),
      ),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.07)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSize.widthPercent(0.055),
            backgroundColor: AppColors.primary1.withOpacity(0.15),
            child: Icon(
              icon,
              color: AppColors.primary1,
              size: AppSize.widthPercent(0.055),
            ),
          ),
          SizedBox(width: AppSize.widthPercent(0.035)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.038),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.002)),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.widthPercent(0.032),
                  color: AppColors.textcolor2,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            trailingText,
            style: TextStyle(
              fontFamily: "pm",
              fontSize: AppSize.widthPercent(0.032),
              color: AppColors.textcolor1,
            ),
          ),
        ],
      ),
    );
  }

  /// Progress Card Builder
  Widget _buildProgressCard({
    required String title,
    required String amountText,
    required double percent,
  }) {
    return Container(
      padding: EdgeInsets.all(AppSize.widthPercent(0.07)),
      decoration: BoxDecoration(
        color: AppColors.secondary1,
          boxShadow: AppShadows.boxShadow,
          borderRadius: BorderRadius.circular(AppSize.widthPercent(0.08)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.036),
                  color: AppColors.textcolor1,
                ),
              ),
              Text(
                amountText,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.widthPercent(0.03),
                  color: AppColors.textcolor2,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.heightPercent(0.015)),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percent,
              minHeight: AppSize.heightPercent(0.008),
              backgroundColor: AppColors.warning.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.warning),
            ),
          ),
        ],
      ),
    );
  }

  /// Today's Focus Tile Builder
  Widget _buildFocusCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String avatarPath,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthPercent(0.05),
        vertical: AppSize.heightPercent(0.023),
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary1,
          boxShadow: AppShadows.boxShadow,
          borderRadius: BorderRadius.circular(AppSize.widthPercent(0.08)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSize.widthPercent(0.055),
            backgroundColor: AppColors.primary1.withOpacity(0.15),
            child: Icon(
              icon,
              color: AppColors.primary1,
              size: AppSize.widthPercent(0.055),
            ),
          ),
          SizedBox(width: AppSize.widthPercent(0.035)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "pb",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.widthPercent(0.036),
                    color: AppColors.textcolor1,
                  ),
                ),
                SizedBox(height: AppSize.heightPercent(0.002)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.03),
                    color: AppColors.textcolor2,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: AppSize.widthPercent(0.045),
            backgroundImage: AssetImage(avatarPath),
          ),
        ],
      ),
    );
  }
}