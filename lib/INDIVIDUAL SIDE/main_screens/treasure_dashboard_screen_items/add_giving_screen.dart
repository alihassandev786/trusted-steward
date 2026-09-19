import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../teasure_dasbord_widgets/finance_form_widgets.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import '../../teasure_dasbord_widgets/giving_models.dart';
import '../../teasure_dasbord_widgets/giving_shared_widgets.dart';
import '../../teasure_dasbord_widgets/summary_header_card.dart';
import 'giving_details_screen.dart';


class AddGivingScreen extends StatefulWidget {
  const AddGivingScreen({
    super.key,
    this.initialEntry,
    this.pledgedAmount = 120,
    this.intents = const ['Fruits', 'Tithe', 'Offering', 'Charity'],
    this.recipients = const [
      'Community Church',
      'Local Community',
      'Youth Ministry',
    ],
    this.amounts = const [10, 25, 50, 100, 120, 250, 500],
  });

  final GivingEntry? initialEntry;
  final double pledgedAmount;
  final List<String> intents;
  final List<String> recipients;
  final List<double> amounts;

  @override
  State<AddGivingScreen> createState() => _AddGivingScreenState();
}

class _AddGivingScreenState extends State<AddGivingScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _notesController;

  String? _intent;
  String? _recipient;
  double? _amount;
  DateTime? _date;
  bool _recurring = true;

  @override
  void initState() {
    super.initState();
    final entry = widget.initialEntry;
    _notesController = TextEditingController(text: entry?.notes ?? '');
    _intent = entry?.intent;
    _recipient = entry?.recipient;
    _amount = entry?.amount;
    _date = entry?.date;
    _recurring = entry?.recurring ?? true;
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    final intentOptions = <String>{
      ...widget.intents,
      if (_intent != null) _intent!,
    }.toList();

    final recipientOptions = <String>{
      ...widget.recipients,
      if (_recipient != null) _recipient!,
    }.toList();

    final amountOptions = <double>{
      ...widget.amounts,
      if (_amount != null) _amount!,
    }.toList()..sort();

    return FinanceScreenLayout(
      title: widget.initialEntry == null ? 'Add Giving' : 'Edit Giving',
      summary: SummaryHeaderCard(
        label: 'Pledged Amount',
        amount: '\$${widget.pledgedAmount.toStringAsFixed(2)}',
        inlineSuffix: Text(
          'Balance and ready to allocate',
          style: FinanceText.body(
            size: 12,
            color: const Color(0xFF555555),
          ),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Text(
                'Add Transaction for Giving',
                style: FinanceText.body(
                  size: 12,
                  color: FinanceColors.textDark,
                ),
              ),
            ),
            const SizedBox(height: 34),
            FinanceChoiceField<String>(
              hint: 'Stewardship Intent',
              value: _intent,
              items: intentOptions,
              labelBuilder: (value) => value,
              onChanged: (value) => setState(() => _intent = value),
            ),
            const SizedBox(height: 7),
            FinanceInput(
              controller: _notesController,
              hint: 'Reflective Notes',
              notes: true,
            ),
            const SizedBox(height: 8),
            FinanceChoiceField<String>(
              hint: 'Recipient',
              value: _recipient,
              items: recipientOptions,
              labelBuilder: (value) => value,
              onChanged: (value) => setState(() => _recipient = value),
            ),
            const SizedBox(height: 8),
            StewardshipDateField(
              value: _date,
              onChanged: (value) => setState(() => _date = value),
            ),
            const SizedBox(height: 8),
            FinanceChoiceField<double>(
              hint: 'Price for Giving',
              value: _amount,
              items: amountOptions,
              labelBuilder: (value) => '\$${value.toStringAsFixed(2)}',
              onChanged: (value) => setState(() => _amount = value),
              validator: (value) {
                return value == null || value <= 0
                    ? 'Please select a positive amount'
                    : null;
              },
            ),
            const SizedBox(height: 32),
            RecurringTransactionTile(
              value: _recurring,
              onChanged: (value) => setState(() => _recurring = value),
            ),
            const SizedBox(height: 24),
            SaveTransactionButton(
              busy: false,
              onPressed:(){Get.to(()=>GivingDetailsScreen());},
            ),
          ],
        ),
      ),
    );
  }
}