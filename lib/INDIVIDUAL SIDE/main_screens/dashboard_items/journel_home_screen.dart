import 'package:flutter/material.dart';

import '../../dashboard widgets/journel_wedgits.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import 'new_entry_screen.dart';
import 'entry_details_screen.dart';

class JournalHomeScreen extends StatefulWidget {
  const JournalHomeScreen({super.key});

  @override
  State<JournalHomeScreen> createState() => _JournalHomeScreenState();
}

class _JournalHomeScreenState extends State<JournalHomeScreen> {
  String _search = '';

  final _entries = [
    {
      'category': 'Stewardship Reflection',
      'date': 'Oct 12, 2026',
      'title': 'Morning Quiet & Stewardship of Rest',
    },
    {
      'category': 'Gratitude',
      'date': 'Sep 12, 2026',
      'title': 'Gratitude for Unexpected Provision',
    },
    {
      'category': 'Prayer Reflection',
      'date': 'Sep 20, 2026',
      'title': 'Prayer for Wisdom with Cohort',
    },
    {
      'category': 'Gratitude',
      'date': 'Sep 30, 2026',
      'title': 'Gratitude for Unexpected Provision',
    },
  ];

  void _newEntry({bool fromPrompt = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => NewEntryScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibleEntries = _entries.where((entry) {
      final searchable =
          '${entry.values.join(' ')} Sabbath QuietHeart Time';
      return searchable.toLowerCase().contains(_search.toLowerCase());
    }).toList();

    return JournalPage(
      title: 'Journal Dashboard',
      children: [
        const SizedBox(height: 18),
        TextField(
          onChanged: (value) => setState(() => _search = value),
          style: FinanceText.body(size: 12, color: Colors.black87),
          decoration: journalInputDecoration(
            'Search reflections, scriptures, tags...',
          ).copyWith(
            prefixIcon: const Icon(
              Icons.search,
              size: 18,
              color: Colors.black45,
            ),
          ),
        ),
        const SizedBox(height: 42),
        JournalCard(
          padding: const EdgeInsets.fromLTRB(18, 30, 18, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Daily Stewardship Prompt',
                  style: FinanceText.subheading(size: 14),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: journalYellow,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Text(
                  '“Were did you observe unhurried grace in your '
                      'stewardship of time or fellowship today?”',
                  style: FinanceText.body(
                    size: 13,
                    color: const Color(0xFF735C00),
                  ).copyWith(height: 1.35),
                ),
              ),
              const SizedBox(height: 28),
              JournalButton(
                label: 'Reflect on this prompt',
                onPressed: () => _newEntry(fromPrompt: true),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: Text(
                'Reflections',
                style: FinanceText.heading(size: 16),
              ),
            ),
            SizedBox(
              width: 130,
              child: JournalButton(
                label: '+New Entry',
                onPressed: () => _newEntry(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        if (visibleEntries.isEmpty)
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'No reflections found.',
              textAlign: TextAlign.center,
              style: FinanceText.body(),
            ),
          ),
        for (final entry in visibleEntries) ...[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EntryDetailsScreen(
                    title: entry['title']!,
                    category: entry['category']!,
                    date: entry['date']!,
                  ),
                ),
              );
            },
            child: JournalCard(
              padding: const EdgeInsets.fromLTRB(27, 18, 23, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${entry['category']} · ${entry['date']}',
                          style: FinanceText.body(
                            size: 10,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const JournalPrivacyBadge(),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    entry['title']!,
                    style: FinanceText.subheading(size: 14),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Taking 45 minutes of stillness before the morning '
                        'rush. Realized that hurry is often the...',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: FinanceText.body(
                      size: 13,
                      color: Colors.black87,
                    ).copyWith(height: 1.4),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '#Sabbath   #QuietHeart   #Time',
                          style: FinanceText.body(
                            size: 10,
                            color: journalGold,
                          ),
                        ),
                      ),
                      if (identical(entry, _entries.first)) ...[
                        const SizedBox(
                          width: 32,
                          height: 32,
                          child: ClipOval(child: JournalPhoto()),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.camera_alt_outlined,
                          size: 16,
                          color: Colors.black45,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
        ],
      ],
    );
  }
}