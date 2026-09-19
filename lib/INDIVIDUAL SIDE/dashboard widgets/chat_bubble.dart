import 'package:flutter/material.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';


class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.text, required this.user});
  final String text;
  final bool user;
  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: user ? MainAxisAlignment.end : MainAxisAlignment.start,
    children: [
      if (!user) ...[
        const CircleAvatar(radius: 16, backgroundColor: Color(0xFFBED0BF),
          child: Icon(Icons.eco, color: FinanceColors.green, size: 22)),
        const SizedBox(width: 9),
      ],
      Flexible(child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        decoration: BoxDecoration(
          color: user ? FinanceColors.tileFill : FinanceColors.green,
          borderRadius: BorderRadius.only(topLeft: const Radius.circular(30),
            topRight: const Radius.circular(30), bottomLeft: Radius.circular(user ? 30 : 0),
            bottomRight: Radius.circular(user ? 0 : 30)),
          boxShadow: const [BoxShadow(color: Color(0x20000000), blurRadius: 4)],
        ),
        child: Text(text, style: FinanceText.body(color: user ? FinanceColors.text : Colors.white).copyWith(height: 1.25)),
      )),
      if (!user) const SizedBox(width: 36),
    ],
  );
}
