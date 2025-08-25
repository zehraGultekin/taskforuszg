import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PermissionTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isDate;
  final bool isTime;

  const PermissionTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.isDate,
    required this.isTime,
  });

  @override
  State<PermissionTextField> createState() => _PermissionTextFieldState();
}

class _PermissionTextFieldState extends State<PermissionTextField> {
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      widget.controller.text = DateFormat("dd/MM/yyyy").format(picked);
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      widget.controller.text = picked.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: widget.isDate || widget.isTime,
      onTap: () async {
        if (widget.isDate) {
          _selectDate();
        } else if (widget.isTime) {
          _selectTime();
        }
      },
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
