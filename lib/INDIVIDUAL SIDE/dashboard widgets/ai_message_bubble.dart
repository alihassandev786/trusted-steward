import 'package:flutter/material.dart';

class AIMessageBubble extends StatelessWidget {
  const AIMessageBubble({
    super.key,
    required this.message,
    required this.isUser,
  });

  final String message;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          color: isUser
              ? const Color(0xffD9E3D0)
              : const Color(0xffF5F0DF),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(message),
      ),
    );
  }
}
