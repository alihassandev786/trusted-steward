import 'package:flutter/material.dart';

/// Shared model — one TaskItem powers both the Today's Plan list row
/// and the full Task Detail screen it navigates to.
class TaskItem {
  final String tag;
  final IconData tagIcon;
  final String time;
  final String title;
  final String description;

  // Detail screen fields
  final String category;
  final String status;
  final String priority;
  final String detailsText;
  final String whenText;
  final String reminderText;
  final String journalSubtitle;

  const TaskItem({
    required this.tag,
    required this.tagIcon,
    required this.time,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.priority,
    required this.detailsText,
    required this.whenText,
    required this.reminderText,
    required this.journalSubtitle,
  });
}
