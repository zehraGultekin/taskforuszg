import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskforuszehra/features/activies/data/models/activities_model.dart';

final selectedActivityType = StateProvider<ActivitiesType?>((ref) => null);
final startTimeProvider = StateProvider<TimeOfDay?>((ref) => null);
final endTimeProvider = StateProvider<TimeOfDay?>((ref) => null);
final inputProvider = StateProvider<String?>((ref) => null);
final dailyActivityProvider =
    StateNotifierProvider<DailyActivityNotifier, List<DailyActivity>>(
      (ref) => DailyActivityNotifier(allActivity),
    );

class DailyActivityNotifier extends StateNotifier<List<DailyActivity>> {
  DailyActivityNotifier(List<DailyActivity> initialData) : super(initialData);

  void addActivity(DateTime date, ActivitiesModel activity) {
    bool dayExists = false;
    final newState = state.map((day) {
      if (day.date == date) {
        dayExists = true;
        return DailyActivity(day.date, [...day.activities, activity]);
      } else {
        return day;
      }
    }).toList();
    if (!dayExists) {
      newState.add(DailyActivity(date, [activity]));
    }
    state = newState;
  }
}
