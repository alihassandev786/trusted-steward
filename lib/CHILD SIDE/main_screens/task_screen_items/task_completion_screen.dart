import 'package:flutter/material.dart';

import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_button.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';

class TaskCompletedScreen extends StatelessWidget {
  const TaskCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: learnBackground,
      body: Stack(
        children: [
          // Confetti background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/pop.png',
              width: double.infinity,
              height: screenHeight * 0.37,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                20,
                screenHeight * 0.37,
                20,
                30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Task Completed!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        fontFamily: "pops"
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Your task has been successfully completed. '
                        'Go on to the further tasks.',
                    textAlign: TextAlign.center,
                    style: learnText(14).copyWith(
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 38),

                  LearnButton(
                    label: 'Back to Tasks',
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}