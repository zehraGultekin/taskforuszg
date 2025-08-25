class ActivitiesModel {
  final String title;
  final DateTime start;
  final DateTime end;

  ActivitiesModel(this.title, this.start, this.end);
}

class DailyActivity {
  final DateTime date;
  final List<ActivitiesModel> activities;

  DailyActivity(this.date, this.activities);
}

List<DailyActivity> allActivity = [
  DailyActivity(DateTime(2025, 8, 20), []),
  DailyActivity(DateTime(2025, 8, 19), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),
  DailyActivity(DateTime(2025, 8, 18), []),

  DailyActivity(DateTime(2025, 8, 17), [
    ActivitiesModel(
      "Tennis Dersi",
      DateTime(2025, 8, 17),
      DateTime(2025, 8, 17),
    ),
  ]),
];
