import 'package:flutter/material.dart';
import 'package:trusted_steward/couple_and_family/presentation/coupleside/bottomnavigationsection/timesection/task_details_screen.dart';
import '../../../../../INDIVIDUAL SIDE/teasure_dasbord_widgets/finance_theme.dart';

// Requires your Popp/Pops fonts. Pass optional partner images and save callbacks.
// Reminder toggle stores a preference; notification scheduling is external.

class CoupleNewTaskScreen extends StatefulWidget {
  const CoupleNewTaskScreen({
    super.key,
    this.partnerOneName = 'Sarah',
    this.partnerTwoName = 'John',
    this.partnerOneImage = const AssetImage('assets/images/mom.png'),
    this.partnerTwoImage = const AssetImage('assets/images/home1.png'),
    this.onCreated,
    this.onCompleted,
  });

  final String partnerOneName;
  final String partnerTwoName;
  final ImageProvider? partnerOneImage;
  final ImageProvider? partnerTwoImage;
  final TaskSaveCallback? onCreated;
  final TaskSaveCallback? onCompleted;

  @override
  State<CoupleNewTaskScreen> createState() => _CoupleNewTaskScreenState();
}

class _CoupleNewTaskScreenState extends State<CoupleNewTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  int _assignee = 2;
  DateTime? _dueDate;
  String? _category;
  bool _reminder = true;
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateUtils.dateOnly(DateTime.now());
    final date = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 20, 12, 31),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: FinanceColors.darkGreen,
            primary: FinanceColors.darkGreen,
            surface: FinanceColors.background,
          ),
        ),
        child: child!,
      ),
    );
    if (date != null && mounted) setState(() => _dueDate = date);
  }

  Future<void> _create() async {
    if (!_formKey.currentState!.validate()) return;
    if (_dueDate == null || _category == null) {
      _message(context, 'Please select a due date and category.');
      return;
    }
    final task = StewardshipTask(
      name: _name.text.trim(),
      assignee: _assignee == 2
          ? 'Both'
          : _assignee == 0
          ? widget.partnerOneName
          : widget.partnerTwoName,
      category: _category!,
      dueDate: _dueDate!,
      reminderEnabled: _reminder,
    );
    setState(() => _saving = true);
    try {
      await widget.onCreated?.call(task);
      if (!mounted) return;
      await Navigator.of(context).pushReplacement<StewardshipTask, void>(
        MaterialPageRoute<StewardshipTask>(
          builder: (_) => TaskDetailScreen(
            task: task,
            assigneeImage: _assignee == 0
                ? widget.partnerOneImage
                : _assignee == 1
                ? widget.partnerTwoImage
                : null,
            onCompleted: widget.onCompleted,
          ),
        ),
      );
    } catch (_) {
      if (mounted)
        _message(context, 'Could not create task. Please try again.');
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: FinanceColors.background,
    body: SafeArea(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Column(
          children: [
            const _Header(title: 'New Task'),
            SizedBox(height: 40),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: FinanceColors.card,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(68),
                  ),
                  border: Border.all(color: FinanceColors.navBorder),
                  boxShadow: _shadow,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 28),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Create a new stewardship task to stay organized\nand purposeful.',
                            style: FinanceText.body(
                              size: 12,
                              color: FinanceColors.textDark,
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        TextFormField(
                          controller: _name,
                          enabled: !_saving,
                          textCapitalization: TextCapitalization.sentences,
                          style: FinanceText.body(
                            color: FinanceColors.textDark,
                          ),
                          decoration: _inputDecoration('Task Name'),
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                              ? 'Please enter a task name.'
                              : null,
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Assign To',
                          style: FinanceText.body(
                            size: 12,
                            color: FinanceColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < 3; i++) ...[
                              if (i > 0) const SizedBox(width: 8),
                              Expanded(
                                child: _AssigneeCard(
                                  name: i == 2
                                      ? 'Both'
                                      : i == 0
                                      ? widget.partnerOneName
                                      : widget.partnerTwoName,
                                  subtitle: i == 2 ? 'Together' : 'Partner',
                                  image: i == 0
                                      ? widget.partnerOneImage
                                      : i == 1
                                      ? widget.partnerTwoImage
                                      : null,
                                  group: i == 2,
                                  selected: _assignee == i,
                                  onTap: _saving
                                      ? null
                                      : () => setState(() => _assignee = i),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 28),
                        Material(
                          color: FinanceColors.tileFill,
                          borderRadius: BorderRadius.circular(28),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(28),
                            onTap: _saving ? null : _pickDate,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 14,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _dueDate == null
                                          ? 'Due Date'
                                          : _dateLabel(context, _dueDate!),
                                      style: FinanceText.body(
                                        size: 11,
                                        color: _dueDate == null
                                            ? FinanceColors.textMuted
                                            : FinanceColors.textDark,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 16,
                                    color: FinanceColors.darkGreen,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: _category,
                          isExpanded: true,
                          decoration: _inputDecoration('Select Category'),
                          dropdownColor: FinanceColors.card,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: FinanceColors.darkGreen,
                          ),
                          style: FinanceText.body(
                            size: 12,
                            color: FinanceColors.textDark,
                          ),
                          items:
                              const [
                                    'Household',
                                    'Finance',
                                    'Health',
                                    'Family',
                                    'Other',
                                  ]
                                  .map(
                                    (v) => DropdownMenuItem(
                                      value: v,
                                      child: Text(v),
                                    ),
                                  )
                                  .toList(),
                          onChanged: _saving
                              ? null
                              : (v) => setState(() => _category = v),
                        ),
                        const SizedBox(height: 27),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 14,
                          ),
                          decoration: _surface(),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: FinanceColors.darkGreen
                                    .withOpacity(0.3),
                                child: Icon(
                                  Icons.notifications,
                                  size: 19,
                                  color: FinanceColors.darkGreen,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  'Reminder',
                                  style: FinanceText.subheading(size: 14),
                                ),
                              ),
                              Transform.scale(
                                scale: 0.75,
                                child: Switch.adaptive(
                                  value: _reminder,
                                  activeColor: FinanceColors.darkGreen,
                                  onChanged: _saving
                                      ? null
                                      : (v) => setState(() => _reminder = v),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 35),
                        _ActionButton(
                          label: 'Create Task',
                          busy: _saving,
                          onPressed: _create,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
    child: Row(
      children: [
        SizedBox(
          width: 45,
          height: 45,
          child: Material(
            color: FinanceColors.darkGreen,
            shape: const CircleBorder(),
            child: IconButton(
              tooltip: 'Back',
              onPressed: () => Navigator.of(context).maybePop(result),
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(child: Text(title, style: FinanceText.heading(size: 21))),
      ],
    ),
  );
}

class _AssigneeCard extends StatelessWidget {
  const _AssigneeCard({
    required this.name,
    required this.subtitle,
    required this.group,
    required this.selected,
    this.image,
    this.onTap,
  });

  final String name;
  final String subtitle;
  final bool group;
  final bool selected;
  final ImageProvider? image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    selected: selected,
    button: true,
    child: Container(
      decoration: _surface(
        radius: 20,
        color: selected ? FinanceColors.darkGreen : FinanceColors.card,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 14),
            child: Column(
              children: [
                _Avatar(name: name, image: image, group: group, radius: 24),
                const SizedBox(height: 9),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: FinanceText.subheading(
                    size: 12,
                    weight: FontWeight.w500,
                    color: selected ? Colors.white : FinanceColors.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: FinanceText.body(
                    size: 10,
                    color: selected ? Colors.white70 : FinanceColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.name,
    required this.radius,
    this.image,
    this.group = false,
  });

  final String name;
  final double radius;
  final ImageProvider? image;
  final bool group;

  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: radius,
    backgroundColor: FinanceColors.iconBg.withOpacity(0.4),
    foregroundImage: image,
    onForegroundImageError: image == null ? null : (_, __) {},
    child: group
        ? Icon(
            Icons.groups_outlined,
            color: FinanceColors.darkGreen,
            size: radius,
          )
        : Text(
            name.trim().isEmpty
                ? '?'
                : name.trim().substring(0, 1).toUpperCase(),
            style: FinanceText.subheading(
              size: radius * 0.7,
              color: FinanceColors.darkGreen,
            ),
          ),
  );
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.onPressed,
    this.busy = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool busy;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: busy ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: FinanceColors.darkGreen,
        foregroundColor: Colors.white,
        disabledBackgroundColor: FinanceColors.darkGreen.withOpacity(0.65),
        disabledForegroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size.fromHeight(46),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: const StadiumBorder(),
        textStyle: FinanceText.subheading(size: 14, weight: FontWeight.w500),
      ),
      child: busy
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(label),
    ),
  );
}

const _shadow = [
  BoxShadow(color: Color(0x16000000), blurRadius: 3, spreadRadius: 0.5),
];

BoxDecoration _surface({
  double radius = 30,
  Color color = FinanceColors.card,
}) => BoxDecoration(
  color: color,
  borderRadius: BorderRadius.circular(radius),
  border: Border.all(color: FinanceColors.navBorder),
  boxShadow: _shadow,
);

InputDecoration _inputDecoration(String hint) => InputDecoration(
  hintText: hint,
  hintStyle: FinanceText.body(size: 11),
  filled: true,
  fillColor: FinanceColors.tileFill,
  contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
  isDense: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: FinanceColors.darkGreen),
  ),
);

String _dateLabel(BuildContext context, DateTime date) {
  final formatted = MaterialLocalizations.of(context).formatShortDate(date);
  return DateUtils.isSameDay(date, DateTime.now())
      ? 'Today, $formatted'
      : formatted;
}

void _message(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
