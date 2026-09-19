enum FinanceTransactionType { income, expense }

class FinanceTransaction {
  const FinanceTransaction({
    required this.type,
    required this.title,
    required this.notes,
    required this.date,
    required this.isRecurring,
  });

  final FinanceTransactionType type;
  final String title;
  final String notes;
  final DateTime date;
  final bool isRecurring;
}

typedef FinanceTransactionSaver = Future<void> Function(
  FinanceTransaction transaction,
);
