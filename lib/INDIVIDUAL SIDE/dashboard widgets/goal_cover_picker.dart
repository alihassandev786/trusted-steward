import 'package:flutter/material.dart';
import '../teasure_dasbord_widgets/finance_theme.dart';

import 'goal_cover.dart';

class GoalCoverPicker extends StatelessWidget {
  const GoalCoverPicker({
    super.key,
    required this.image,
    required this.onTap,
    this.busy = false,
    this.hasDevicePicker = false,
  });

  final ImageProvider? image;
  final VoidCallback onTap;
  final bool busy;
  final bool hasDevicePicker;

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _DashedBorder(),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: busy ? null : onTap,
          child: SizedBox(
            height: 172,
            width: double.infinity,
            child: image != null
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      GoalCover(image: image!, height: 172),
                      Positioned(
                        right: 12,
                        bottom: 12,
                        child: CircleAvatar(
                          backgroundColor: FinanceColors.green,
                          child: Icon(
                            busy ? Icons.hourglass_empty : Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: FinanceColors.green,
                        child: busy
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.camera_alt, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        hasDevicePicker
                            ? 'Upload Cover Image'
                            : 'Choose Cover Image',
                        style: FinanceText.body(color: FinanceColors.text),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    ),
  );
}

class _DashedBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = FinanceColors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(.5, .5, size.width - 1, size.height - 1),
          const Radius.circular(30),
        ),
      );
    for (final metric in path.computeMetrics()) {
      for (double offset = 0; offset < metric.length; offset += 5) {
        canvas.drawPath(metric.extractPath(offset, offset + 2), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorder oldDelegate) => false;
}
