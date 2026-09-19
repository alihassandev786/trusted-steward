import 'package:flutter/material.dart';
import '../../../../../INDIVIDUAL SIDE/teasure_dasbord_widgets/finance_theme.dart';


// Pass a StewardshipTask and optional onCompleted persistence callback.

class StewardshipTask {
  const StewardshipTask({
    required this.name,
    required this.assignee,
    required this.category,
    required this.dueDate,
    this.reminderEnabled = true,
    this.reminderTime = const TimeOfDay(hour: 9, minute: 0),
    this.completed = false,
  });

  final String name;
  final String assignee;
  final String category;
  final DateTime dueDate;
  final bool reminderEnabled;
  final TimeOfDay reminderTime;
  final bool completed;

  StewardshipTask markComplete() => StewardshipTask(
    name: name, assignee: assignee, category: category, dueDate: dueDate,
    reminderEnabled: reminderEnabled, reminderTime: reminderTime,
    completed: true,
  );
}

typedef TaskSaveCallback = Future<void> Function(StewardshipTask task);

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key, required this.task, this.assigneeImage, this.onCompleted});
  final StewardshipTask task;
  final ImageProvider? assigneeImage;
  final TaskSaveCallback? onCompleted;

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  late StewardshipTask _task;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _task = widget.task;
  }

  Future<void> _complete() async {
    setState(() => _saving = true);
    final completed = _task.markComplete();
    try {
      await widget.onCompleted?.call(completed);
      if (mounted) setState(() => _task = completed);
    } catch (_) {
      if (mounted) _message(context, 'Could not complete task. Please try again.');
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: FinanceColors.background,
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Column(children: [
            _Header(title: 'Task Detail', result: _task),
            Expanded(child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(_task.name, style: FinanceText.heading(size: 17)),
                const SizedBox(height: 6),
                Text(_task.category == 'Household' ? 'Household & Dwelling stewardship routine'
                    : '${_task.category} stewardship routine',
                    style: FinanceText.body(size: 12, color: FinanceColors.textDark)),
                const SizedBox(height: 18),
                Row(children: [
                  _Avatar(name: _task.assignee, image: widget.assigneeImage,
                      radius: 12, group: _task.assignee == 'Both'),
                  const SizedBox(width: 12),
                  Flexible(child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(color: FinanceColors.darkGreen.withOpacity(0.38),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text('Assigned to ${_task.assignee}',
                        style: FinanceText.body(size: 10, color: FinanceColors.darkGreen)),
                  )),
                ]),
                const SizedBox(height: 49),
                Container(
                  decoration: _surface(),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: IntrinsicHeight(child: Row(children: [
                    Expanded(child: _Info(label: 'Category', value: _task.category)),
                    const VerticalDivider(width: 40, thickness: 0.7, color: FinanceColors.gold),
                    Expanded(child: _Info(label: 'Due Date', value: _dateLabel(context, _task.dueDate))),
                  ])),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: _surface(),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                  child: Row(children: [
                    Expanded(child: _Info(label: 'Reminder', value: _task.reminderEnabled
                        ? '${DateUtils.isSameDay(_task.dueDate, DateTime.now()) ? 'Today' : MaterialLocalizations.of(context).formatShortDate(_task.dueDate)} at ${_task.reminderTime.format(context)}'
                        : 'Off')),
                    Icon(_task.reminderEnabled ? Icons.check_circle_outline : Icons.notifications_off_outlined,
                        size: 18, color: FinanceColors.darkGreen),
                  ]),
                ),
                const SizedBox(height: 64),
                _ActionButton(label: _task.completed ? 'Completed' : 'Mark Complete',
                    busy: _saving, onPressed: _task.completed ? null : _complete),
              ]),
            )),
          ]),
        ),
      ),
    ),
  );
}

class _Header extends StatelessWidget {
  const _Header({required this.title, this.result});
  final String title;
  final StewardshipTask? result;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 28, 20, 25),
    child: Row(children: [
      SizedBox(width: 45, height: 45, child: Material(
        color: FinanceColors.darkGreen, shape: const CircleBorder(),
        child: IconButton(
          tooltip: 'Back',
          onPressed: () => Navigator.of(context).maybePop(result),
          icon: const Icon(Icons.chevron_left, color: Colors.white, size: 27),
        ),
      )),
      const SizedBox(width: 16),
      Expanded(child: Text(title, style: FinanceText.heading(size: 21))),
    ]),
  );
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.name, required this.radius, this.image, this.group = false});
  final String name;
  final double radius;
  final ImageProvider? image;
  final bool group;

  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: radius, backgroundColor: FinanceColors.iconBg,
    foregroundImage: image,
    onForegroundImageError: image == null ? null : (_, __) {},
    child: group ? Icon(Icons.groups_outlined, color: FinanceColors.darkGreen, size: radius)
        : Text(name.trim().isEmpty ? '?' : name.trim().substring(0, 1).toUpperCase(),
        style: FinanceText.subheading(size: radius * 0.7, color: FinanceColors.darkGreen)),
  );
}

class _Info extends StatelessWidget {
  const _Info({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: FinanceText.body(size: 10, color: FinanceColors.textMuted)),
      const SizedBox(height: 6),
      Text(value, style: FinanceText.body(size: 12, color: FinanceColors.textDark)),
    ],
  );
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.label, required this.onPressed, this.busy = false});
  final String label;
  final VoidCallback? onPressed;
  final bool busy;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: busy ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: FinanceColors.darkGreen, foregroundColor: Colors.white,
        disabledBackgroundColor: FinanceColors.darkGreen.withOpacity(0.65),
        disabledForegroundColor: Colors.white,
        elevation: 0, minimumSize: const Size.fromHeight(46),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: const StadiumBorder(),
        textStyle: FinanceText.subheading(size: 14, weight: FontWeight.w500),
      ),
      child: busy ? const SizedBox(width: 20, height: 20,
          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : Text(label),
    ),
  );
}

const _shadow = [BoxShadow(color: Color(0x16000000), blurRadius: 3, spreadRadius: 0.5)];

BoxDecoration _surface({double radius = 30, Color color = FinanceColors.card}) => BoxDecoration(
  color: color, borderRadius: BorderRadius.circular(radius),
  border: Border.all(color: FinanceColors.navBorder), boxShadow: _shadow,
);

String _dateLabel(BuildContext context, DateTime date) {
  final formatted = MaterialLocalizations.of(context).formatShortDate(date);
  return DateUtils.isSameDay(date, DateTime.now()) ? 'Today, $formatted' : formatted;
}

void _message(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
