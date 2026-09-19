import 'package:flutter/material.dart';
import '../teasure_dasbord_widgets/finance_theme.dart';

const journalBackground = Color(0xFFF9F8F2);
const journalCardColor = Color(0xFFF6F2E6);
const journalInputColor = Color(0xFFECE8D8);
const journalGreen = Color(0xFF2F703F);
const journalGold = Color(0xFFD7A11B);
const journalYellow = Color(0xFFEDDCAD);

// Add your image to pubspec.yaml to display it.
const journalPhoto = 'assets/images/journel.png';

class JournalPage extends StatelessWidget {
  const JournalPage({
    super.key,
    required this.title,
    required this.children,
    this.horizontalPadding = 20,
  });

  final String title;
  final List<Widget> children;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: journalBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 26),
                child: Row(
                  children: [
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: Material(
                        color: journalGreen,
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: () => Navigator.maybePop(context),
                          tooltip: 'Back',
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        title,
                        style: FinanceText.heading(size: 21),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class JournalCard extends StatelessWidget {
  const JournalCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: journalCardColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFE1DFD6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}

class JournalButton extends StatelessWidget {
  const JournalButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = journalGreen,
    this.textColor = Colors.white,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          elevation: 0,
          minimumSize: const Size.fromHeight(45),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          shape: const StadiumBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 21),
              const SizedBox(width: 7),
            ],
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: FinanceText.subheading(
                  size: 14,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JournalPrivacyBadge extends StatelessWidget {
  const JournalPrivacyBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFA7BEA3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.lock_outline, size: 11, color: journalGreen),
          const SizedBox(width: 4),
          Text(
            'Only You',
            style: FinanceText.body(size: 10, color: journalGreen),
          ),
        ],
      ),
    );
  }
}

class JournalPhoto extends StatelessWidget {
  const JournalPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      journalPhoto,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        color: const Color(0xFF829079),
        alignment: Alignment.center,
        child: const Icon(
          Icons.forest_outlined,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}

InputDecoration journalInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: FinanceText.body(size: 11, color: Colors.black54),
    filled: true,
    fillColor: journalInputColor,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 16,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(26),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(26),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(26),
      borderSide: const BorderSide(color: journalGreen),
    ),
  );
}

class JournalPickerField extends StatelessWidget {
  const JournalPickerField({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: journalInputColor,
      borderRadius: BorderRadius.circular(26),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: FinanceText.body(size: 11, color: Colors.black54),
                ),
              ),
              Icon(icon, size: 18, color: journalGreen),
            ],
          ),
        ),
      ),
    );
  }
}

class JournalDashedBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          const Radius.circular(30),
        ),
      );

    final paint = Paint()
      ..color = journalGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (final metric in path.computeMetrics()) {
      for (double start = 0; start < metric.length; start += 5) {
        canvas.drawPath(metric.extractPath(start, start + 2.5), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}