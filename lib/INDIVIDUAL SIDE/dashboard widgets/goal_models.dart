import 'package:flutter/material.dart';

import 'goal_assets.dart';


/// Optional integration for your own image picker. Return null on cancellation.
typedef GoalCoverPicker = Future<ImageProvider?> Function();

class GoalConnection {
  GoalConnection({
    required this.title,
    required this.subtitle,
    this.complete = false,
  });

  final String title;
  final String subtitle;
  bool complete;
}

class StewardshipGoal {
  StewardshipGoal({
    required this.id,
    required this.title,
    required this.category,
    required this.target,
    required this.unit,
    required this.dueDate,
    this.logged = 0,
    this.cover = const AssetImage(GoalAssets.bible),
    ImageProvider? detailCover,
    List<GoalConnection>? connections,
  }) : detailCover = detailCover ?? cover,
       connections = connections ?? [];
  final String id;
  final String title;
  final String category;
  final int target;
  final String unit;
  final DateTime dueDate;
  final ImageProvider cover;
  final ImageProvider detailCover;
  final List<GoalConnection> connections;
  int logged;

  double get progress =>
      target > 0 ? (logged / target).clamp(0.0, 1.0).toDouble() : 0;

  bool get complete => progress >= 1;

  int get remaining => (target - logged).clamp(0, target).toInt();

  String get progressText => unit == 'USD'
      ? '\$$logged / \$$target'
      : '$logged of $target ${unit.toLowerCase()}';
}

class GoalsController extends ChangeNotifier {
  GoalsController({List<StewardshipGoal>? initialGoals})
    : _goals = List.of(initialGoals ?? []);
  final List<StewardshipGoal> _goals;

  List<StewardshipGoal> get goals => List.unmodifiable(_goals);

  void add(StewardshipGoal goal) {
    _goals.add(goal);
    notifyListeners();
  }

  void markComplete(StewardshipGoal goal) {
    goal.logged = goal.target;
    for (final connection in goal.connections) {
      connection.complete = true;
    }
    notifyListeners();
  }

  factory GoalsController.demo() => GoalsController(
    initialGoals: [
      StewardshipGoal(
        id: 'proverbs',
        title: 'Read 10 Proverbs with Dad',
        category: 'Faith & Wisdom',
        target: 10,
        logged: 7,
        unit: 'Sessions',
        dueDate: DateTime(2024, 12, 31),
        cover: const AssetImage(GoalAssets.nativity),
        detailCover: const AssetImage(GoalAssets.bible),
        connections: _demoConnections(),
      ),
      StewardshipGoal(
        id: 'giving',
        title: 'Read 10 Proverbs with Dad',
        category: 'Faith & Wisdom',
        target: 12000,
        logged: 10200,
        unit: 'USD',
        dueDate: DateTime(2024, 12, 31),
        cover: const AssetImage(GoalAssets.leaves),
      ),
      StewardshipGoal(
        id: 'learning',
        title: 'Read 10 Proverbs with Dad',
        category: 'Faith & Wisdom',
        target: 8,
        logged: 4,
        unit: 'Modules',
        dueDate: DateTime(2024, 12, 31),
        cover: const AssetImage(GoalAssets.sunlight),
      ),
    ],
  );

  static StewardshipGoal detailDemo() => StewardshipGoal(
    id: 'biblical',
    title: 'Biblical Stewardship 101',
    category: 'Faith',
    target: 20,
    logged: 12,
    unit: 'Sessions',
    dueDate: DateTime(2024, 12, 31),
    connections: _demoConnections(),
  );

  static List<GoalConnection> _demoConnections() => [
    GoalConnection(
      title: 'Mentoring Session',
      subtitle: 'Oct 24, 2:00PM',
      complete: true,
    ),
    GoalConnection(
      title: 'Curriculum Prep',
      subtitle: 'Oct 28, 4:00PM',
      complete: true,
    ),
    GoalConnection(title: 'Lesson 3', subtitle: 'The Gift of Talents'),
  ];
}
