import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';

class PermissionRequest extends StatefulWidget {
  const PermissionRequest({super.key});

  @override
  State<PermissionRequest> createState() => _PermissionRequestState();
}

class _PermissionRequestState extends State<PermissionRequest> {
  final List<String> type = [
    "Yıllık İzin",
    "Doğum İzni",
    "Emzirme İzni",
    "Baba İzni",
    "Hastalık İzni",
    "Vefat İzni",
    "İş Arama İzni",
    "Düğün İzni",
    "Evlat Edinme İzni",
    "Mazeret İzni",
    "Refakat İzni",
    "Ücretsiz İzin",
    "Ücretli İzin",
    "Diğer",
  ];
  String selectedValue = 'Yıllık İzin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "İzin Talepi Oluştur",
        leading: Icon(Icons.arrow_back_ios, size: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            DropdownButtonFormField(
              initialValue: selectedValue,
              isExpanded: true,
              decoration: InputDecoration(
                labelText: "İzin Türü",
                labelStyle: TextStyle(color: Colors.grey),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),

              icon: Icon(Icons.arrow_drop_down),
              items: type.map((e) {
                return DropdownMenuItem<String>(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
