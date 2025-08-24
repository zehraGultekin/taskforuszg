import 'package:flutter/material.dart';

class SelectionTile extends StatelessWidget {
  final String label;
  final String? value;
  final VoidCallback onTap;

  const SelectionTile({
    super.key,
    required this.label,
    this.value,
    required this.onTap,
  });

  @override
  Widget build(Object context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(value ?? label),
        ),
      ),
    );
  }
}
