import 'package:flutter/material.dart';

import '../../teasure_dasbord_widgets/finance_form_widgets.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import '../../teasure_dasbord_widgets/giving_models.dart';
import '../../teasure_dasbord_widgets/giving_shared_widgets.dart';
import '../../teasure_dasbord_widgets/summary_header_card.dart';


class NewSavingsGoalScreen extends StatefulWidget {
  const NewSavingsGoalScreen({super.key});

  @override
  State<NewSavingsGoalScreen> createState() =>
      _NewSavingsGoalScreenState();
}

class _NewSavingsGoalScreenState extends State<NewSavingsGoalScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  double? _targetAmount;
  double? _currentAmount;
  DateTime? _targetDate;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _createGoal() {
    if (!_formKey.currentState!.validate()) return;

    final goal = SavingsGoal(
      title: _titleController.text.trim(),
      targetAmount: _targetAmount!,
      currentAmount: _currentAmount!,
      targetDate: _targetDate!,
    );

    Navigator.of(context).pop(goal);
  }

  @override
  Widget build(BuildContext context) {
    return FinanceScreenLayout(
      title: 'New Savings Goal',
      panelGap: 34,
      summary: SummaryHeaderCard(
        label: 'Allocated Gauge',
        amount: '\$2,500',
        inlineSuffix: Padding(
          padding: const EdgeInsets.only(left: 26),
          child: Text(
            '\$5,000',
            style: FinanceText.subheading(
              size: 17,
              color: FinanceColors.gold,
            ),
          ),
        ),
        belowContent: Row(
          children: [
            SizedBox(
              width: 88,
              child: Text(
                'Current',
                style: FinanceText.body(size: 10),
              ),
            ),
            Text('Target', style: FinanceText.body(size: 10)),
          ],
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
                'Add Transaction for Savings Goals',
                style: FinanceText.body(
                  size: 12,
                  color: FinanceColors.textDark,
                ),
              ),
            ),
            const SizedBox(height: 34),
            FinanceInput(
              controller: _titleController,
              hint: 'Goal Title',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a goal title';
                }
                return null;
              },
            ),
            const SizedBox(height: 7),
            FinanceChoiceField<double>(
              hint: 'Target Stewardship Amount',
              value: _targetAmount,
              items: const [500, 1000, 2500, 5000, 10000, 20000],
              labelBuilder: (value) =>
              '\$${value.toStringAsFixed(0)}',
              onChanged: (value) {
                setState(() => _targetAmount = value);
              },
            ),
            const SizedBox(height: 7),
            FinanceChoiceField<double>(
              hint: 'Current Amount Saved',
              value: _currentAmount,
              items: const [0, 100, 250, 500, 1000, 2500, 5000],
              labelBuilder: (value) =>
              '\$${value.toStringAsFixed(0)}',
              onChanged: (value) {
                setState(() => _currentAmount = value);
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select the current amount';
                }
                if (_targetAmount != null && value > _targetAmount!) {
                  return 'Current amount must not exceed the target';
                }
                return null;
              },
            ),
            const SizedBox(height: 7),
            SavingsTargetDateField(
              value: _targetDate,
              onChanged: (value) {
                setState(() => _targetDate = value);
              },
            ),
            const SizedBox(height: 46),
            FinanceActionButton(
              label: 'Create Goal',
              onPressed: _createGoal,
            ),
            const SizedBox(height: 76),
          ],
        ),
      ),
    );
  }
}