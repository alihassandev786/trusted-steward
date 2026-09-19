// lib/screens/add_income_screen.dart

import 'package:flutter/material.dart';
import '../../teasure_dasbord_widgets/finance_transaction.dart';
import '../../teasure_dasbord_widgets/transaction_editor.dart';


class AddIncomeScreen extends StatelessWidget {
  const AddIncomeScreen({
    super.key,
    required this.summaryCard,
    this.onSave,
  });

  final Widget summaryCard;
  final FinanceTransactionSaver? onSave;

  @override
  Widget build(BuildContext context) {
    return TransactionEditor(
      type: FinanceTransactionType.income,
      summaryCard: summaryCard,
      onSave: onSave,
    );
  }
}