import 'package:flutter/material.dart';
import 'app_palette.dart';

class MyTalentsCard extends StatelessWidget {
  const MyTalentsCard({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
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
            'My Talents',
            style: AppTextStyles.heading.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            'Developing the gifts God gave you.',
            style: TextStyle(
              fontFamily: AppTextStyles.subtitle.fontFamily,
              fontSize: 13,
              color: const Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 25),
          Wrap(
            spacing: 7,
            runSpacing: 8,
            children: [
              for (final talent in [
                'Teaching',
                'Servant Leadership',
                'Worship',
              ])
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA9C0A5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    talent,
                    style: TextStyle(
                      fontFamily: AppTextStyles.heading.fontFamily,
                      fontSize: 10,
                      color: const Color(0xFF346B40),
                    ),
                  ),
                ),
            ],
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
                'View Talents',
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