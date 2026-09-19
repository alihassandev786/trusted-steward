// lib/widgets/transaction_editor.dart

import 'package:flutter/material.dart';
import 'finance_form_widgets.dart';
import 'finance_theme.dart';
import 'finance_transaction.dart';

// finance_form_widgets.dart se PledgedAmountCard class delete kar dein.
// Baqi shared widgets wahi rahenge.

class TransactionEditor extends StatefulWidget {
  const TransactionEditor({
    super.key,
    required this.type,
    required this.summaryCard,
    this.onSave,
  });

  final FinanceTransactionType type;
  final Widget summaryCard;
  final FinanceTransactionSaver? onSave;

  @override
  State<TransactionEditor> createState() => _TransactionEditorState();
}

class _TransactionEditorState extends State<TransactionEditor> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime? _date;
  bool _recurring = true;
  bool _saving = false;

  String get _label =>
      widget.type == FinanceTransactionType.income ? 'Income' : 'Expense';

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving || !_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    final transaction = FinanceTransaction(
      type: widget.type,
      title: _titleController.text.trim(),
      notes: _notesController.text.trim(),
      date: _date!,
      isRecurring: _recurring,
    );

    if (widget.onSave == null) {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop(transaction);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Connect onSave to store this transaction.'),
          ),
        );
      }
      return;
    }

    setState(() => _saving = true);

    try {
      await widget.onSave!(transaction);

      if (!mounted) return;

      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop(transaction);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transaction saved')),
        );
      }
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not save transaction. Please try again.'),
        ),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FinanceColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
                    child: FinancePageHeader(title: 'Add $_label'),
                  ),

                  // Aapka existing summary card.
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 44, 20, 42),
                    child: widget.summaryCard,
                  ),

                  Container(
                    width: double.infinity,
                    decoration: FinanceDecorations.card(radius: 68).copyWith(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(68),
                      ),
                      border: Border.all(color: FinanceColors.navBorder),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x10000000),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(
                      20,
                      52,
                      20,
                      32 + MediaQuery.of(context).padding.bottom,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 11),
                            child: Text(
                              'Add Transaction for $_label',
                              style: FinanceText.body(
                                size: 12,
                                color: FinanceColors.textDark,
                              ),
                            ),
                          ),
                          const SizedBox(height: 34),
                          FinanceInput(
                            controller: _titleController,
                            hint: '$_label Title',
                            enabled: !_saving,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter a title';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 8),
                          FinanceInput(
                            controller: _notesController,
                            hint: 'Reflective Notes',
                            notes: true,
                            enabled: !_saving,
                          ),
                          const SizedBox(height: 8),
                          TransactionTypeTile(label: _label),
                          const SizedBox(height: 8),
                          StewardshipDateField(
                            value: _date,
                            enabled: !_saving,
                            onChanged: (date) {
                              setState(() => _date = date);
                            },
                          ),
                          const SizedBox(height: 29),
                          RecurringTransactionTile(
                            value: _recurring,
                            onChanged: _saving
                                ? null
                                : (value) {
                              setState(() => _recurring = value);
                            },
                          ),
                          const SizedBox(height: 25),
                          SaveTransactionButton(
                            busy: _saving,
                            onPressed: _save,
                          ),
                        ],
                      ),
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
}