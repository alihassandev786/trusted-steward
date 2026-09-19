import 'package:flutter/material.dart';

class TalentActivity {
  const TalentActivity({required this.title, required this.modality, required this.date,
    required this.minutes, this.reflection = ''});
  final String title;
  final String modality;
  final DateTime date;
  final int minutes;
  final String reflection;
}

class Talent {
  Talent({required this.id, required this.name, required this.category,
    this.description = '', this.summary = '', this.icon = Icons.auto_awesome_outlined,
    List<TalentActivity>? activities}) : activities = List.of(activities ?? []);
  final String id;
  final String name;
  final String category;
  final String description;
  final String summary;
  final IconData icon;
  final List<TalentActivity> activities;
}

/// Local, in-memory state. Connect your persistence layer to save across launches.
class TalentsController extends ChangeNotifier {
  TalentsController({List<Talent>? initialTalents}) : _talents = List.of(initialTalents ?? []);
  final List<Talent> _talents;
  List<Talent> get talents => List.unmodifiable(_talents);

  void addTalent(Talent talent) { _talents.add(talent); notifyListeners(); }
  void addActivity(String talentId, TalentActivity activity) {
    final talent = _talents.firstWhere((item) => item.id == talentId);
    talent.activities.insert(0, activity);
    notifyListeners();
  }

  factory TalentsController.demo() => TalentsController(initialTalents: [
    Talent(id: 'teaching', name: 'Teaching & Biblical Study', category: 'Faith & Wisdom',
      summary: 'Make an encouraging drawing for grandparents', icon: Icons.record_voice_over_outlined),
    Talent(id: 'leadership', name: 'Servant Leadership & Mentorship', category: 'Spiritual Growth',
      summary: 'Beginner Keyboard', icon: Icons.groups,
      description: 'Read and meditate on Psalms 23. Reflect on the concepts of stewardship, guidance, and the Lord as a shepherd. Write down three key takeaways in the journal.',
      activities: [
        TalentActivity(title: 'Apprentice Coaching Session', modality: 'Practice',
          date: DateTime(2026, 10, 24), minutes: 90,
          reflection: 'Discussed humility in team discernment and intentional listening cues.'),
        TalentActivity(title: 'Servant Leadership', modality: 'Reading',
          date: DateTime(2026, 10, 24), minutes: 90),
      ]),
    Talent(id: 'worship', name: 'Worship', category: 'Spiritual Growth',
      summary: 'Perform amazing grace on playing game', icon: Icons.handshake_outlined),
    Talent(id: 'hospitality', name: 'Community Hospitality', category: 'Service',
      summary: 'Led apprentice cohort 2 days ago', icon: Icons.volunteer_activism_outlined),
    Talent(id: 'audio', name: 'Audio Convey', category: 'Creative Arts',
      summary: 'Perform amazing grace on playing game', icon: Icons.graphic_eq),
  ]);
}
