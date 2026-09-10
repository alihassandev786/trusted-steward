import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/controllers/legalcontentcontroller.dart';
import 'legalcontentscreen.dart';

class Privacypolicy extends StatelessWidget {
  const Privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LegalContentController());

    return LegalContentScreen(
      title: controller.privacyPolicyTitle,
      body: controller.privacyPolicyBody,
    );
  }
}