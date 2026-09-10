import 'package:flutter/material.dart';

class _Palette {
  static const green = Color(0xFF306C3F);
  static const gold = Color(0xFFD1A436);
  static const text = Color(0xFF1E1E1E);
  static const tile = Color(0xFFF6F2E6);
  static const background = Color(0xFFF9F8F2);
}

class StewardScoreScreen extends StatelessWidget {
  const StewardScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final bottomSafeArea = MediaQuery.paddingOf(context).bottom;
    final bottomPosition = bottomSafeArea > 10 ? bottomSafeArea + 10 : 22.0;

    return Scaffold(
      backgroundColor: _Palette.background,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Green header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: h * 0.25,
            child: Container(
              decoration: const BoxDecoration(
                color: _Palette.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(68),
                  bottomRight: Radius.circular(68),
                ),
              ),
            ),
          ),

          // Back button
          Positioned(
            top: h * 0.07,
            left: 25,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 34, minHeight: 34),
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              icon: const Icon(Icons.chevron_left, color: Colors.white, size: 26),
            ),
          ),

          // Header title
          Positioned(
            top: h * 0.08,
            left: 70,
            right: 30,
            child: const Text(
              'Individual Stewardship Score',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'pop',
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          // Score circle
          Positioned(
            top: h * 0.15,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 170,
                height: 170,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _Palette.text.withOpacity(0.06),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: _Palette.gold, width: 8),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '903',
                        style: TextStyle(
                          fontFamily: 'pop',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: _Palette.gold,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        'Score',
                        style: TextStyle(
                          fontFamily: 'pop',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: _Palette.text,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Main content
          Positioned(
            top: h * 0.4,
            left: 18,
            right: 18,
            bottom: bottomPosition,
            child: Column(
              children: [
                const Text(
                  'Balance Steward',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'pop',
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: _Palette.text,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'You manage your resources well across\nall areas of life.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'pop',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: _Palette.text.withOpacity(0.75),
                      height: 1.25,
                    ),
                  ),
                ),
                const SizedBox(height: 46),

                _StatRow(
                  icon: Icons.access_time,
                  name: 'Time',
                  progress: 0.80,
                ),
                const SizedBox(height: 12),
                _StatRow(
                  icon: Icons.psychology_outlined,
                  name: 'Talents',
                  progress: 0.45,
                ),
                const SizedBox(height: 12),
                _StatRow(
                  icon: Icons.account_balance_wallet_outlined,
                  name: 'Treasure',
                  progress: 1.0,
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      backgroundColor: _Palette.green,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontFamily: 'pop',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final IconData icon;
  final String name;
  final double progress;

  const _StatRow({
    required this.icon,
    required this.name,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: _Palette.tile,
        borderRadius: BorderRadius.circular(34),
        border: Border.all(color: _Palette.text.withOpacity(0.08), width: 1),
        boxShadow: [
          BoxShadow(
            color: _Palette.text.withOpacity(0.07),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _Palette.green.withOpacity(0.22),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: _Palette.green, size: 19),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontFamily: 'pop',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _Palette.text,
              ),
            ),
          ),
          SizedBox(
            width: 78,
            height: 7,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: _Palette.text.withOpacity(0.50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _Palette.gold,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}