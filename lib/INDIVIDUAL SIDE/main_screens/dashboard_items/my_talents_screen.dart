import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard widgets/talent_button.dart';
import '../../dashboard widgets/talent_card.dart';
import '../../dashboard widgets/talent_empty_state.dart';
import '../../dashboard widgets/talent_models.dart';
import '../../dashboard widgets/talent_page.dart';

import 'add_talent_screen.dart';
import 'talent_details_screen.dart';

class MyTalentsScreen extends StatelessWidget {
  const MyTalentsScreen({
    super.key,
    required this.controller,
  });

  final TalentsController controller;

  @override
  Widget build(BuildContext context) {
    return TalentPage(
      title: 'My Talents',
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 44, 20, 40),
            children: [
              for (final talent in controller.talents) ...[
                TalentCard(
                  talent: talent,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => TalentDetailsScreen(
                          controller: controller,
                          talent: talent,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
              ],

              if (controller.talents.isNotEmpty)
                const SizedBox(height: 18),

              TalentButton(
                label: '+Add New Talent',
                onPressed: () {
                  Get.to(
                        () => AddTalentScreen(
                      controller: controller,
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Screenshot ke mutabiq icon aur text hamesha dikhenge.
              const TalentEmptyState(),
            ],
          );
        },
      ),
    );
  }
}