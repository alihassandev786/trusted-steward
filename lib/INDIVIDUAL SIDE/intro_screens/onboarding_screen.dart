import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/intro_screens/quiz_screens.dart';
import '../widgets/circle_button.dart';

/// All 3 onboarding screens combined into a single file.
/// Swipeable via PageView, with background images, title, description,
/// page indicator dots, and a circular next button on each page.
class OnboardingScreen extends StatefulWidget {
  final VoidCallback? onDone;

  const OnboardingScreen({super.key, this.onDone});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingData> _pages = const [
    _OnboardingData(
      imageUrl: 'assets/images/o1.png',
      title: 'Faithful\nStewardship!',
      description:
      'Track your Time, Talents and Treasure in one place and grow as '
          'a faithful steward every day.',
    ),
    _OnboardingData(
      imageUrl: 'assets/images/o2.png',
      title: 'Learn,Reflect\nGrow!',
      description:
      'Receive biblical guidance, complete learning modules, write '
          'personal reflections and improve your Stewardship Score every day.',
    ),
    _OnboardingData(
      imageUrl: 'assets/images/o3.png',
      title: 'Grow In\nStewardship!',
      description:
      'Plan your day, manage your finances, develop your talents and '
          'build healthy habits guided by biblical principles.',
    ),
  ];

  void _onNextPressed() {
    final isLastPage = _currentPage == _pages.length - 1;
    if (isLastPage) {
      // Kick off the quiz flow (manages its own question-to-question
      // navigation internally, then goes to WelcomeScreen when finished).
      Get.to(() => QuizFlowScreen(onFinished: widget.onDone));
    } else {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemBuilder: (context, index) {
          final page = _pages[index];
          return _OnboardingPage(
            data: page,
            currentIndex: _currentPage,
            totalPages: _pages.length,
            onNext: _onNextPressed,
          );
        },
      ),
    );
  }
}

/// Simple data model for a single onboarding page.
class _OnboardingData {
  final String imageUrl;
  final String title;
  final String description;

  const _OnboardingData({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

/// Renders one onboarding page: background image, title, description,
/// page indicator dots, and the circular next button.
class _OnboardingPage extends StatelessWidget {
  final _OnboardingData data;
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNext;

  const _OnboardingPage({
    required this.data,
    required this.currentIndex,
    required this.totalPages,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        Image.asset(
          data.imageUrl,
          fit: BoxFit.cover,
        ),
        // Dark gradient overlay for text readability
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black45,
                Colors.transparent,
                Colors.transparent,
                Colors.black87,
              ],
              stops: [0.0, 0.25, 0.55, 1.0],
            ),
          ),
        ),

        // Content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  data.title,
                  style: const TextStyle(
                    fontSize: 40,
                    fontFamily: "pops",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.15,
                  ),
                ),
                const Spacer(),
                Text(
                  data.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "pop",
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Page indicator dots
                    Row(
                      children: List.generate(
                        totalPages,
                            (i) => _Dot(active: i == currentIndex),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                CircleIconButton(
                  icon: Icons.arrow_forward,
                  onTap: onNext,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final bool active;
  const _Dot({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 4),
      width: active ? 8 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF306C3F) : Colors.white70,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}