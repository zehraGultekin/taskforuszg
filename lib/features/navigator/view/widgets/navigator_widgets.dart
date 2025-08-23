import 'package:flutter/material.dart';

class TabIcon extends StatefulWidget {
  const TabIcon({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<TabIcon> createState() => _TabIconState();
}

class _TabIconState extends State<TabIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? Colors.white.withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: widget.isSelected
              ? [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Icon(
          widget.icon,
          size: 28,
          color: widget.isSelected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
