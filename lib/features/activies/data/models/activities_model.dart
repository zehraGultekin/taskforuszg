import 'package:flutter/material.dart';

enum ActivitiesType { mola, ogleArasi, serbestZaman }

extension ActivitiesTypeExtension on ActivitiesType {
  String get title {
    switch (this) {
      case ActivitiesType.mola:
        return "Mola";
      case ActivitiesType.ogleArasi:
        return "Öğle Arası";
      case ActivitiesType.serbestZaman:
        return "Serbest Zaman";
    }
  }

  IconData get icon {
    switch (this) {
      case ActivitiesType.mola:
        return Icons.coffee;
      case ActivitiesType.ogleArasi:
        return Icons.lunch_dining;
      case ActivitiesType.serbestZaman:
        return Icons.free_cancellation;
    }
  }

  Color get color {
    switch (this) {
      case ActivitiesType.mola:
        return Colors.orangeAccent;
      case ActivitiesType.ogleArasi:
        return Colors.red;
      case ActivitiesType.serbestZaman:
        return Colors.blue;
    }
  }
}

class ActivitiesModel {
  final ActivitiesType title;
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
      ActivitiesType.mola,
      DateTime(2025, 8, 17),
      DateTime(2025, 8, 17),
    ),
  ]),
];
