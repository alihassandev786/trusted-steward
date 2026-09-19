import 'package:flutter/material.dart';

enum AssignedTo { first, second, both }

class GivingTransaction {
  const GivingTransaction({
    required this.id,
    required this.intent,
    required this.recipient,
    required this.date,
    required this.amount,
    this.title = 'Church Giving',
    this.notes = '',
    this.assignedTo = AssignedTo.both,
  });
  final String id;
  final String title;
  final String intent;
  final String recipient;
  final DateTime date;
  final double amount;
  final String notes;
  final AssignedTo assignedTo;

  static GivingTransaction example() => GivingTransaction(
    id: 'example-church', intent: 'Fruits', recipient: 'Community Church',
    date: DateTime(2026, 9, 10), amount: 100,
    notes: 'Monthly pledge for local community outreach and youth missions. '
        'Dedicated during the Sunday gathering offering.',
  );
}

class SharedGoal {
  const SharedGoal({
    required this.title,
    required this.category,
    required this.dueDate,
    required this.target,
    this.coverImage,
    this.assignedTo = AssignedTo.both,
    this.learnGoal = '',
    this.logged = 0,
    this.lessonsDone = 0,
    this.lessonCount = 5,
    this.complete = false,
  });
  final String title;
  final String category;
  final DateTime dueDate;
  final int target;
  final int logged;
  final int lessonsDone;
  final int lessonCount;
  final String learnGoal;
  final ImageProvider? coverImage;
  final AssignedTo assignedTo;
  final bool complete;

  double get progress => complete ? 1 : lessonCount == 0
      ? 0 : (lessonsDone / lessonCount).clamp(0.0, 1.0).toDouble();
  int get remaining => complete ? 0 : (target - logged).clamp(0, target).toInt();
  SharedGoal markComplete() => SharedGoal(
    title: title, category: category, dueDate: dueDate, target: target,
    coverImage: coverImage, assignedTo: assignedTo, learnGoal: learnGoal,
    logged: target, lessonsDone: lessonCount, lessonCount: lessonCount, complete: true,
  );
  static SharedGoal example() => SharedGoal(
    title: 'Biblical Stewardship 101', category: 'Faith',
    dueDate: DateTime(2024, 12, 31), target: 20, logged: 15,
    lessonsDone: 3, lessonCount: 5,
    coverImage: const AssetImage('assets/images/goal_cover.jpg'),
  );
}

typedef SaveGiving = Future<void> Function(GivingTransaction transaction);
typedef SaveGoal = Future<void> Function(SharedGoal goal);
