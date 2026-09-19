import 'package:flutter/material.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';


class GuidancePhoto extends StatelessWidget {
  const GuidancePhoto({required this.height, this.image, this.detail = false});
  final double height;
  final ImageProvider? image;
  final bool detail;
  Widget _placeholder() => Container(color: FinanceColors.iconBg,
    child: const Center(child: Icon(Icons.landscape_outlined, size: 42, color: FinanceColors.green)));
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: SizedBox(height: height, width: double.infinity,
      child: Stack(fit: StackFit.expand, children: [
        if (image != null) Image(image: image!, fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _placeholder()) else _placeholder(),
        const DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(
          begin: Alignment.topCenter, end: Alignment.bottomCenter,
          colors: [Colors.transparent, Color(0x99000000)]))),
        Positioned(left: 16, right: 12, bottom: 20, child: Row(children: [
          const Icon(Icons.wb_sunny_outlined, color: Colors.white, size: 15),
          const SizedBox(width: 5),
          Expanded(child: Text('Quiet morning study • Oct 24${detail ? '  Leica Q2 • 28mm' : ''}',
            style: FinanceText.body(size: 9, color: Colors.white))),
        ])),
      ])),
  );
}
