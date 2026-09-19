import 'package:flutter/material.dart';

import '../../teasure_dasbord_widgets/finance_theme.dart';
import '../../teasure_dasbord_widgets/giving_shared_widgets.dart';
import '../../teasure_dasbord_widgets/summary_header_card.dart';

import 'add_giving_screen.dart';

class GivingDetailsScreen extends StatelessWidget {
  const GivingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FinanceScreenLayout(
      title: 'Giving Details',
      formPanel: false,
      summary: SummaryHeaderCard(
        label: 'Church Giving',
        amount: '-\$100.0',
        inlineSuffix: Text(
          'Completed. Faithful Stewardship',
          style: FinanceText.body(
            size: 12,
            color: const Color(0xFF555555),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 27,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: FinanceColors.card,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x10000000),
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: const Column(
              children: [
                GivingDetailRow(
                  label: 'Stewardship Intent',
                  value: 'Fruits',
                ),
                GivingDetailRow(
                  label: 'Recipient',
                  value: 'Community Church',
                ),
                GivingDetailRow(
                  label: 'Date',
                  value: 'Thursday, Sep 10, 2026',
                ),
                GivingDetailRow(
                  label: 'Price',
                  value: '\$100',
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Personal Notes',
            style: FinanceText.subheading(size: 16),
          ),
          const SizedBox(height: 15),
          Container(
            constraints: const BoxConstraints(minHeight: 100),
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFEDDFB4),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'Monthly pledge for local community outreach and '
                  'youth missions. Dedicated during the Sunday '
                  'gathering offering.',
              style: FinanceText.body(
                size: 12,
                color: const Color(0xFF735C00),
              ).copyWith(height: 1.5),
            ),
          ),
          const SizedBox(height: 53),
          FinanceActionButton(
            label: 'Edit Transaction',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddGivingScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}