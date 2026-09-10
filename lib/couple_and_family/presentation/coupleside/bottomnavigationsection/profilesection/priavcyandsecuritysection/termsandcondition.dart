import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/controllers/legalcontentcontroller.dart';
import 'legalcontentscreen.dart';



class Termsandcondition extends StatelessWidget {
  const Termsandcondition({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LegalContentController());

    return LegalContentScreen(
      title: controller.termsConditionsTitle,
      body: controller.termsConditionsBody,
    );
  }
}