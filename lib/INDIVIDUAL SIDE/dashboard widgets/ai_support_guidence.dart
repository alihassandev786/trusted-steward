import 'package:flutter/material.dart';
import 'app_palette.dart';

class AiSupportedGuidanceCard extends StatelessWidget {
  const AiSupportedGuidanceCard({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 26, 20, 24),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F2E6),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFE2E0D8)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI Supported Guidance',
            style: AppTextStyles.heading.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFEDDCAD),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Text(
              'You have 45 minutes of open margin before your '
                  '2:00 PM call. Consider completing your Journal '
                  'reflection or taking a brief walk in prayer.',
              style: TextStyle(
                fontFamily: AppTextStyles.subtitle.fontFamily,
                fontSize: 13,
                height: 1.4,
                color: const Color(0xFF806714),
              ),
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap ?? () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E703F),
                foregroundColor: Colors.white,
                elevation: 0,
                minimumSize: const Size.fromHeight(46),
                shape: const StadiumBorder(),
              ),
              child: Text(
                'View AI Guidance',
                style: TextStyle(
                  fontFamily: AppTextStyles.subtitle.fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}