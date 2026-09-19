import 'package:flutter/material.dart';
import '../../../../data/models/stewardship_models.dart';
import '../../../../data/models/stewardship_widgets.dart';
import 'edit_giving_screen.dart';


class GivingDetailsScreen extends StatefulWidget {
  const GivingDetailsScreen({super.key, this.transaction, this.onSave, this.onChanged,
    this.firstImage = StewardAssets.first, this.secondImage = StewardAssets.second});
  final GivingTransaction? transaction;
  final SaveGiving? onSave;
  final ValueChanged<GivingTransaction>? onChanged;
  final ImageProvider firstImage;
  final ImageProvider secondImage;
  @override
  State<GivingDetailsScreen> createState() => _GivingDetailsScreenState();
}
class _GivingDetailsScreenState extends State<GivingDetailsScreen> {
  late GivingTransaction _transaction;
  @override
  void initState() { super.initState(); _transaction = widget.transaction ?? GivingTransaction.example(); }
  Future<void> _edit() async {
    final result = await Navigator.of(context).push<GivingTransaction>(MaterialPageRoute(
      builder: (_) => EditGivingScreen(transaction: _transaction, onSave: widget.onSave,
        firstImage: widget.firstImage, secondImage: widget.secondImage)));
    if (result != null && mounted) {
      setState(() => _transaction = result);
      widget.onChanged?.call(result);
    }
  }
  @override
  Widget build(BuildContext context) => StewardPage(title: 'Giving Details', headerGap: 44,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(decoration: StewardStyle.box(), clipBehavior: Clip.antiAlias,
        child: Stack(children: [
          Positioned(right: -59, top: -59, child: Container(width: 118, height: 128,
            decoration: const BoxDecoration(color: StewardStyle.paleGold, shape: BoxShape.circle))),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 27),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(_transaction.title, style: StewardStyle.heading(16)),
              const SizedBox(height: 10),
              Wrap(spacing: 16, runSpacing: 6, crossAxisAlignment: WrapCrossAlignment.center, children: [
                Text('-\$${_transaction.amount.toStringAsFixed(1)}',
                  style: StewardStyle.text(16, bold: true, color: StewardStyle.gold)),
                Text('Completed. Faithful Stewardship', style: StewardStyle.text(12, color: const Color(0xFF555555))),
              ]),
            ])),
        ])),
      const SizedBox(height: 26),
      Container(decoration: StewardStyle.box(), padding: const EdgeInsets.fromLTRB(28, 29, 28, 37),
        child: Column(children: [
          _row('Stewardship Intent', _transaction.intent), const SizedBox(height: 30),
          _row('Recipient', _transaction.recipient), const SizedBox(height: 30),
          _row('Date', MaterialLocalizations.of(context).formatFullDate(_transaction.date)),
          const SizedBox(height: 30), _row('Price', money(_transaction.amount)),
        ])),
      const SizedBox(height: 14),
      AssignedCard(assignedTo: _transaction.assignedTo,
        firstImage: widget.firstImage, secondImage: widget.secondImage),
      const SizedBox(height: 15),
      Text('Personal Notes', style: StewardStyle.heading(16)),
      const SizedBox(height: 16),
      Container(width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
            colors: [StewardStyle.paleGold, Color(0xFFDCD7AE)])),
        child: Text(_transaction.notes.isEmpty ? 'No personal notes.' : _transaction.notes,
          style: StewardStyle.text(11, color: const Color(0xFF806300))),
      ),
      const SizedBox(height: 27),
      StewardButton(label: 'Edit Transaction', onPressed: _edit),
    ]),
  );
  Widget _row(String label, String value) => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Expanded(flex: 4, child: Text(label, style: StewardStyle.text(14, bold: true))),
    const SizedBox(width: 12),
    Expanded(flex: 5, child: Text(value, textAlign: TextAlign.right,
      style: StewardStyle.text(12, color: const Color(0xFF555555)))),
  ]);
}
