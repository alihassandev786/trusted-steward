import 'package:flutter/material.dart';
import 'stewardship_models.dart';
import 'stewardship_widgets.dart';

// Shared form used by the separate AddGivingScreen and EditGivingScreen files.
class GivingForm extends StatefulWidget {
  const GivingForm({super.key, this.initial, this.onSave,
    this.firstImage = StewardAssets.first, this.secondImage = StewardAssets.second});
  final GivingTransaction? initial;
  final SaveGiving? onSave;
  final ImageProvider firstImage;
  final ImageProvider secondImage;
  @override
  State<GivingForm> createState() => _GivingFormState();
}

class _GivingFormState extends State<GivingForm> {
  final _form = GlobalKey<FormState>();
  late final TextEditingController _notes;
  String? _intent;
  String? _recipient;
  DateTime? _date;
  double? _amount;
  AssignedTo _assigned = AssignedTo.both;
  bool _busy = false;
  bool get _editing => widget.initial != null;

  @override
  void initState() {
    super.initState();
    final value = widget.initial;
    _notes = TextEditingController(text: value?.notes ?? '');
    _intent = value?.intent; _recipient = value?.recipient;
    _date = value?.date; _amount = value?.amount;
    _assigned = value?.assignedTo ?? AssignedTo.both;
  }
  @override
  void dispose() { _notes.dispose(); super.dispose(); }

  Future<void> _chooseDate() async {
    final picked = await showDatePicker(context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(1900), lastDate: DateTime(2200));
    if (picked != null && mounted) setState(() => _date = picked);
  }

  Future<void> _chooseAmount() async {
    final picked = await showDialog<double>(context: context,
      builder: (_) => _AmountDialog(initial: _amount));
    if (picked != null && mounted) setState(() => _amount = picked);
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    if (_date == null || _amount == null) {
      stewardMessage(context, 'Please select a date and giving amount.'); return;
    }
    setState(() => _busy = true);
    final value = GivingTransaction(
      id: widget.initial?.id ?? DateTime.now().microsecondsSinceEpoch.toString(),
      title: widget.initial?.title ?? (_recipient == 'Community Church' ? 'Church Giving' : _recipient!),
      intent: _intent!, recipient: _recipient!, date: _date!, amount: _amount!,
      notes: _notes.text.trim(), assignedTo: _assigned,
    );
    try {
      await widget.onSave?.call(value);
      if (!mounted) return;
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop(value);
      } else {
        stewardMessage(context, _editing ? 'Changes saved.' : 'Transaction saved.');
      }
    } catch (_) {
      if (mounted) stewardMessage(context, 'Could not save. Please try again.');
    } finally { if (mounted) setState(() => _busy = false); }
  }

  @override
  Widget build(BuildContext context) => StewardPage(
    title: _editing ? 'Edit Giving' : 'Add Giving', form: true,
    child: Form(key: _form, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(left: 17),
        child: Text('${_editing ? 'Edit' : 'Add'} Transaction for Giving', style: StewardStyle.text(12))),
      const SizedBox(height: 35),
      StewardDropdown(hint: 'Stewardship Intent', value: _intent,
        items: const ['Fruits', 'Tithe', 'Offering', 'Missions', 'Community Support'],
        onChanged: _busy ? null : (v) => setState(() => _intent = v)),
      const SizedBox(height: 7),
      TextFormField(controller: _notes, enabled: !_busy, minLines: 4, maxLines: 4,
        textCapitalization: TextCapitalization.sentences,
        style: StewardStyle.text(12), decoration: stewardInput('Reflective Notes')),
      const SizedBox(height: 16),
      AssignSelector(value: _assigned,
        firstImage: widget.firstImage, secondImage: widget.secondImage,
        onChanged: _busy ? null : (v) => setState(() => _assigned = v)),
      const SizedBox(height: 25),
      StewardDropdown(hint: 'Recipient', value: _recipient,
        items: const ['Community Church', 'World Missions', 'Food Bank Alliance'],
        onChanged: _busy ? null : (v) => setState(() => _recipient = v)),
      const SizedBox(height: 8),
      StewardDateField(hint: 'Date of Stewardship', value: _date, onTap: _busy ? null : _chooseDate),
      const SizedBox(height: 8),
      Material(color: StewardStyle.field, borderRadius: BorderRadius.circular(28),
        child: InkWell(onTap: _busy ? null : _chooseAmount, borderRadius: BorderRadius.circular(28),
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
            child: Row(children: [
              Expanded(child: Text(_amount == null ? 'Price for Giving' : money(_amount!),
                style: StewardStyle.text(11, color: _amount == null ? StewardStyle.muted : StewardStyle.ink))),
              const Icon(Icons.keyboard_arrow_down, color: StewardStyle.green, size: 22),
            ])))),
      const SizedBox(height: 39),
      StewardButton(label: _editing ? 'Save Changes' : 'Save Transaction', busy: _busy, onPressed: _save),
    ])),
  );
}

class _AmountDialog extends StatefulWidget {
  const _AmountDialog({this.initial});
  final double? initial;
  @override
  State<_AmountDialog> createState() => _AmountDialogState();
}
class _AmountDialogState extends State<_AmountDialog> {
  late final TextEditingController _input;
  final _form = GlobalKey<FormState>();
  @override
  void initState() { super.initState(); _input = TextEditingController(text: widget.initial?.toStringAsFixed(2) ?? ''); }
  @override
  void dispose() { _input.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => AlertDialog(
    backgroundColor: StewardStyle.card,
    title: Text('Price for Giving', style: StewardStyle.heading(18)),
    content: Form(key: _form, child: TextFormField(
      controller: _input, autofocus: true,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: stewardInput('Amount in dollars'),
      validator: (v) {
        final amount = double.tryParse((v ?? '').trim());
        return amount == null || !amount.isFinite || amount <= 0 ? 'Enter a positive amount.' : null;
      },
    )),
    actions: [
      TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
      TextButton(onPressed: () {
        if (_form.currentState!.validate()) Navigator.of(context).pop(double.parse(_input.text.trim()));
      }, child: const Text('Done')),
    ],
  );
}
