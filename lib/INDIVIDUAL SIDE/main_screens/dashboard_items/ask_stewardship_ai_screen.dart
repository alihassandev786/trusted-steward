import 'package:flutter/material.dart';

import '../../dashboard widgets/chat_bubble.dart';
import '../../dashboard widgets/question_input.dart';
import '../../dashboard widgets/stewardship_page.dart';
import '../../dashboard widgets/stewardship_style.dart';
import '../../dashboard widgets/suggested_inquiry_tile.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';

class AskStewardshipAiScreen extends StatefulWidget {
  const AskStewardshipAiScreen({
    super.key,
    this.initialQuestion = '',
    this.onAsk,
  });

  final String initialQuestion;
  final StewardshipAsk? onAsk;

  @override
  State<AskStewardshipAiScreen> createState() => _AskStewardshipAiScreenState();
}

class _AskStewardshipAiScreenState extends State<AskStewardshipAiScreen> {
  final _scroll = ScrollController();
  final List<_Message> _messages = [];
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialQuestion.trim().isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _send(widget.initialQuestion);
      });
    }
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _send(String text) async {
    final question = text.trim();
    if (question.isEmpty || _busy) return;
    setState(() {
      _messages.add(_Message(question, true));
      _busy = true;
    });
    _scrollDown();
    String answer;
    try {
      answer = widget.onAsk == null
          ? 'AI is not connected yet. Connect your guidance service to receive a response.'
          : await widget.onAsk!(question);
      if (answer.trim().isEmpty)
        answer = 'No response was received. Please try again.';
    } catch (_) {
      answer = 'Unable to get a response right now. Please try again.';
    }
    if (!mounted) return;
    setState(() {
      _messages.add(_Message(answer, false));
      _busy = false;
    });
    _scrollDown();
  }

  @override
  Widget build(BuildContext context) => StewardshipPage(
    title: 'Ask Stewardship AI',
    child: Column(
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              controller: _scroll,
              padding: const EdgeInsets.fromLTRB(20, 42, 20, 36),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: (constraints.maxHeight - 78)
                      .clamp(0.0, double.infinity)
                      .toDouble(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const ChatBubble(
                          text: stewardshipDisclaimer,
                          user: false,
                        ),
                        for (final message in _messages) ...[
                          const SizedBox(height: 16),
                          ChatBubble(text: message.text, user: message.user),
                        ],
                        if (_busy)
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Semantics(
                              label: 'Waiting for guidance',
                              child: LinearProgressIndicator(
                                color: FinanceColors.green,
                                backgroundColor: FinanceColors.track,
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (_messages.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 60, top: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Suggested Inquiries',
                              style: FinanceText.subheading(size: 10),
                            ),
                            const SizedBox(height: 12),
                            SuggestedInquiryTile(
                              icon: Icons.schedule,
                              text:
                                  'How can I manage my time more intentionally?',
                              onTap: () => _send(
                                'How can I manage my time more intentionally?',
                              ),
                            ),
                            const SizedBox(height: 10),
                            SuggestedInquiryTile(
                              icon: Icons.menu_book_outlined,
                              text:
                                  'What approved scripture relates to stewardship?',
                              onTap: () => _send(
                                'What approved scripture relates to stewardship?',
                              ),
                            ),
                            const SizedBox(height: 10),
                            SuggestedInquiryTile(
                              icon: Icons.lightbulb_outline,
                              text: 'What should I learn next?',
                              onTap: () => _send('What should I learn next?'),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: FinanceColors.card,
            border: Border(top: BorderSide(color: FinanceColors.navBorder)),
          ),
          padding: const EdgeInsets.all(20),
          child: QuestionInput(
            hint: 'Ask a reflective question...',
            onSubmit: _send,
            enabled: !_busy,
          ),
        ),
      ],
    ),
  );
}

class _Message {
  const _Message(this.text, this.user);

  final String text;
  final bool user;
}
