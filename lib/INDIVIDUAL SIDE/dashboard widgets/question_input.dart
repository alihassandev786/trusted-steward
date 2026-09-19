import 'package:flutter/material.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/dashboard%20widgets/stewardship_style.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';

class QuestionInput extends StatefulWidget {
  const QuestionInput({
    required this.hint,
    required this.onSubmit,
    this.enabled = true,
  });

  final String hint;
  final ValueChanged<String> onSubmit;
  final bool enabled;

  @override
  State<QuestionInput> createState() => _QuestionInputState();
}

class _QuestionInputState extends State<QuestionInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (!widget.enabled || text.isEmpty) return;
    _controller.clear();
    widget.onSubmit(text);
  }

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(minHeight: 56),
    padding: const EdgeInsets.only(left: 16, right: 4),
    decoration: BoxDecoration(
      color: FinanceColors.tileFill,
      borderRadius: BorderRadius.circular(32),
      border: Border.all(color: stewardshipInkGold, width: .7),
    ),
    child: Row(
      children: [
        const Icon(
          Icons.psychology_alt_outlined,
          color: stewardshipInkGold,
          size: 21,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            controller: _controller,
            enabled: widget.enabled,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) => _submit(),
            style: FinanceText.body(size: 12, color: FinanceColors.text),
            decoration: InputDecoration(
              hintText: widget.hint,
              border: InputBorder.none,
              isDense: true,
              hintStyle: FinanceText.body(
                size: 11,
                color: const Color(0xFF666666),
              ),
            ),
          ),
        ),
        IconButton(
          tooltip: 'Send question',
          onPressed: widget.enabled ? _submit : null,
          icon: const CircleAvatar(
            radius: 18,
            backgroundColor: stewardshipInkGold,
            child: Icon(Icons.send_rounded, size: 18, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
