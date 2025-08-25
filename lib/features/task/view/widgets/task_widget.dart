import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final VoidCallback? onTap;

  final IconData icon;
  final String number;
  final String title;
  final String subtitle;
  final Color color;
  final bool isSelected;
  const TaskWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.number,
    required this.color,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 130,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.surface,

          border: Border.all(color: isSelected ? Colors.blue : Colors.red),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            SizedBox(height: 8),
            Text(
              number,
              style: TextStyle(
                color: color,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 12)),
            Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
