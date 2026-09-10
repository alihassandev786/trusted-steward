import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MediaqueryHelperfile.dart';

void showLogoutDialog(BuildContext context, {required VoidCallback onConfirm}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.15), // Soft overlay color
    builder: (BuildContext context) {
      return BackdropFilter(
        // Exact background blur effect
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
          ),
          elevation: 0,
          backgroundColor: const Color(0xffF6F2E9), // Dialog background
          child: Container(
            width: AppSize.widthPercent(0.85),
            decoration: BoxDecoration(
              color: const Color(0xffF6F2E9),
              borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: AppSize.heightPercent(0.025)),

                /// TITLE
                Text(
                  "Logout",
                  style: TextStyle(
                    fontFamily: "pb",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.widthPercent(0.045),
                    color: const Color(0xffA80000), // Dark Red
                  ),
                ),

                SizedBox(height: AppSize.heightPercent(0.01)),

                /// SUBTITLE
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.04)),
                  child: Text(
                    "Are you sure you want to logout?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.widthPercent(0.038),
                      color: const Color(0xff1C1C1C),
                    ),
                  ),
                ),

                SizedBox(height: AppSize.heightPercent(0.025)),

                /// HORIZONTAL DIVIDER
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xffE2DACD),
                ),

                /// ACTION BUTTONS (CANCEL & CONFIRM)
                IntrinsicHeight(
                  child: Row(
                    children: [
                      /// CANCEL BUTTON
                      Expanded(
                        child: InkWell(
                          onTap: () => Get.back(),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(AppSize.widthPercent(0.06)),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: AppSize.heightPercent(0.018)),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontFamily: "pb",
                                fontWeight: FontWeight.bold,
                                fontSize: AppSize.widthPercent(0.038),
                                color: const Color(0xff555555),
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// VERTICAL DIVIDER
                      const VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: Color(0xffE2DACD),
                      ),

                      /// CONFIRM BUTTON
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            onConfirm();
                          },
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(AppSize.widthPercent(0.06)),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: AppSize.heightPercent(0.018)),
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                fontFamily: "pb",
                                fontWeight: FontWeight.bold,
                                fontSize: AppSize.widthPercent(0.038),
                                color: const Color(0xff2D5C38), // Green accent
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}