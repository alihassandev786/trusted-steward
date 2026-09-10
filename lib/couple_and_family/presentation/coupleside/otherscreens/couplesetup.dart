// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../core/theme/appcolors.dart';
// import '../../../data/controllers/couplesetupcontroller.dart';
// import '../../Widgets/Button.dart';
// import '../../Widgets/MediaqueryHelperfile.dart';
// import '../../Widgets/Textfield.dart';
//
//
// class Couplesetup extends StatefulWidget {
//   const Couplesetup({super.key});
//
//   @override
//   State<Couplesetup> createState() => _CouplesetupState();
// }
//
// class _CouplesetupState extends State<Couplesetup> {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(CouplesetupController());
//
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: AppSize.heightPercent(0.03)),
//
//             /// TOP IMAGE (REPLACE LATER WITH YOUR OWN ASSET)
//             Image.asset(
//               "assets/images/couplesetup.png",
//               height: AppSize.heightPercent(0.22),
//             ),
//
//             SizedBox(height: AppSize.heightPercent(0.04)),
//
//             /// TITLE
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: AppSize.widthPercent(0.03),
//               ),
//               child: Text(
//                 'Build Your Stewardship Together!',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: "pb",
//                   fontWeight: FontWeight.bold,
//                   fontSize: AppSize.widthPercent(0.07),
//                   color: AppColors.textcolor1,
//                   height: 1.1,
//                 ),
//               ),
//             ),
//
//             SizedBox(height: AppSize.heightPercent(0.023)),
//
//             /// SUBTITLE
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: AppSize.widthPercent(0.03),
//               ),
//               child: Text(
//                 'Invite your partner to join your Trusted Steward couple account.You can manage shared areas.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: "pr",
//                   fontSize: AppSize.widthPercent(0.039),
//                   color: AppColors.textcolor2,
//                   height: 1.2,
//                 ),
//               ),
//             ),
//
//             const Spacer(),
//
//             /// BOTTOM CARD
//             Container(
//               height: AppSize.height*0.4,
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(
//                 horizontal: AppSize.height * 0.025,
//                 vertical: AppSize.height * 0.07,
//               ),
//               decoration: BoxDecoration(
//                 color: AppColors.secondary1,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(AppSize.heightPercent(0.09)),
//                   topRight: Radius.circular(AppSize.heightPercent(0.09)),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// LABEL
//                   Text(
//                     'Enter the Partner’s Email',
//                     style: TextStyle(
//                       fontFamily: "pm",
//                       fontWeight: FontWeight.w600,
//                       fontSize: AppSize.widthPercent(0.05),
//                       color: Colors.black87,
//                     ),
//                   ),
//
//                   SizedBox(height: AppSize.heightPercent(0.032)),
//
//                   /// EMAIL FIELD
//                   CustomTextField(
//                     controller: controller.emailController,
//                     hintText: 'Email Address',
//                     keyboardType: TextInputType.emailAddress,
//                     height: AppSize.heightPercent(0.065),
//                   ),
//
//                   SizedBox(height: AppSize.heightPercent(0.032)),
//
//                   /// SEND INVITATION BUTTON
//                   CustomButton(
//                     title: 'Send Invitation',
//                     onTap: controller.sendInvitation,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/appcolors.dart';
import '../../../data/controllers/couplesetupcontroller.dart';
import '../../Widgets/Button.dart';
import '../../Widgets/MediaqueryHelperfile.dart';
import '../../Widgets/Textfield.dart';


class Couplesetup extends StatefulWidget {
  const Couplesetup({super.key});

  @override
  State<Couplesetup> createState() => _CouplesetupState();
}

class _CouplesetupState extends State<Couplesetup> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CouplesetupController());

    return Scaffold(
      backgroundColor: AppColors.background,
      // Ye zaroori hai taake keyboard aane par screen resize ho
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            /// SCROLLABLE TOP CONTENT SECTION
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: AppSize.heightPercent(0.03)),

                    /// TOP IMAGE
                    Image.asset(
                      "assets/images/couplesetup.png",
                      height: AppSize.heightPercent(0.22),
                    ),

                    SizedBox(height: AppSize.heightPercent(0.04)),

                    /// TITLE
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.widthPercent(0.03),
                      ),
                      child: Text(
                        'Build Your Stewardship Together!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "pb",
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.widthPercent(0.07),
                          color: AppColors.textcolor1,
                          height: 1.1,
                        ),
                      ),
                    ),

                    SizedBox(height: AppSize.heightPercent(0.023)),

                    /// SUBTITLE
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.widthPercent(0.03),
                      ),
                      child: Text(
                        'Invite your partner to join your Trusted Steward couple account.You can manage shared areas.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.039),
                          color: AppColors.textcolor2,
                          height: 1.2,
                        ),
                      ),
                    ),

                    SizedBox(height: AppSize.heightPercent(0.02)),
                  ],
                ),
              ),
            ),

            /// BOTTOM FIXED CARD CONTAINER (ab fixed height nahi, content ke mutabiq)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthPercent(0.06),
                vertical: AppSize.heightPercent(0.075),
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.heightPercent(0.08)),
                  topRight: Radius.circular(AppSize.heightPercent(0.08)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// LABEL
                  Text(
                    'Enter the Partner’s Email',
                    style: TextStyle(
                      fontFamily: "pm",
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.widthPercent(0.04),
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.028)),

                  /// EMAIL FIELD
                  CustomTextField(
                    controller: controller.emailController,
                    hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    height: AppSize.heightPercent(0.065),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.032)),

                  /// SEND INVITATION BUTTON
                  CustomButton(
                    title: 'Send Invitation',
                    onTap: controller.sendInvitation,
                  ),

                  SizedBox(height: AppSize.heightPercent(0.01)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
