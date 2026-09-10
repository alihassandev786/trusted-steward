import 'dart:ui';

import 'package:flutter/material.dart';

import '../learn_screen_widgets/learn_theme.dart';


Future<bool> showLogoutDialog(BuildContext context) async {
  final result = await showGeneralDialog<bool>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss logout dialog',
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 180),
    pageBuilder: (dialogContext, animation, secondaryAnimation) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(dialogContext, false),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 7,
                  sigmaY: 7,
                ),
                child: ColoredBox(
                  color: Colors.black.withValues(alpha: 0.20),
                ),
              ),
            ),
          ),
          Center(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: Material(
                    color: learnCream,
                    borderRadius: BorderRadius.circular(16),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20, 23, 20, 22,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Logout',
                                style: learnText(
                                  15,
                                  color: const Color(0xFFAA0011),
                                  weight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Are you sure you want to logout?',
                                textAlign: TextAlign.center,
                                style: learnText(
                                  14,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1,
                          color: Color(0xFFDCD8CD),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: _DialogAction(
                                  label: 'Cancel',
                                  color: Colors.black54,
                                  onTap: () => Navigator.pop(
                                    dialogContext,
                                    false,
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                width: 1,
                                color: Color(0xFFDCD8CD),
                              ),
                              Expanded(
                                child: _DialogAction(
                                  label: 'Confirm',
                                  color: learnGreen,
                                  onTap: () => Navigator.pop(
                                    dialogContext,
                                    true,
                                  ),
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
            ),
          ),
        ],
      );
    },
    transitionBuilder: (_, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );

  return result ?? false;
}

class _DialogAction extends StatelessWidget {
  const _DialogAction({
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: learnText(
            14,
            color: color,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}