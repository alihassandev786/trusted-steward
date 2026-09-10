import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';

class QuizQuestionData {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  QuizQuestionData({
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}

class FinancialTreasureController extends GetxController {
  static FinancialTreasureController get to => Get.find();

  final String pageTitle = "Financial Treasure";

  /// PAGE CONTROLLER - HANDLES THE ACTUAL SLIDE ANIMATION BETWEEN PAGES
  final PageController pageController = PageController();

  /// CURRENT PAGE INDEX (0 BASED)
  final RxInt currentIndex = 0.obs;

  // TODO: replace question 2-10 text/options with your real content.
  // Question 1 kept exactly as given.
  final List<QuizQuestionData> questions = [
    QuizQuestionData(
      question:
      "What is the primary biblical principle behind the practice of \"first fruits\" giving?",
      options: [
        "Giving what is left over after expense.",
        "Giving the first and best to God.",
        "Saving strictly for future generations.",
        "Following secular tax guideline.",
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestionData(
      question: "TODO: Enter question 2 text here.",
      options: [
        "TODO: Option A",
        "TODO: Option B",
        "TODO: Option C",
        "TODO: Option D",
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestionData(
      question: "TODO: Enter question 3 text here.",
      options: [
        "TODO: Option A",
        "TODO: Option B",
        "TODO: Option C",
        "TODO: Option D",
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestionData(
      question: "TODO: Enter question 4 text here.",
      options: [
        "TODO: Option A",
        "TODO: Option B",
        "TODO: Option C",
        "TODO: Option D",
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestionData(
      question: "TODO: Enter question 5 text here.",
      options: [
        "TODO: Option A",
        "TODO: Option B",
        "TODO: Option C",
        "TODO: Option D",
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestionData(
      question: "TODO: Enter question 6 text here.",
      options: [
        "TODO: Option A",
        "TODO: Option B",
        "TODO: Option C",
        "TODO: Option D",
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestionData(
      question: "TODO: Enter question 7 text here.",
      options: [
        "TODO: Option A",
        "TODO: Option B",
        "TODO: Option C",
        "TODO: Option D",
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestionData(
      question: "TODO: Enter question 8 text here.",
      options: [
        "TODO: Option A",
        "TODO: Option B",
        "TODO: Option C",
        "TODO: Option D",
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestionData(
      question: "TODO: Enter question 9 text here.",
      options: [
        "TODO: Option A",
        "TODO: Option B",
        "TODO: Option C",
        "TODO: Option D",
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestionData(
      question:
      "What is the primary biblical principle behind the practice of \"first fruits\" giving?",
      options: [
        "Giving what is left over after expense.",
        "Giving the first and best to God.",
        "Saving strictly for future generations.",
        "Following secular tax guideline.",
      ],
      correctOptionIndex: 1,
    ),
  ];

  /// SELECTED OPTION FOR EACH PAGE (SEPARATE STATE PER PAGE)
  late final List<RxnInt> selectedOptions =
  List.generate(questions.length, (_) => RxnInt());

  int get totalQuestions => questions.length;

  /// CALLED BY PageView WHEN THE PAGE FINISHES SLIDING (SWIPE OR BUTTON)
  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  /// SELECT AN OPTION FOR A SPECIFIC PAGE
  void selectOption(int pageIndex, int optionIndex) {
    selectedOptions[pageIndex].value = optionIndex;
  }

  /// SLIDE TO THE NEXT PAGE
  void nextQuestion() {
    if (currentIndex.value < totalQuestions - 1) {
      pageController.animateToPage(
        currentIndex.value + 1,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      AppNavigator.pushRight(AppRoutes.completecourse);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}