import 'package:flutter/material.dart';
import 'package:taskforuszehra/features/activies/data/models/activities_model.dart';

class ActivityCard extends StatelessWidget {
  final ActivitiesType type;
  final bool isSelected;
  const ActivityCard({super.key, required this.type, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 50,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected
            ? Colors.white
            : Theme.of(context).colorScheme.surface.withValues(alpha: 0.1),
        border: Border.all(
          color: isSelected
              ? type.color
              : Theme.of(context).colorScheme.surface.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.coffee, color: isSelected ? type.color : Colors.grey),
          SizedBox(width: 10),
          Text(
            type.title,
            style: TextStyle(
              color: isSelected ? type.color : Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
