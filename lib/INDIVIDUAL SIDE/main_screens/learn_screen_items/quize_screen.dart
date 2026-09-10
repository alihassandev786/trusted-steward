import 'package:flutter/material.dart';
import '../../learn_screen_widgets/learn_button.dart';
import '../../learn_screen_widgets/learn_theme.dart';
import '../../learn_screen_widgets/quiz_widgts.dart';
import '../../teasure_dasbord_widgets/detail_screen_header.dart';

import 'complete_course_screen.dart';


class FinancialTreasureQuizScreen extends StatefulWidget {
  const FinancialTreasureQuizScreen({super.key});

  @override
  State<FinancialTreasureQuizScreen> createState() =>
      _FinancialTreasureQuizScreenState();
}

class _FinancialTreasureQuizScreenState
    extends State<FinancialTreasureQuizScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<int?> _answers = List<int?>.filled(
    financialTreasureQuestions.length,
    null,
  );

  int _currentIndex = 0;
  bool _isCompleting = false;

  bool get _isLastQuestion =>
      _currentIndex == financialTreasureQuestions.length - 1;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    if (!_scrollController.hasClients) return;

    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  void _selectAnswer(int optionIndex) {
    if (_isCompleting) return;

    setState(() {
      _answers[_currentIndex] = optionIndex;
    });
  }

  void _goBack() {
    if (_isCompleting) return;

    if (_currentIndex == 0) {
      Navigator.maybePop(context);
      return;
    }

    setState(() {
      _currentIndex--;
    });

    _scrollToTop();
  }

  void _nextQuestion() {
    if (_isCompleting || _answers[_currentIndex] == null) {
      return;
    }

    if (!_isLastQuestion) {
      setState(() {
        _currentIndex++;
      });

      _scrollToTop();
      return;
    }

    _completeQuiz();
  }

  void _completeQuiz() {
    if (_isCompleting || _answers.any((answer) => answer == null)) {
      return;
    }

    setState(() {
      _isCompleting = true;
    });

    int score = 0;

    for (int index = 0; index < financialTreasureQuestions.length; index++) {
      if (_answers[index] ==
          financialTreasureQuestions[index].correctIndex) {
        score++;
      }
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => CompletedLearningScreen(
          quizScore: score,
          totalQuestions: financialTreasureQuestions.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = financialTreasureQuestions[_currentIndex];
    final selectedAnswer = _answers[_currentIndex];

    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              DetailScreenHeader(
                title: 'Financial Treasure',
                onBackTap: _goBack,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuizProgressHeader(
                      currentQuestion: _currentIndex + 1,
                      totalQuestions: financialTreasureQuestions.length,
                    ),

                    const SizedBox(height: 28),

                    QuizQuestionCard(
                      number: _currentIndex + 1,
                      question: question.question,
                    ),

                    const SizedBox(height: 34),

                    for (
                    int optionIndex = 0;
                    optionIndex < question.options.length;
                    optionIndex++
                    )
                      QuizOptionTile(
                        key: ValueKey(
                          'question-$_currentIndex-option-$optionIndex',
                        ),
                        text: question.options[optionIndex],
                        selected: selectedAnswer == optionIndex,
                        onTap: () => _selectAnswer(optionIndex),
                      ),

                    const SizedBox(height: 50),

                    LearnButton(
                      label: _isLastQuestion
                          ? 'Complete'
                          : 'Next Question',
                      onPressed:
                      selectedAnswer == null || _isCompleting
                          ? null
                          : _nextQuestion,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}