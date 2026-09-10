import 'package:flutter/material.dart';
import 'finance_theme.dart';

class MonthlyProvisionCard extends StatelessWidget {
  const MonthlyProvisionCard({
    super.key,
    required this.totalIncome,
    required this.totalExpenses,
    required this.faithfulGiving,
    required this.givingProgress,
    required this.currentSavings,
  });

  final String totalIncome;
  final String totalExpenses;
  final String faithfulGiving;
  final double givingProgress;
  final String currentSavings;

  static const Color _cardColor = Color(0xFFF6F2E6);
  static const Color _goldColor = Color(0xFFD9A528);
  static const Color _progressBackground = Color(0xFF8A8A8A);
  static const Color _textColor = Color(0xFF292929);
  static const Color _labelColor = Color(0xFF6F6F6F);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(30, 36, 30, 42),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.12),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.14),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Monthly Provision',
            style: TextStyle(
              color: _textColor,
              fontSize: 17,fontFamily: "popp",
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 28),

          Row(
            children: [
              Expanded(
                child: _AmountColumn(
                  label: 'Total Income',
                  amount: totalIncome,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _AmountColumn(
                  label: 'Total Expenses',
                  amount: totalExpenses,
                ),
              ),
            ],
          ),

          const SizedBox(height: 38),

          _ValueRow(
            label: 'Faithful Giving',
            value: faithfulGiving,
          ),
          const SizedBox(height: 14),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: givingProgress.clamp(0.0, 1.0),
              minHeight: 7,
              backgroundColor: _progressBackground,
              valueColor: const AlwaysStoppedAnimation<Color>(_goldColor),
            ),
          ),

          const SizedBox(height: 18),

          _ValueRow(
            label: 'Current Savings',
            value: currentSavings,
          ),
        ],
      ),
    );
  }
}

class _AmountColumn extends StatelessWidget {
  const _AmountColumn({
    required this.label,
    required this.amount,
  });

  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: MonthlyProvisionCard._labelColor,
            fontSize: 13,fontFamily: "popp",
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          amount,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: MonthlyProvisionCard._goldColor,
            fontSize: 32,
            height: 1,fontFamily: "popp",
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _ValueRow extends StatelessWidget {
  const _ValueRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: MonthlyProvisionCard._labelColor,
              fontSize: 13,fontFamily: "popp"
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: MonthlyProvisionCard._textColor,
            fontSize: 16,fontFamily: "popp",
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}