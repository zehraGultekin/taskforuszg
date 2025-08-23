import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:taskforuszehra/core/route/app_route_name.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';

class PermissionRequest extends StatefulWidget {
  const PermissionRequest({super.key});

  @override
  State<PermissionRequest> createState() => _PermissionRequestState();
}

class _PermissionRequestState extends State<PermissionRequest> {
  String selectedOption = "Gün";
  final TextEditingController controller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController dateController2 = TextEditingController();
  final TextEditingController clock = TextEditingController();
  final TextEditingController clock2 = TextEditingController();

  final TextEditingController timeController = TextEditingController();

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
        leading: IconButton(
          onPressed: () {
            context.goNamed(
              AppRouteName.permission.name,
            ); //Şimdilik ShellRoute oluşturulaca
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            DropdownButtonFormField(
              dropdownColor: Theme.of(context).scaffoldBackgroundColor,
              initialValue: selectedValue,
              isExpanded: true,
              decoration: InputDecoration(
                labelText: "İzin Türü",
                labelStyle: TextStyle(color: Colors.grey),
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
            SizedBox(height: 10),
            Text("Zaman Birimi", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(
                      value: "Gün",
                      groupValue: selectedOption,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    const Text("Gün"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "Saat",
                      groupValue: selectedOption,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    const Text("Saat"),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            selectedOption == "Gün"
                ? Column(
                    children: [
                      TextFieldWidget(
                        isDate: true,
                        isTime: false,
                        label: "Başlangıç Tarihi",
                        controller: dateController,
                      ),
                      SizedBox(height: 10),
                      TextFieldWidget(
                        isDate: true,
                        isTime: false,
                        label: "Bitiş Tarihi",
                        controller: dateController2,
                      ),
                      SizedBox(height: 10),
                      TextFieldWidget(
                        isDate: false,
                        isTime: false,
                        label: "Açıklama",
                        controller: nameController,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Gönder",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  )
                /* Column(
                    children: [
                      TextFormField(
                        controller: _controller,
                        readOnly: true,
                        onTap: _selectedDate,
                        decoration: InputDecoration(
                          labelText: "Bitiş Tarihi",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                 ) */
                : Column(
                    children: [
                      TextFieldWidget(
                        label: "Tarih",
                        controller: dateController,
                        isDate: true,
                        isTime: false,
                      ),
                      SizedBox(height: 20),
                      TextFieldWidget(
                        label: "Başlangıç Saati",
                        controller: clock,
                        isDate: false,
                        isTime: true,
                      ),
                      SizedBox(height: 20),
                      TextFieldWidget(
                        label: "Bitiş Saati",
                        controller: clock2,
                        isDate: false,
                        isTime: true,
                      ),
                      SizedBox(height: 20),
                      TextFieldWidget(
                        label: "Açıklama",
                        controller: nameController,
                        isDate: false,
                        isTime: false,
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Gönder",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
/*
class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback? onTap;

  const TextFieldWidget({
    super.key,
    required this.label,
    required this.controller,
    this.onTap,
  });
  @override
  Widget build(BuildContext contex) {
    return TextFormField(
      controller: controller,
      readOnly: onTap != null,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}   */

class TextFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isDate;
  final bool isTime;

  const TextFieldWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.isDate,
    required this.isTime,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
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
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
