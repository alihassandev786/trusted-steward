import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../data/models/stewardship_models.dart';
import '../../../../data/models/stewardship_widgets.dart';
import 'goal_details_screen.dart';


class CreateGoalScreen extends StatefulWidget {
  const CreateGoalScreen({super.key, this.onCreate, this.onComplete,
    this.firstImage = StewardAssets.first, this.secondImage = StewardAssets.second});
  final SaveGoal? onCreate;
  final SaveGoal? onComplete;
  final ImageProvider firstImage;
  final ImageProvider secondImage;
  @override
  State<CreateGoalScreen> createState() => _CreateGoalScreenState();
}
class _CreateGoalScreenState extends State<CreateGoalScreen> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  AssignedTo _assigned = AssignedTo.both;
  ImageProvider? _cover;
  String? _category;
  String? _target;
  String? _learn;
  DateTime? _date;
  bool _busy = false;
  bool _picking = false;
  @override
  void dispose() { _title.dispose(); super.dispose(); }

  Future<void> _pickCover() async {
    setState(() => _picking = true);
    try {
      final file = await ImagePicker().pickImage(source: ImageSource.gallery,
        maxWidth: 1600, maxHeight: 1600, imageQuality: 85);
      if (file == null) return;
      final bytes = await file.readAsBytes();
      if (mounted) setState(() => _cover = MemoryImage(bytes));
    } catch (_) {
      if (mounted) stewardMessage(context, 'Could not open the photo library. Check permissions and try again.');
    } finally { if (mounted) setState(() => _picking = false); }
  }
  Future<void> _pickDate() async {
    final today = DateUtils.dateOnly(DateTime.now());
    final picked = await showDatePicker(context: context,
      initialDate: _date ?? today, firstDate: today, lastDate: DateTime(today.year + 20));
    if (picked != null && mounted) setState(() => _date = picked);
  }
  Future<void> _create() async {
    if (!_form.currentState!.validate()) return;
    if (_date == null) { stewardMessage(context, 'Please select a target date.'); return; }
    if (_cover == null) { stewardMessage(context, 'Please upload a cover image.'); return; }
    final goal = SharedGoal(title: _title.text.trim(), category: _category!,
      dueDate: _date!, target: int.parse(_target!.split(' ').first),
      assignedTo: _assigned, coverImage: _cover, learnGoal: _learn!);
    setState(() => _busy = true);
    try {
      await widget.onCreate?.call(goal);
      if (!mounted) return;
      Navigator.of(context).pushReplacement<SharedGoal, void>(MaterialPageRoute<SharedGoal>(
        builder: (_) => GoalDetailsScreen(goal: goal, onComplete: widget.onComplete,
          firstImage: widget.firstImage, secondImage: widget.secondImage)));
    } catch (_) {
      if (mounted) stewardMessage(context, 'Could not create goal. Please try again.');
    } finally { if (mounted) setState(() => _busy = false); }
  }

  @override
  Widget build(BuildContext context) => StewardPage(title: 'New Goal', form: true, headerGap: 30,
    child: Form(key: _form, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(left: 6),
        child: Text('Create your new goal!', style: StewardStyle.text(12))),
      const SizedBox(height: 16),
      CustomPaint(painter: _DottedBorder(),
        child: ClipRRect(borderRadius: BorderRadius.circular(30),
          child: Material(color: Colors.transparent,
            child: InkWell(onTap: _busy || _picking ? null : _pickCover,
              child: SizedBox(height: 122, width: double.infinity,
                child: _cover == null ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(radius: 23, backgroundColor: StewardStyle.green,
                    child: _picking ? const SizedBox(width: 20, height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : const Icon(Icons.camera_alt, size: 23, color: Colors.white)),
                  const SizedBox(height: 15),
                  Text('Upload Cover Image', style: StewardStyle.text(12)),
                ]) : Stack(fit: StackFit.expand, children: [
                  Image(image: _cover!, fit: BoxFit.cover),
                  Positioned(right: 10, bottom: 10, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: StewardStyle.green, borderRadius: BorderRadius.circular(16)),
                    child: Text('Change Image', style: StewardStyle.text(11, color: Colors.white)))),
                ]),
              ),
            )),
        )),
      const SizedBox(height: 18),
      AssignSelector(value: _assigned, firstImage: widget.firstImage, secondImage: widget.secondImage,
        onChanged: _busy ? null : (value) => setState(() => _assigned = value)),
      const SizedBox(height: 25),
      TextFormField(controller: _title, enabled: !_busy,
        style: StewardStyle.text(12), textCapitalization: TextCapitalization.sentences,
        decoration: stewardInput('Goal Title', suffix: PopupMenuButton<String>(
          enabled: !_busy, tooltip: 'Suggested titles',
          icon: const Icon(Icons.keyboard_arrow_down, color: StewardStyle.green, size: 22),
          onSelected: (value) => _title.text = value,
          itemBuilder: (_) => const ['Biblical Stewardship 101', 'Emergency Fund', 'New Family Home']
            .map((v) => PopupMenuItem(value: v, child: Text(v))).toList())),
        validator: (value) => value == null || value.trim().isEmpty ? 'Please enter a goal title.' : null),
      const SizedBox(height: 8),
      StewardDropdown(hint: 'Goal Category', items: const ['Faith', 'Finance', 'Family', 'Health'], value: _category,
        onChanged: _busy ? null : (v) => setState(() => _category = v)),
      const SizedBox(height: 8),
      StewardDropdown(hint: 'Target Measurable Outcome', items: const ['5 Sessions', '10 Sessions', '20 Sessions', '30 Sessions'],
        value: _target, onChanged: _busy ? null : (v) => setState(() => _target = v)),
      const SizedBox(height: 8),
      StewardDateField(hint: 'Target Horizon Date', value: _date, onTap: _busy ? null : _pickDate),
      const SizedBox(height: 8),
      StewardDropdown(hint: 'Select goal from learn',
        items: const ['Biblical Stewardship 101', 'The Gift of Talents', 'Family Stewardship'], value: _learn,
        onChanged: _busy ? null : (v) => setState(() => _learn = v)),
      const SizedBox(height: 26),
      StewardButton(label: 'Create Shared Goal', busy: _busy, onPressed: _picking ? null : _create),
    ])),
  );
}

class _DottedBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()..addRRect(RRect.fromRectAndRadius(
      Offset.zero & size, const Radius.circular(30)));
    final paint = Paint()..color = StewardStyle.green..style = PaintingStyle.stroke..strokeWidth = 1;
    for (final metric in path.computeMetrics()) {
      for (double distance = 0; distance < metric.length; distance += 4) {
        canvas.drawPath(metric.extractPath(distance, (distance + 1.7).clamp(0.0, metric.length).toDouble()), paint);
      }
    }
  }
  @override
  bool shouldRepaint(covariant _DottedBorder oldDelegate) => false;
}
