import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/treasure_dashboard_screen_items/add_giving_screen.dart';
import '../../teasure_dasbord_widgets/app_progress_bar.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import '../../teasure_dasbord_widgets/summary_header_card.dart';
import 'finance_screen_parts.dart';

class GivingScreen extends StatelessWidget {
  const GivingScreen({super.key, this.onManage, this.onMakeGenerosity});

  final VoidCallback? onManage, onMakeGenerosity;

  @override
  Widget build(BuildContext context) => FinancePage(
    title: 'Giving Hub',
    children: [
      const SummaryHeaderCard(
        label: 'Total Giving Hub This Year',
        amount: r'$9,200',
      ),
      const SizedBox(height: 22),
      SoftFinanceCard(
        color: screenGold,
        padding: const EdgeInsets.fromLTRB(22, 28, 22, 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Giving Goal',
                    style: FinanceText.subheading(
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '15%',
                  style: FinanceText.subheading(size: 14, color: Colors.white),
                ),
                Text(
                  ' of income',
                  style: FinanceText.body(size: 10, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const AppProgressBar(
              value: 0.86,
              height: 7,
              activeColor: Colors.white,
            ),
            const SizedBox(height: 14),
            Text(
              'You are on track to meet your annual giving target. Well done!',
              style: FinanceText.body(
                size: 12,
                color: Colors.white,
              ).copyWith(height: 1.35),
            ),
          ],
        ),
      ),
      const SizedBox(height: 30),
      FinanceSection(
        title: 'Active Commitments',
        action: 'Manage',
        onTap: onManage,
      ),
      const SizedBox(height: 12),
      const GivingCommitmentTile(
        icon: Icons.church,
        title: 'Local Church Tithe',
        subtitle: 'Automated. 10% Monthly',
        amount: r'+$450',
      ),
      const SizedBox(height: 12),
      const GivingCommitmentTile(
        icon: Icons.public,
        title: 'Global Missions Fund',
        subtitle: 'One time . Quarterly',
        amount: r'+$120',
      ),
      const SizedBox(height: 12),
      const GivingCommitmentTile(
        icon: Icons.volunteer_activism,
        title: 'Food Bank Alliance',
        subtitle: r'Automated . $100/mo',
        amount: r'+$1,500',
      ),
      const SizedBox(height: 24),
      FinanceAction(label: '+ Add Giving', onPressed: (){Get.to(()=>AddGivingScreen());}),
      const SizedBox(height: 34),
      const FinanceSection(title: 'Recent Impact'),
      const SizedBox(height: 22),
      const SoftFinanceCard(
        padding: EdgeInsets.fromLTRB(20, 28, 28, 30),
        child: Column(
          children: [
            ImpactEntry(
              title: 'Tithe Scheduled',
              date: 'Nov 1',
              description: 'Processed successfully to Grace church.',
              amount: r'$550.0',
              checked: true,
            ),
            ImpactEntry(
              title: 'Milestone Reached',
              date: 'Oct 12',
              description:
                  r'You surpassed $1,000 in giving to World Missions this year',
            ),
            ImpactEntry(
              title: 'Food Bank Donation',
              date: 'Nov 1',
              description: 'Automated monthly support.',
              amount: r'$100.0',
              last: true,
            ),
          ],
        ),
      ),
    ],
  );
}

class GivingCommitmentTile extends StatelessWidget {
  const GivingCommitmentTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  final IconData icon;
  final String title, subtitle, amount;

  @override
  Widget build(BuildContext context) => SoftFinanceCard(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
    child: Row(
      children: [
        FinanceIcon(icon: icon),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: FinanceText.subheading(size: 14)),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: FinanceText.body(
                  size: 12,
                  color: FinanceColors.textDark,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Column(
          children: [
            Text(amount, style: FinanceText.subheading(size: 14)),
            Text(
              'YTD',
              style: FinanceText.body(size: 11, color: Colors.black54),
            ),
          ],
        ),
      ],
    ),
  );
}

class ImpactEntry extends StatelessWidget {
  const ImpactEntry({
    super.key,
    required this.title,
    required this.date,
    required this.description,
    this.amount,
    this.checked = false,
    this.last = false,
  });

  final String title, date, description;
  final String? amount;
  final bool checked, last;

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 20,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                bottom: 0,
                left: 9,
                child: Container(width: 2, color: const Color(0xFFCDDDC5)),
              ),
              Positioned(
                top: 2,
                left: checked ? 0 : 3,
                child: Container(
                  width: checked ? 20 : 14,
                  height: checked ? 20 : 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: checked ? screenGreen : const Color(0xFFA8BFA1),
                  ),
                  child: checked
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : Center(
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: screenGreen,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: last ? 0 : 38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: FinanceText.subheading(size: 14),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        date,
                        style: FinanceText.body(size: 9, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: FinanceText.body(
                    size: 10,
                    color: FinanceColors.textDark,
                  ),
                ),
                if (amount != null) ...[
                  const SizedBox(height: 3),
                  Text(amount!, style: FinanceText.subheading(size: 14)),
                ],
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
