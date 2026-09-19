import 'package:flutter/material.dart';
import '../../../../data/models/stewardship_models.dart';
import '../../../../data/models/stewardship_widgets.dart';
import 'add_giving_screen.dart';
import 'giving_details_screen.dart';


class GivingHubScreen extends StatefulWidget {
  const GivingHubScreen({super.key, this.onSave});
  final SaveGiving? onSave;
  @override
  State<GivingHubScreen> createState() => _GivingHubScreenState();
}

class _GivingHubScreenState extends State<GivingHubScreen> {
  // Reference sample data. Replace with repository data for production.
  final List<GivingTransaction> _added = [];
  late final List<GivingTransaction> _commitments = [
    GivingTransaction(id: 'church', title: 'Local Church Tithe', intent: 'Tithe',
      recipient: 'Community Church', date: DateTime(2026, 9, 10), amount: 450,
      notes: 'Automated monthly giving.'),
    GivingTransaction(id: 'missions', title: 'Global Missions Fund', intent: 'Missions',
      recipient: 'World Missions', date: DateTime(2026, 9, 10), amount: 120),
    GivingTransaction(id: 'food', title: 'Food Bank Alliance', intent: 'Community Support',
      recipient: 'Food Bank Alliance', date: DateTime(2026, 9, 10), amount: 1500,
      notes: 'Automated monthly support.'),
  ];

  Future<void> _add() async {
    final result = await Navigator.of(context).push<GivingTransaction>(MaterialPageRoute(
      builder: (_) => AddGivingScreen(onSave: widget.onSave)));
    if (result != null && mounted) setState(() => _added.insert(0, result));
  }
  void _details(GivingTransaction transaction) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => GivingDetailsScreen(
      transaction: transaction, onSave: widget.onSave, onChanged: (updated) {
        if (!mounted) return;
        setState(() {
          final addedIndex = _added.indexWhere((v) => v.id == updated.id);
          final commitmentIndex = _commitments.indexWhere((v) => v.id == updated.id);
          if (addedIndex >= 0) _added[addedIndex] = updated;
          if (commitmentIndex >= 0) _commitments[commitmentIndex] = updated;
        });
      },
    )));
  }

  @override
  Widget build(BuildContext context) => StewardPage(title: 'Giving Hub', headerGap: 44,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(width: double.infinity, decoration: StewardStyle.box(), clipBehavior: Clip.antiAlias,
        child: Stack(children: [
          Positioned(right: -62, bottom: -62, child: Container(width: 130, height: 120,
            decoration: const BoxDecoration(color: StewardStyle.paleGold, shape: BoxShape.circle))),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 26),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Total Giving Hub This Year', style: StewardStyle.heading(16)),
              const SizedBox(height: 12),
              Text(money(7130 + _commitments.fold<double>(0, (total, v) => total + v.amount) + _added.fold<double>(0, (total, v) => total + v.amount)),
                style: StewardStyle.text(16, bold: true, color: StewardStyle.gold)),
            ])),
        ])),
      const SizedBox(height: 23),
      Container(decoration: StewardStyle.box(color: StewardStyle.gold),
        padding: const EdgeInsets.fromLTRB(23, 29, 20, 28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(child: Text('Giving Goal', style: StewardStyle.text(14, bold: true, color: Colors.white))),
            Text('15%', style: StewardStyle.text(14, bold: true, color: Colors.white)),
            Text(' of income', style: StewardStyle.text(10, color: Colors.white)),
          ]),
          const SizedBox(height: 14),
          ClipRRect(borderRadius: BorderRadius.circular(8),
            child: const LinearProgressIndicator(value: .86, minHeight: 7,
              backgroundColor: Color(0xFF96917F), color: Colors.white,
              semanticsLabel: 'Annual giving target', semanticsValue: '86 percent')),
          const SizedBox(height: 14),
          Text('You are on track to meet your annual giving target. Well done!',
            style: StewardStyle.text(12, color: Colors.white)),
        ])),
      const SizedBox(height: 40),
      Text('Active Commitments', style: StewardStyle.heading(16)),
      const SizedBox(height: 22),
      _commitment(_commitments[0], Icons.church, 'Automated. 10% Monthly'),
      const SizedBox(height: 12),
      _commitment(_commitments[1], Icons.public, 'One time . Quarterly'),
      const SizedBox(height: 12),
      _commitment(_commitments[2], Icons.volunteer_activism, 'Automated . \$100/mo'),
      const SizedBox(height: 24),
      StewardButton(label: '+Add Giving', onPressed: _add),
      const SizedBox(height: 34),
      Text('Recent Impact', style: StewardStyle.heading(16)),
      const SizedBox(height: 24),
      Container(decoration: StewardStyle.box(), padding: const EdgeInsets.fromLTRB(20, 26, 28, 28),
        child: Column(children: [
          for (final added in _added)
            InkWell(onTap: () => _details(added), child: _impact(
              title: added.title, note: added.notes.isEmpty ? added.recipient : added.notes,
              date: MaterialLocalizations.of(context).formatShortMonthDay(added.date),
              amount: money(added.amount), checked: true)),
          _impact(title: 'Tithe Scheduled', note: 'Processed successfully to Grace church.',
            date: 'Nov 1', amount: '\$550.0', checked: true),
          _impact(title: 'Milestone Reached', note: 'You surpassed \$1,000 in giving to World Mission this year',
            date: 'Oct 12'),
          _impact(title: 'Food Bank Donation', note: 'Automated monthly support.',
            date: 'Nov 1', amount: '\$100.0', last: true),
        ])),
      const SizedBox(height: 30),
    ]),
  );

  Widget _commitment(GivingTransaction item, IconData icon, String subtitle) => Container(
    decoration: StewardStyle.box(),
    child: Material(color: Colors.transparent, child: InkWell(
      onTap: () => _details(item), borderRadius: BorderRadius.circular(30),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(children: [
          CircleAvatar(radius: 20, backgroundColor: StewardStyle.iconFill,
            child: Icon(icon, color: StewardStyle.green, size: 19)),
          const SizedBox(width: 13),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(item.title, style: StewardStyle.text(14, bold: true)), const SizedBox(height: 5),
            Text(subtitle, style: StewardStyle.text(12)),
          ])),
          const SizedBox(width: 8),
          Column(children: [Text('+${money(item.amount)}', style: StewardStyle.text(14, bold: true)),
            const SizedBox(height: 3), Text('YTD', style: StewardStyle.text(11, color: const Color(0xFF555555)))]),
        ])),
    )),
  );

  Widget _impact({required String title, required String note, required String date,
    String? amount, bool checked = false, bool last = false}) => IntrinsicHeight(
    child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(width: 20, child: Stack(alignment: Alignment.topCenter, children: [
        Positioned(top: 10, bottom: last ? 9 : 0, child: Container(width: 1, color: StewardStyle.iconFill)),
        Padding(padding: const EdgeInsets.only(top: 3),
          child: checked ? const CircleAvatar(radius: 10, backgroundColor: StewardStyle.green,
            child: Icon(Icons.check, color: Colors.white, size: 13))
          : Container(width: 14, height: 14, decoration: const BoxDecoration(color: StewardStyle.badge, shape: BoxShape.circle),
            child: Center(child: Container(width: 6, height: 6,
              decoration: const BoxDecoration(color: StewardStyle.green, shape: BoxShape.circle))))),
      ])),
      const SizedBox(width: 14),
      Expanded(child: Padding(padding: EdgeInsets.only(bottom: last ? 8 : 38),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: Text(title, style: StewardStyle.text(14, bold: true))),
            const SizedBox(width: 6), Text(date, style: StewardStyle.text(9, color: const Color(0xFF555555))),
          ]),
          const SizedBox(height: 3), Text(note, style: StewardStyle.text(10)),
          if (amount != null) ...[const SizedBox(height: 4), Text(amount, style: StewardStyle.text(14, bold: true))],
        ]))),
    ]),
  );
}
