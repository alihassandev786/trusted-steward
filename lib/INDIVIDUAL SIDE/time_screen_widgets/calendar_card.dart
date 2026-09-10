import 'package:flutter/material.dart';

import '../dashboard widgets/app_palette.dart';


/// A single day cell's marker (small dot below the number).
enum DayMarker { none, gold, green }

/// Month calendar card: header with month name + prev/next arrows,
/// weekday row, and the date grid with a selected-day circle and
/// small colored dots for days that have events.
class CalendarCard extends StatelessWidget {
  final DateTime month; // any date within the month to display
  final int? selectedDay;
  final Map<int, DayMarker> markers;
  final ValueChanged<int>? onDaySelected;
  final VoidCallback? onPrevMonth;
  final VoidCallback? onNextMonth;

  const CalendarCard({
    super.key,
    required this.month,
    this.selectedDay,
    this.markers = const {},
    this.onDaySelected,
    this.onPrevMonth,
    this.onNextMonth,
  });

  static const _weekLabels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  static const _monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  @override
  Widget build(BuildContext context) {
    final firstOfMonth = DateTime(month.year, month.month, 1);
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final leadingBlanks = firstOfMonth.weekday % 7; // Sunday-first grid

    final daysInPrevMonth = DateTime(month.year, month.month, 0).day;

    // Build a flat list of cells: leading (prev month, greyed),
    // current month days, trailing (next month, greyed) to fill the grid.
    final List<_CalendarCell> cells = [];
    for (int i = leadingBlanks - 1; i >= 0; i--) {
      cells.add(_CalendarCell(daysInPrevMonth - i, inMonth: false));
    }
    for (int d = 1; d <= daysInMonth; d++) {
      cells.add(_CalendarCell(d, inMonth: true));
    }
    while (cells.length % 7 != 0 || cells.length < 42) {
      cells.add(_CalendarCell(cells.length - leadingBlanks - daysInMonth + 1,
          inMonth: false));
      if (cells.length >= 42) break;
    }

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppPalette.cardFill,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppPalette.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${_monthNames[month.month - 1]} ${month.year}',
                style: AppTextStyles.title,
              ),
              const Spacer(),
              _NavArrow(icon: Icons.chevron_left, onTap: onPrevMonth),
              const SizedBox(width: 6),
              _NavArrow(icon: Icons.chevron_right, onTap: onNextMonth),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: _weekLabels
                .map((l) => Expanded(
                      child: Center(
                          child: Text(l, style: AppTextStyles.dayLabel)),
                    ))
                .toList(),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cells.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final cell = cells[index];
              final bool isSelected =
                  cell.inMonth && cell.day == selectedDay;
              final marker =
                  cell.inMonth ? markers[cell.day] ?? DayMarker.none : DayMarker.none;

              return GestureDetector(
                onTap: cell.inMonth && onDaySelected != null
                    ? () => onDaySelected!(cell.day)
                    : null,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? AppPalette.green : null,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cell.day}',
                        style: AppTextStyles.dateNumber.copyWith(
                          color: !cell.inMonth
                              ? Colors.black26
                              : isSelected
                                  ? Colors.white
                                  : AppPalette.text,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: marker == DayMarker.gold
                            ? AppPalette.gold
                            : marker == DayMarker.green
                                ? AppPalette.green
                                : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CalendarCell {
  final int day;
  final bool inMonth;
  _CalendarCell(this.day, {required this.inMonth});
}

class _NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _NavArrow({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(icon, size: 20, color: Colors.black45),
      ),
    );
  }
}
