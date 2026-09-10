import 'package:flutter/material.dart';
import '../../teasure_dasbord_widgets/detail_screen_header.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';

const screenGreen = Color(0xFF306C3F);
const screenGold = Color(0xFFD0A42F);

class FinancePage extends StatelessWidget {
  const FinancePage({super.key, required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: FinanceColors.background,
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            DetailScreenHeader(title: title),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 36, 20, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class SoftFinanceCard extends StatelessWidget {
  const SoftFinanceCard({super.key, required this.child,
    this.padding = const EdgeInsets.all(22), this.color = FinanceColors.card});
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: padding,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.black.withValues(alpha: 0.09)),
      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08),
        blurRadius: 4, offset: const Offset(0, 1))],
    ),
    child: child,
  );
}

class FinanceAction extends StatelessWidget {
  const FinanceAction({super.key, required this.label, this.onPressed});
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed ?? () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Connect this button to your app flow.'))),
      style: ElevatedButton.styleFrom(
        backgroundColor: screenGreen, foregroundColor: Colors.white,
        minimumSize: const Size(0, 45), elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        shape: const StadiumBorder(),
      ),
      child: Text(label, style: FinanceText.subheading(
        size: 14, color: Colors.white, weight: FontWeight.w500)),
    ),
  );
}

class FinanceSection extends StatelessWidget {
  const FinanceSection({super.key, required this.title, this.action, this.onTap});
  final String title;
  final String? action;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Row(children: [
    Expanded(child: Text(title, style: FinanceText.subheading(
      size: 16, weight: FontWeight.w700))),
    if (action != null) TextButton(
      onPressed: onTap ?? () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Connect this action to your app flow.'))),
      child: Text(action!, style: FinanceText.body(size: 11, color: screenGreen)),
    ),
  ]);
}

class FinanceIcon extends StatelessWidget {
  const FinanceIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) => Container(
    width: 40, height: 40,
    decoration: const BoxDecoration(color: Color(0xFFBDCEB6), shape: BoxShape.circle),
    child: Icon(icon, size: 20, color: screenGreen),
  );
}
