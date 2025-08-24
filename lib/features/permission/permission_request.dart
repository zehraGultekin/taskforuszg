import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';
import 'package:taskforuszehra/features/permission/domain/entities/permisson_model.dart';
import 'package:taskforuszehra/features/permission/view/widgets/permission_textfield.dart';

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
            context.pop();
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
                      PermissionTextField(
                        isDate: true,
                        isTime: false,
                        label: "Başlangıç Tarihi",
                        controller: dateController,
                      ),
                      SizedBox(height: 10),
                      PermissionTextField(
                        isDate: true,
                        isTime: false,
                        label: "Bitiş Tarihi",
                        controller: dateController2,
                      ),
                      SizedBox(height: 10),
                      PermissionTextField(
                        isDate: false,
                        isTime: false,
                        label: "Açıklama",
                        controller: nameController,
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          final newPermission = PermissionModel(
                            id: items.length + 1,
                            name: nameController.text,
                            status: PermissionStatus.pending,
                          );
                          setState(() {
                            items.add(newPermission);
                          });

                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Başarılı"),
                              content: Text("İzin talebi oluşturuldu"),
                              backgroundColor: Theme.of(
                                context,
                              ).scaffoldBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                    context.pop(newPermission);
                                  },
                                  child: Text(
                                    "Tamam",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
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
                      ),
                    ],
                  )
                : Column(
                    children: [
                      PermissionTextField(
                        label: "Tarih",
                        controller: dateController,
                        isDate: true,
                        isTime: false,
                      ),
                      SizedBox(height: 20),
                      PermissionTextField(
                        label: "Başlangıç Saati",
                        controller: clock,
                        isDate: false,
                        isTime: true,
                      ),
                      SizedBox(height: 20),
                      PermissionTextField(
                        label: "Bitiş Saati",
                        controller: clock2,
                        isDate: false,
                        isTime: true,
                      ),
                      SizedBox(height: 20),
                      PermissionTextField(
                        label: "Açıklama",
                        controller: nameController,
                        isDate: false,
                        isTime: false,
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          final newPermission = PermissionModel(
                            id: items.length + 1,
                            name: nameController.text,
                            status: PermissionStatus.pending,
                          );
                          setState(() {
                            items.add(newPermission);
                          });

                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Başarılı"),
                              content: Text("İzin talebi oluşturuldu"),
                              backgroundColor: Theme.of(
                                context,
                              ).scaffoldBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                    context.pop(newPermission);
                                  },
                                  child: Text(
                                    "Tamam",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
