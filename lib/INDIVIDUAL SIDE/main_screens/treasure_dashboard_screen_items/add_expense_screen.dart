
import 'package:flutter/material.dart';
import '../../teasure_dasbord_widgets/finance_transaction.dart';
import '../../teasure_dasbord_widgets/transaction_editor.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({
    super.key,
    required this.summaryCard,
    this.onSave,
  });

  final Widget summaryCard;
  final FinanceTransactionSaver? onSave;

  @override
  Widget build(BuildContext context) {
    return TransactionEditor(
      type: FinanceTransactionType.expense,
      summaryCard: summaryCard,
      onSave: onSave,
    );
  }
}