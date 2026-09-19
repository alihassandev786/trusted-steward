import 'package:flutter/material.dart';

class AIInputField extends StatefulWidget {
  const AIInputField({
    super.key,
    required this.onSend,
  });

  final Function(String) onSend;

  @override
  State<AIInputField> createState() => _AIInputFieldState();
}

class _AIInputFieldState extends State<AIInputField> {
  final controller = TextEditingController();

  void send() {
    if (controller.text.trim().isEmpty) return;
    widget.onSend(controller.text.trim());
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Ask about stewardship...",
              filled: true,
              fillColor: const Color(0xffF5F0DF),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: send,
          icon: const Icon(Icons.arrow_upward),
        ),
      ],
    );
  }
}
