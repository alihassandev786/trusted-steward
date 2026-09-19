import 'package:flutter/material.dart';

class GivingEntry {
  const GivingEntry({
    required this.title,
    required this.intent,
    required this.recipient,
    required this.amount,
    required this.date,
    this.notes = '',
    this.recurring = false,
    this.icon = Icons.volunteer_activism,
  });

  final String title;
  final String intent;
  final String recipient;
  final double amount;
  final DateTime date;
  final String notes;
  final bool recurring;
  final IconData icon;
}

class SavingsGoal {
  const SavingsGoal({
    required this.title,
    required this.targetAmount,
    required this.currentAmount,
    required this.targetDate,
  });

  final String title;
  final double targetAmount;
  final double currentAmount;
  final DateTime targetDate;
}