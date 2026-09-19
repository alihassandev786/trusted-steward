import 'package:flutter/material.dart';
import '../../../INDIVIDUAL SIDE/teasure_dasbord_widgets/finance_theme.dart';

import 'stewardship_models.dart';

// Adapter uses the FinanceColors/FinanceText supplied in your existing project.
class StewardStyle {
  static const bg = FinanceColors.background;
  static const card = FinanceColors.card;
  static const green = FinanceColors.darkGreen;
  static const gold = FinanceColors.gold;
  static const ink = FinanceColors.textDark;
  static const muted = FinanceColors.textMuted;
  static const field = FinanceColors.tileFill;
  static const iconFill = Color(0xFFBDCCB6);
  static const badge = Color(0xFFA8BFA2);
  static const paleGold = Color(0xFFEDDCB0);
  static TextStyle text(double size, {bool bold = false, Color? color}) => bold
      ? FinanceText.subheading(size: size, color: color ?? ink)
      : FinanceText.body(size: size, color: color ?? ink);
  static TextStyle heading(double size, {Color? color}) =>
      FinanceText.heading(size: size, color: color ?? ink);
  static BoxDecoration box({double radius = 30, Color color = card}) => BoxDecoration(
    color: color, borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: FinanceColors.navBorder),
    boxShadow: const [BoxShadow(color: Color(0x16000000), blurRadius: 3, spreadRadius: .5)],
  );
}

class StewardAssets {
  static const first = AssetImage('assets/images/mom.png');
  static const second = AssetImage('assets/images/home1.png');
}

class StewardPage extends StatelessWidget {
  const StewardPage({super.key, required this.title, required this.child,
    this.form = false, this.headerGap = 39});
  final String title;
  final Widget child;
  final bool form;
  final double headerGap;
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: StewardStyle.bg,
    body: SafeArea(child: Align(alignment: Alignment.topCenter,
      child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 520),
        child: LayoutBuilder(builder: (context, constraints) => SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(children: [
            Padding(padding: EdgeInsets.fromLTRB(20, 28, 20, headerGap),
              child: Row(children: [
                const StewardBack(), const SizedBox(width: 16),
                Expanded(child: Text(title, style: StewardStyle.heading(21))),
              ])),
            if (form)
              Container(
                width: double.infinity,
                constraints: BoxConstraints(minHeight:
                  (constraints.maxHeight - 73 - headerGap).clamp(0.0, double.infinity).toDouble()),
                decoration: StewardStyle.box(radius: 68).copyWith(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(68))),
                padding: const EdgeInsets.fromLTRB(20, 48, 20, 36),
                child: child,
              )
            else Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 38), child: child),
          ]),
        )),
      ),
    )),
  );
}

class StewardBack extends StatelessWidget {
  const StewardBack({super.key, this.result});
  final Object? result;
  @override
  Widget build(BuildContext context) => SizedBox(width: 45, height: 45,
    child: Material(color: StewardStyle.green, shape: const CircleBorder(),
      child: IconButton(tooltip: 'Back',
        onPressed: () => Navigator.of(context).maybePop(result),
        icon: const Icon(Icons.chevron_left, color: Colors.white, size: 26)),
    ));
}

class StewardButton extends StatelessWidget {
  const StewardButton({super.key, required this.label, required this.onPressed, this.busy = false});
  final String label;
  final VoidCallback? onPressed;
  final bool busy;
  @override
  Widget build(BuildContext context) => SizedBox(width: double.infinity,
    child: ElevatedButton(
      onPressed: busy ? null : onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0, backgroundColor: StewardStyle.green, foregroundColor: Colors.white,
        disabledBackgroundColor: StewardStyle.green.withOpacity(.65),
        disabledForegroundColor: Colors.white, minimumSize: const Size(0, 46),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: const StadiumBorder(), textStyle: StewardStyle.text(14, bold: true)),
      child: busy ? const SizedBox(width: 20, height: 20,
        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : Text(label),
    ));
}

class StewardAvatar extends StatelessWidget {
  const StewardAvatar({super.key, required this.image, this.radius = 24, this.initial = 'S'});
  final ImageProvider image;
  final double radius;
  final String initial;
  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: radius, backgroundColor: StewardStyle.iconFill,
    foregroundImage: image, onForegroundImageError: (_, __) {},
    child: Text(initial, style: StewardStyle.text(radius * .7, bold: true)),
  );
}

class AssignSelector extends StatelessWidget {
  const AssignSelector({super.key, required this.value, required this.onChanged,
    this.firstImage = StewardAssets.first, this.secondImage = StewardAssets.second,
    this.firstName = 'Sarah', this.secondName = 'Sarah'});
  final AssignedTo value;
  final ValueChanged<AssignedTo>? onChanged;
  final ImageProvider firstImage;
  final ImageProvider secondImage;
  final String firstName;
  final String secondName;
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text('Assign To', style: StewardStyle.text(12)), const SizedBox(height: 16),
    IntrinsicHeight(child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      for (int i = 0; i < 3; i++) ...[
        if (i > 0) const SizedBox(width: 8),
        Expanded(child: _option(AssignedTo.values[i], i)),
      ],
    ])),
  ]);
  Widget _option(AssignedTo option, int i) {
    final selected = value == option;
    return Semantics(selected: selected, button: true,
      child: Container(decoration: StewardStyle.box(radius: 20,
        color: selected ? StewardStyle.green : StewardStyle.card),
        child: Material(color: Colors.transparent,
          child: InkWell(borderRadius: BorderRadius.circular(20),
            onTap: onChanged == null ? null : () => onChanged!(option),
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
              child: Column(children: [
                if (i == 2) CircleAvatar(radius: 24,
                  backgroundColor: Colors.white.withOpacity(.3),
                  child: const Icon(Icons.groups_outlined, color: StewardStyle.green, size: 28))
                else StewardAvatar(image: i == 0 ? firstImage : secondImage),
                const SizedBox(height: 9),
                Text(i == 2 ? 'Both' : i == 0 ? firstName : secondName,
                  textAlign: TextAlign.center,
                  style: StewardStyle.text(12, bold: true, color: selected ? Colors.white : StewardStyle.ink)),
                const SizedBox(height: 2),
                Text(i == 2 ? 'Together' : 'Partner',
                  style: StewardStyle.text(10, color: selected ? Colors.white70 : StewardStyle.muted)),
              ])),
          )),
      ));
  }
}

class AssignedCard extends StatelessWidget {
  const AssignedCard({super.key, required this.assignedTo,
    this.firstImage = StewardAssets.first, this.secondImage = StewardAssets.second,
    this.firstName = 'Sarah', this.secondName = 'John'});
  final AssignedTo assignedTo;
  final ImageProvider firstImage;
  final ImageProvider secondImage;
  final String firstName;
  final String secondName;
  @override
  Widget build(BuildContext context) => Container(
    decoration: StewardStyle.box(), padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Row(children: [
      SizedBox(width: 65, height: 36, child: Stack(children: [
        Positioned(left: 0, child: _photo(assignedTo == AssignedTo.second ? secondImage : firstImage)),
        if (assignedTo == AssignedTo.both) Positioned(left: 26, child: _photo(secondImage)),
      ])),
      const SizedBox(width: 15),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(assignedTo == AssignedTo.both ? 'Both' : assignedTo == AssignedTo.first ? firstName : secondName,
          style: StewardStyle.text(14, bold: true)),
        const SizedBox(height: 4),
        Text(assignedTo == AssignedTo.both ? '$firstName & $secondName' : 'Partner',
          style: StewardStyle.text(12)),
      ])),
    ]),
  );
  Widget _photo(ImageProvider image) => Container(
    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 1.5)),
    child: StewardAvatar(image: image, radius: 15));
}

InputDecoration stewardInput(String hint, {Widget? suffix}) => InputDecoration(
  hintText: hint, hintStyle: StewardStyle.text(11, color: StewardStyle.muted),
  filled: true, fillColor: StewardStyle.field, isDense: true,
  contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
  suffixIcon: suffix,
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: BorderSide.none),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: BorderSide.none),
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: StewardStyle.green)),
);

class StewardDropdown extends StatelessWidget {
  const StewardDropdown({super.key, required this.hint, required this.items,
    required this.value, required this.onChanged});
  final String hint;
  final List<String> items;
  final String? value;
  final ValueChanged<String?>? onChanged;
  @override
  Widget build(BuildContext context) => DropdownButtonFormField<String>(
    value: value, isExpanded: true, decoration: stewardInput(hint),
    icon: const Icon(Icons.keyboard_arrow_down, color: StewardStyle.green, size: 22),
    dropdownColor: StewardStyle.card, style: StewardStyle.text(12),
    items: {...items, if (value != null) value!}.map((v) =>
      DropdownMenuItem(value: v, child: Text(v))).toList(),
    onChanged: onChanged,
    validator: (v) => v == null || v.isEmpty ? 'Please select $hint' : null,
  );
}

class StewardDateField extends StatelessWidget {
  const StewardDateField({super.key, required this.hint, required this.value, required this.onTap});
  final String hint;
  final DateTime? value;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Material(
    color: StewardStyle.field, borderRadius: BorderRadius.circular(28),
    child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(28),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Row(children: [
          Expanded(child: Text(value == null ? hint : MaterialLocalizations.of(context).formatMediumDate(value!),
            style: StewardStyle.text(11, color: value == null ? StewardStyle.muted : StewardStyle.ink))),
          const Icon(Icons.calendar_today_outlined, color: StewardStyle.green, size: 16),
        ])),
    ));
}

void stewardMessage(BuildContext context, String text) =>
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

String money(double value) {
  final pieces = value.toStringAsFixed(value == value.roundToDouble() ? 0 : 2).split('.');
  final whole = pieces.first.replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');
  return '\$$whole${pieces.length > 1 ? '.${pieces[1]}' : ''}';
}
