import 'package:flutter/material.dart';

import '../../learn_screen_widgets/learn_button.dart';
import '../../learn_screen_widgets/learn_theme.dart';
import '../../teasure_dasbord_widgets/detail_screen_header.dart';

class RateAppScreen extends StatefulWidget {
  const RateAppScreen({
    super.key,
    this.onSubmit,
  });

  final Future<void> Function(int rating, String feedback)? onSubmit;

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  final TextEditingController _feedbackController =
  TextEditingController();

  // Reference image mein three stars selected hain.
  int _rating = 3;
  bool _submitting = false;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_submitting) return;

    FocusScope.of(context).unfocus();

    final submit = widget.onSubmit;

    if (submit == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Feedback submission is not connected yet.'),
        ),
      );
      return;
    }

    setState(() => _submitting = true);

    try {
      await submit(
        _rating,
        _feedbackController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thank you for your feedback!'),
        ),
      );
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not submit feedback. Please try again.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const DetailScreenHeader(title: 'Rate App'),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 88, 20, 40),
                child: Column(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(5, (index) {
                        final value = index + 1;
                        final selected = value <= _rating;

                        return IconButton(
                          tooltip: '$value out of 5 stars',
                          onPressed: _submitting
                              ? null
                              : () {
                            setState(() {
                              _rating = value;
                            });
                          },
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 44,
                            minHeight: 48,
                          ),
                          iconSize: 44,
                          color: learnGreen,
                          disabledColor: learnGreen,
                          icon: Icon(
                            selected
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 66),

                    Text(
                      'How was your experience?',
                      textAlign: TextAlign.center,
                      style: learnText(
                        16,
                        weight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 22),

                    TextField(
                      controller: _feedbackController,
                      enabled: !_submitting,
                      minLines: 5,
                      maxLines: 7,
                      keyboardType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.sentences,
                      style: learnText(12),
                      decoration: InputDecoration(
                        hintText: 'Share your experience about the App...',
                        hintStyle: learnText(
                          11,
                          color: Colors.black54,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFECE8D8),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 24,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: learnGreen,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    LearnButton(
                      label: _submitting ? 'Submitting...' : 'Submit',
                      onPressed: _submitting ? null : _submit,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}