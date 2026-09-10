import 'package:flutter/material.dart';
import '../../teasure_dasbord_widgets/provision_card.dart';
import '../../teasure_dasbord_widgets/report_matric_card.dart';
import '../../teasure_dasbord_widgets/scripture_card.dart';
import '../../teasure_dasbord_widgets/sending_rythm_card.dart';
import 'finance_screen_parts.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({
    super.key,
    this.onChartOptions,
    this.onViewLedger,
  });

  final VoidCallback? onChartOptions;
  final VoidCallback? onViewLedger;

  @override
  Widget build(BuildContext context) {
    return FinancePage(
      title: 'Report Activity',
      children: [
        SpendingRhythmCard(
          onOptions: onChartOptions,
        ),
        const SizedBox(height: 24),

        const ProvisionSummaryCard(
          provision: r'$5,800',
          stewardship: r'$4,250',
          progress: 4250 / 5800,
          allocatedLabel: '73% Allocated',
          remainingLabel: r'$1,550 remaining',
        ),
        const SizedBox(height: 28),

        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ReportMetricCard(
                icon: Icons.favorite,
                title: 'GENEROSITY',
                amount: r'$600',
                subtitle: '10% goal met',
                golden: true,
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: ReportMetricCard(
                icon: Icons.eco_outlined,
                title: 'RESERVES',
                amount: r'$450',
                subtitle: '+5% vs Last mo',
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        const ScriptureCard(
          quote: '“For where your treasure is, there your '
              'heart will be also.”',
          reference: 'MATTHEW 6:21',
        ),
        const SizedBox(height: 48),

        FinanceAction(
          label: 'View Detailed Ledger',
          onPressed: onViewLedger,
        ),
      ],
    );
  }
}