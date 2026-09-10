import 'package:flutter/material.dart';
import 'learn_card.dart';
import 'learn_theme.dart';

class QuizQuestion {
  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  }) : assert(correctIndex >= 0);

  final String question;
  final List<String> options;
  final int correctIndex;
}

// ── 10 questions ──

const financialTreasureQuestions = <QuizQuestion>[
  QuizQuestion(
    question:
    'What is the primary biblical principle behind the practice '
        'of “first fruits” giving?',
    options: [
      'Giving what is left over after expenses.',
      'Giving the first and best to God.',
      'Saving strictly for future generations.',
      'Following secular tax guidelines.',
    ],
    correctIndex: 1,
  ),
  QuizQuestion(
    question: 'What does faithful stewardship involve?',
    options: [
      'Using every resource only for personal comfort.',
      'Measuring your worth by your possessions.',
      'Managing entrusted resources responsibly.',
      'Avoiding all financial planning.',
    ],
    correctIndex: 2,
  ),
  QuizQuestion(
    question: 'Which habit best supports a thoughtful spending plan?',
    options: [
      'Tracking income and expenses regularly.',
      'Ignoring small purchases.',
      'Spending without checking available funds.',
      'Copying another person’s lifestyle.',
    ],
    correctIndex: 0,
  ),
  QuizQuestion(
    question: 'What is a helpful purpose of emergency savings?',
    options: [
      'Funding every unplanned luxury purchase.',
      'Replacing all future income.',
      'Avoiding the need for a budget.',
      'Preparing for unexpected essential expenses.',
    ],
    correctIndex: 3,
  ),
  QuizQuestion(
    question: 'Which attitude best reflects cheerful generosity?',
    options: [
      'Giving only to receive public praise.',
      'Giving willingly with a grateful heart.',
      'Giving to control someone else.',
      'Giving only when pressured.',
    ],
    correctIndex: 1,
  ),
  QuizQuestion(
    question: 'What does contentment help us do?',
    options: [
      'Stop caring for our responsibilities.',
      'Compare our possessions constantly.',
      'Appreciate what we have without chasing every desire.',
      'Avoid setting any goals.',
    ],
    correctIndex: 2,
  ),
  QuizQuestion(
    question: 'Why is it helpful to distinguish needs from wants?',
    options: [
      'It helps us prioritize essential responsibilities.',
      'It makes every purchase unnecessary.',
      'It guarantees unlimited savings.',
      'It removes the need to make choices.',
    ],
    correctIndex: 0,
  ),
  QuizQuestion(
    question: 'Which choice demonstrates integrity with money?',
    options: [
      'Hiding mistakes in financial records.',
      'Making promises we cannot keep.',
      'Keeping money that belongs to someone else.',
      'Being honest and keeping accurate records.',
    ],
    correctIndex: 3,
  ),
  QuizQuestion(
    question: 'How can our talents be part of stewardship?',
    options: [
      'By keeping every skill to ourselves.',
      'By developing our abilities and using them to serve.',
      'By comparing ourselves with everyone else.',
      'By waiting until we are perfect before helping.',
    ],
    correctIndex: 1,
  ),
  QuizQuestion(
    question: 'Which action best supports lasting financial stewardship?',
    options: [
      'Making one plan and never reviewing it.',
      'Focusing only on short-term desires.',
      'Regularly reviewing spending, saving, and giving.',
      'Ignoring changes in our responsibilities.',
    ],
    correctIndex: 2,
  ),
];

// ── Progress header ──

class QuizProgressHeader extends StatelessWidget {
  const QuizProgressHeader({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  }) : assert(totalQuestions > 0);

  final int currentQuestion;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    final progress =
    (currentQuestion / totalQuestions).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Question $currentQuestion of $totalQuestions',
          style: learnText(
            12,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        Semantics(
          label: 'Quiz progress',
          value: '$currentQuestion of $totalQuestions',
          child: Container(
            width: double.infinity,
            height: 7,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFF8A8A8A),
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedFractionallySizedBox(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              heightFactor: 1,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  color: learnGold,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Question card ──

class QuizQuestionCard extends StatelessWidget {
  const QuizQuestionCard({
    super.key,
    required this.number,
    required this.question,
  });

  final int number;
  final String question;

  @override
  Widget build(BuildContext context) {
    return LearnCard(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 22,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: learnIconBackground,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$number',
              style: learnText(
                14,
                color: learnGreen,
                weight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              question,
              style: learnText(
                14,
                weight: FontWeight.w600,
              ).copyWith(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Answer option ──

class QuizOptionTile extends StatelessWidget {
  const QuizOptionTile({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Semantics(
        label: text,
        checked: selected,
        inMutuallyExclusiveGroup: true,
        onTap: onTap,
        excludeSemantics: true,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Material(
            color: learnCream,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
              side: BorderSide(
                color: Colors.black.withValues(alpha: 0.08),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: selected
                            ? learnGreen
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: learnGreen,
                        ),
                      ),
                      child: selected
                          ? const Icon(
                        Icons.check,
                        size: 14,
                        color: Colors.white,
                      )
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        text,
                        style: learnText(12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}