import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/quiz_result_screen_theme.dart';
import 'result_screen.dart';
import 'welcome_screen.dart';

/// Simple data model for one quiz question.
///
/// [statGroup] is the *result-screen tab* this question feeds into.
/// Multiple questions can share the same statGroup (e.g. two "Time"
/// questions) — their progress values get averaged together into a
/// single tab on the result screen.
class QuizData {
  final String category;
  final String question;
  final List<String> options;
  final IconData statIcon;
  final String statGroup;

  const QuizData({
    required this.category,
    required this.question,
    required this.options,
    required this.statIcon,
    required this.statGroup,
  });
}

/// Owns the list of quiz questions, the current index, and the user's
/// selected answers. Shows a QuizScreen for the current question and
/// advances (or shows the ResultScreen) when the user taps Next.
class QuizFlowScreen extends StatefulWidget {
  final VoidCallback? onFinished;

  const QuizFlowScreen({super.key, this.onFinished});

  @override
  State<QuizFlowScreen> createState() => _QuizFlowScreenState();
}

class _QuizFlowScreenState extends State<QuizFlowScreen> {
  int _index = 0;

  // 5 questions total, mapped into 3 result-screen tabs:
  // Time (2 questions), Talents (2 questions), Treasure (1 question).
  final List<QuizData> _questions = const [
    QuizData(
      category: 'Time',
      question: 'How do you currently manage your time?',
      options: [
        'Very well',
        'Sometimes well',
        'I struggle with it',
        'Very complex',
      ],
      statIcon: Icons.access_time,
      statGroup: 'Time',
    ),
    QuizData(
      category: 'Time',
      question: 'How intentional are you with your daily schedule?',
      options: [
        'Very intentional',
        'Somewhat intentional',
        'Not very intentional',
        'Not sure',
      ],
      statIcon: Icons.access_time,
      statGroup: 'Time',
    ),
    QuizData(
      category: 'Talents',
      question: 'How well do you use your God-given talents?',
      options: [
        'Very well',
        'Somewhat well',
        'Still discovering them',
        'Not sure',
      ],
      statIcon: Icons.psychology_outlined,
      statGroup: 'Talents',
    ),
    QuizData(
      category: 'Talents',
      question: 'How intentional are you about growing your skills?',
      options: [
        'Very intentional',
        'Somewhat intentional',
        'Not very intentional',
        'Not interested',
      ],
      statIcon: Icons.psychology_outlined,
      statGroup: 'Talents',
    ),
    QuizData(
      category: 'Treasure',
      question: 'How intentional are you with your spending?',
      options: [
        'Very intentional',
        'Somewhat intentional',
        'Not very intentional',
        'Not sure',
      ],
      statIcon: Icons.account_balance_wallet_outlined,
      statGroup: 'Treasure',
    ),
  ];

  // Stores the selected option index for each question (null if skipped).
  late final List<int?> _answers = List.filled(_questions.length, null);

  void _handleNext() {
    final isLastQuestion = _index == _questions.length - 1;
    if (isLastQuestion) {
      widget.onFinished?.call();
      Get.off(() => ResultScreen(
        score: _calculateScore(),
        title: 'Balance Steward',
        description:
        'You manage your resources well across all areas of life.',
        stats: _buildStats(),
        onContinue: () => Get.off(() => const WelcomeScreen()),
      ));
    } else {
      setState(() => _index++);
    }
  }

  /// Each option's index (0 = best answer ... last = weakest) is turned
  /// into a 0.0-1.0 progress value for that question.
  double _progressFor(int questionIndex) {
    final selected = _answers[questionIndex];
    if (selected == null) return 0.0;
    final optionCount = _questions[questionIndex].options.length;
    return 1 - (selected / (optionCount - 1));
  }

  /// Groups the 5 questions' answers by [QuizData.statGroup] and averages
  /// them, producing exactly one StatItem per group (Time, Talents,
  /// Treasure) — regardless of how many questions feed each group.
  List<StatItem> _buildStats() {
    final Map<String, List<double>> grouped = {};
    final Map<String, IconData> iconsByGroup = {};

    for (var i = 0; i < _questions.length; i++) {
      final q = _questions[i];
      grouped.putIfAbsent(q.statGroup, () => []).add(_progressFor(i));
      iconsByGroup.putIfAbsent(q.statGroup, () => q.statIcon);
    }

    return grouped.entries.map((entry) {
      final avg = entry.value.reduce((a, b) => a + b) / entry.value.length;
      return StatItem(
        icon: iconsByGroup[entry.key]!,
        name: entry.key,
        progress: avg,
      );
    }).toList();
  }

  int _calculateScore() {
    final total = List.generate(_questions.length, _progressFor)
        .fold<double>(0, (sum, p) => sum + p);
    final average = total / _questions.length;
    return (average * 999).round();
  }

  @override
  Widget build(BuildContext context) {
    final data = _questions[_index];
    return QuizScreen(
      key: ValueKey(_index), // resets selectedIndex when the question changes
      current: _index + 1,
      total: _questions.length,
      category: data.category,
      question: data.question,
      options: data.options,
      onNext: (selectedIndex) {
        _answers[_index] = selectedIndex;
        _handleNext();
      },
    );
  }
}

/// A single quiz question, e.g. question 3 of 5.
class QuizScreen extends StatefulWidget {
  final int current;
  final int total;
  final String category;
  final String question;
  final List<String> options;
  final ValueChanged<int?> onNext;

  const QuizScreen({
    super.key,
    required this.current,
    required this.total,
    required this.category,
    required this.question,
    required this.options,
    required this.onNext,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              QuizProgressBar(current: widget.current, total: widget.total),
              const SizedBox(height: 40),
              Text(widget.category, style: AppTextStyles.eyebrow),
              const SizedBox(height: 16),
              Text(widget.question, style: AppTextStyles.question),
              const SizedBox(height: 50),
              ...List.generate(widget.options.length, (i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: QuizOptionTile(
                    label: widget.options[i],
                    selected: selectedIndex == i,
                    onTap: () => setState(() => selectedIndex = i),
                  ),
                );
              }),
              const SizedBox(height: 50),
              PrimaryButton(
                label: 'Next',
                onPressed: selectedIndex == null
                    ? null
                    : () => widget.onNext(selectedIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }
}