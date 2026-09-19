import 'package:flutter/material.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/dashboard%20widgets/stewardship_style.dart';
import '../teasure_dasbord_widgets/finance_theme.dart';
import 'guidance_photo.dart';

class ScriptureCard extends StatelessWidget {
  const ScriptureCard({
    required this.onOpen,
    this.image,
    this.showPhoto = false,
  });

  final VoidCallback onOpen;
  final ImageProvider? image;
  final bool showPhoto;

  @override
  Widget build(BuildContext context) => Container(
    decoration: stewardshipSurface(),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onOpen,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Scripture Anchor',
                      style: FinanceText.body(
                        size: 10,
                        color: FinanceColors.text,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const SizedBox(
                    height: 32,
                    width: 48,
                    child: Icon(
                      Icons.chevron_right,
                      color: FinanceColors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Wisdom in Sabbath Rest',
                style: FinanceText.subheading(size: 14),
              ),
              const SizedBox(height: 4),
              Text(
                '“Come to me, all who labor and are heavy laden, and I will give you rest.”',
                style: FinanceText.body(
                  color: FinanceColors.text,
                ).copyWith(height: 1.45),
              ),
              const SizedBox(height: 12),
              Text(
                '-MATTHEW 11:28',
                style: FinanceText.body(size: 10, color: FinanceColors.gold),
              ),
              if (showPhoto) ...[
                const SizedBox(height: 28),
                GuidancePhoto(image: image, height: 120),
              ],
              const SizedBox(height: 28),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: stewardshipNote,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.auto_graph,
                      size: 17,
                      color: stewardshipInkGold,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'AI Context Note.',
                        style: FinanceText.body(color: stewardshipInkGold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
