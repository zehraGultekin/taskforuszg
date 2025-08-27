import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskforuszehra/features/activies/data/models/activities_model.dart';

final selectedActivityType = StateProvider<ActivitiesType?>((ref) => null);
final startTimeProvider = StateProvider<TimeOfDay?>((ref) => null);
final endTimeProvider = StateProvider<TimeOfDay?>((ref) => null);
