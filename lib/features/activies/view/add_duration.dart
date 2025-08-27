import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';
import 'package:taskforuszehra/features/activies/data/models/activities_model.dart';
import 'package:taskforuszehra/features/activies/providers/add_duration.dart';
import 'package:taskforuszehra/features/activies/view/widgets/activity_choose.dart';

class AddDuration extends ConsumerStatefulWidget {
  const AddDuration({super.key});

  @override
  ConsumerState<AddDuration> createState() => _AddDurationState();
}

class _AddDurationState extends ConsumerState<AddDuration> {
  TimeOfDay? startActivity;
  TimeOfDay? endActivity;

  Future<void> _startActivity() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: ref.read(startTimeProvider) ?? TimeOfDay.now(),
    );

    if (picked != null) {
      ref.read(startTimeProvider.notifier).state = picked;
    }
  }

  Future<void> _endActivity() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: ref.read(endTimeProvider) ?? TimeOfDay.now(),
    );

    if (picked != null) {
      ref.read(endTimeProvider.notifier).state = picked;
    }
  }

  String formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  @override
  Widget build(BuildContext context) {
    final selectedType = ref.watch(selectedActivityType);
    final startTime = ref.watch(startTimeProvider);
    final endTime = ref.watch(endTimeProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Aktivite Ekle",
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Aktivite Tipi",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    ref.read(selectedActivityType.notifier).state =
                        ActivitiesType.mola;
                  },
                  child: ActivityCard(
                    type: ActivitiesType.mola,
                    isSelected: selectedType == ActivitiesType.mola,
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    ref.read(selectedActivityType.notifier).state =
                        ActivitiesType.ogleArasi;
                  },
                  child: ActivityCard(
                    type: ActivitiesType.ogleArasi,
                    isSelected: selectedType == ActivitiesType.ogleArasi,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                ref.read(selectedActivityType.notifier).state =
                    ActivitiesType.serbestZaman;
              },
              child: ActivityCard(
                type: ActivitiesType.serbestZaman,
                isSelected: selectedType == ActivitiesType.serbestZaman,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Başlangıç",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(
                          context,
                        ).colorScheme.surface.withValues(alpha: 0.3),
                      ),
                      child: InkWell(
                        onTap: () => _startActivity(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(width: 10),
                            Text(
                              startTime != null
                                  ? formatTime(startTime)
                                  : "Saat seçin",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bitiş",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(
                          context,
                        ).colorScheme.surface.withValues(alpha: 0.3),
                      ),
                      child: InkWell(
                        onTap: () => _endActivity(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(width: 10),
                            Text(
                              endTime != null
                                  ? formatTime(endTime)
                                  : "Saat seçin",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Açıklama",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                ref.read(inputProvider.notifier).state = value;
              },
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "(Opsiyonel)",
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.surface.withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                onPressed: () {},
                child: Text(
                  "Kaydet",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
