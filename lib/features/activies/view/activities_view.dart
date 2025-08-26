import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:taskforuszehra/core/route/app_route_name.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';
import 'package:taskforuszehra/features/activies/data/models/activities_model.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({super.key});

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Aktivitelerim"),
      body: ListView.builder(
        itemCount: allActivity.length,
        itemBuilder: (BuildContext context, int index) {
          final day = allActivity[index];
          final formatter = DateFormat('d MMM yyyy');
          final dateStr = formatter.format(day.date);

          if (day.activities.isEmpty) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: ListTile(
                title: Column(
                  children: [
                    Row(
                      children: [
                        Text(dateStr),
                        SizedBox(width: 10),
                        Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Aktivite Yok",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }
          return ExpansionTile(
            title: Row(
              children: [
                Text(dateStr),
                SizedBox(width: 10),
                Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "${day.activities.length} Aktivite",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            children: day.activities.map((activity) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                  color: Colors.black,
                ),

                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withValues(alpha: 0.2),
                      ),
                      child: Icon(Icons.schedule, color: Colors.blue),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(activity.title.title), Text(dateStr)],
                    ),
                    Spacer(),
                    CircleAvatar(child: Text(day.activities.length.toString())),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: SizedBox(
        height: 40,
        width: 140,
        child: FloatingActionButton(
          onPressed: () {
            context.goNamed(Routes.addDurationName);
          },
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_chart, color: Colors.white),
              SizedBox(width: 8),
              Text(
                "Süre Ekle",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
