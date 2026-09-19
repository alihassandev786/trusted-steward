import 'package:flutter/material.dart';

// Screenshot presentation with the reference's sample values.
// Replace the old Sharedbudget screen with this file (do not import both).
// Uses your existing pb/pr font registrations. No controller is required.
// Native status/navigation bars are supplied by the device, not drawn here.
class Sharedbudget extends StatelessWidget {
  const Sharedbudget({super.key});

  static const _background = Color(0xFFF9F8F2);
  static const _cardFill = Color(0xFFF6F2E6);
  static const _green = Color(0xFF2D6D40);
  static const _iconFill = Color(0xFFBBCBB4);
  static const _gold = Color(0xFFD4A529);
  static const _ink = Color(0xFF222222);
  static const _muted = Color(0xFF555555);
  static const _border = Color(0xFFE3E1D9);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: _background,
    body: SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: LayoutBuilder(builder: (context, constraints) {
            // Reference is 375 logical pixels wide; proportions follow width.
            final s = constraints.maxWidth / 375;
            // Allow taller cards with accessibility text while keeping the
            // reference dimensions at the normal text scale.
            final textScale = MediaQuery.textScalerOf(context).scale(16) / 16;
            final extra = textScale > 1 ? textScale : 1.0;
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20 * s, 28 * s, 20 * s, 80 * s),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  SizedBox(
                    width: 45 * s, height: 45 * s,
                    child: Material(
                      color: _green,
                      shape: const CircleBorder(),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        tooltip: 'Back',
                        onPressed: () => Navigator.of(context).maybePop(),
                        icon: Icon(Icons.chevron_left, color: Colors.white, size: 26 * s),
                      ),
                    ),
                  ),
                  SizedBox(width: 16 * s),
                  Expanded(child: Text('Shared Budget', style: _text(21 * s, bold: true))),
                ]),
                SizedBox(height: 48 * s),
                _section('Key Targets', s),
                SizedBox(height: 18 * s),
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(minHeight: 94 * s * extra),
                  padding: EdgeInsets.fromLTRB(28 * s, 22 * s, 28 * s, 25 * s),
                  decoration: _decoration(s),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      Expanded(child: Text('Giving', style: _text(14 * s, bold: true))),
                      SizedBox(width: 8 * s),
                      Text(r'$850 / $850', style: _text(10 * s, color: _muted)),
                    ]),
                    SizedBox(height: 16 * s),
                    Semantics(
                      label: 'Giving target', value: '100 percent',
                      child: Container(
                        height: 7 * s,
                        decoration: BoxDecoration(color: _gold,
                            borderRadius: BorderRadius.circular(10 * s)),
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 29 * s),
                _section('Categories', s),
                SizedBox(height: 25 * s),
                Row(children: [
                  Expanded(child: _category(s, extra, Icons.home_outlined,
                      'Housing', r'$2,800', r'100% of $2,800')),
                  SizedBox(width: 14 * s),
                  Expanded(child: _category(s, extra, Icons.shopping_cart_outlined,
                      'Groceries', r'$650', r'80% of $800')),
                ]),
                SizedBox(height: 14 * s),
                Row(children: [
                  Expanded(child: _category(s, extra, Icons.bolt_outlined,
                      'Utilities', r'$320', r'64% of $500')),
                  SizedBox(width: 14 * s),
                  Expanded(child: _category(s, extra, Icons.bolt_outlined,
                      'Utilities', r'$320', r'64% of $500')),
                ]),
                SizedBox(height: 28 * s),
                Padding(padding: EdgeInsets.only(left: 5 * s),
                    child: _section('Recent Shared', s)),
                SizedBox(height: 32 * s),
                _transaction(s, extra, Icons.storefront_outlined,
                    'Whole Foods', 'Groceries', r'-$95.2'),
                SizedBox(height: 8 * s),
                _transaction(s, extra, Icons.water_drop_outlined,
                    'City Water Dept', 'Utilities', r'-$95.2'),
              ]),
            );
          }),
        ),
      ),
    ),
  );

  static Widget _section(String title, double s) => Text(title,
      style: _text(16 * s, bold: true, height: 1.5));

  static Widget _category(double s, double extra, IconData icon,
      String title, String amount, String caption) => Container(
    height: 167 * s * extra,
    padding: EdgeInsets.symmetric(horizontal: 8 * s, vertical: 12 * s),
    decoration: _decoration(s),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      _badge(icon, s),
      SizedBox(height: 8 * s),
      Text(title, textAlign: TextAlign.center,
          style: _text(12 * s, color: _muted)),
      SizedBox(height: 6 * s),
      Text(amount, textAlign: TextAlign.center,
          style: _text(21 * s, bold: true, height: 1.2)),
      SizedBox(height: 2 * s),
      Text(caption, textAlign: TextAlign.center,
          style: _text(10 * s, height: 1.3)),
    ]),
  );

  static Widget _transaction(double s, double extra, IconData icon,
      String title, String subtitle, String amount) => Container(
    constraints: BoxConstraints(minHeight: 86 * s * extra),
    padding: EdgeInsets.fromLTRB(20 * s, 18 * s, 32 * s, 18 * s),
    decoration: _decoration(s),
    child: Row(children: [
      _badge(icon, s),
      SizedBox(width: 13 * s),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: _text(14 * s, bold: true)),
        SizedBox(height: 4 * s),
        Text(subtitle, style: _text(12 * s)),
      ])),
      SizedBox(width: 10 * s),
      Text(amount, style: _text(14 * s, bold: true)),
    ]),
  );

  static Widget _badge(IconData icon, double s) => Container(
    width: 40 * s, height: 40 * s,
    decoration: const BoxDecoration(color: _iconFill, shape: BoxShape.circle),
    child: Icon(icon, size: 20 * s, color: _green),
  );

  static BoxDecoration _decoration(double s) => BoxDecoration(
    color: _cardFill,
    borderRadius: BorderRadius.circular(30 * s),
    border: Border.all(color: _border, width: 1 * s),
    boxShadow: [BoxShadow(
      color: const Color(0x16000000), blurRadius: 3 * s,
      spreadRadius: 0.5 * s, offset: Offset(0, 1 * s),
    )],
  );

  static TextStyle _text(double size, {
    bool bold = false, Color color = _ink, double height = 1.4,
  }) => TextStyle(
    fontFamily: bold ? 'pb' : 'pr',
    fontSize: size,
    fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
    color: color,
    height: height,
  );
}
