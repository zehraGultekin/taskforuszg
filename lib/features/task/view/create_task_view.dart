import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:taskforuszehra/core/widgets/appbar.dart';
import 'package:taskforuszehra/features/task/data/models/task_item.dart';
import 'package:taskforuszehra/features/task/data/models/project_model.dart';
import 'package:taskforuszehra/features/task/view/widgets/input_selection.dart';
import 'package:taskforuszehra/features/task/view/widgets/task_input.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  String? selectedCity;
  String? selectedProject;
  String? selectedDepartman;
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskExplainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Görev Talebi Oluştur",
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SelectionTile(
              label: "Şehir Seçiniz",
              value: selectedCity,
              onTap: () async {
                final city = await showModalBottomSheet(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    List<String> cities = ["Adana", "Hatay", "Mersin"];
                    return ListView.separated(
                      itemCount: cities.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Text(cities[index][0]),
                        ),
                        title: Text(cities[index]),
                        onTap: () {
                          context.pop(cities[index]);
                        },
                      ),
                      separatorBuilder: (context, index) => Divider(),
                    );
                  },
                );
                if (city != null) {
                  setState(() {
                    selectedCity = city;
                  });
                }
              },
            ),
            if (selectedCity != null)
              SelectionTile(
                label: "Project",
                onTap: () async {
                  final project = await showModalBottomSheet<String>(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    builder: (context) {
                      List<Project> projects = [
                        Project(
                          title: "Colder",
                          subtitle: "Harputlu Otomotiv Ltd.şti.",
                        ),
                        Project(title: "Hotder", subtitle: "Başka Bir Firma"),
                      ];
                      String search = "";
                      return StatefulBuilder(
                        builder: (context, setModalState) {
                          final filteredProjects = projects
                              .where(
                                (project) =>
                                    project.title.toLowerCase().contains(
                                      search.toLowerCase(),
                                    ) ||
                                    project.subtitle.toLowerCase().contains(
                                      search.toLowerCase(),
                                    ),
                              )
                              .toList();

                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white.withValues(
                                            alpha: 0.5,
                                          ),
                                        ),
                                      ),
                                      hintText: "Ara",
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white.withValues(
                                            alpha: 0.1,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setModalState(() {
                                        search = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(height: 12),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: filteredProjects.length,

                                    itemBuilder: (context, index) {
                                      final item = filteredProjects[index];
                                      return ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          child: Text(item.title[0]),
                                        ),
                                        title: Text(item.title),
                                        subtitle: Text(item.subtitle),
                                        onTap: () {
                                          context.pop(item.title);
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );

                  if (project != null) {
                    setState(() {
                      selectedProject = project;
                    });
                  }
                },
                value: selectedProject,
              ),
            if (selectedProject != null)
              SelectionTile(
                label: "Departman",
                onTap: () async {
                  final departman = await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                    builder: (context) {
                      List<String> departman = ["Yazılım"];

                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Text(departman[index][0]),
                            ),
                            title: Text(departman[index]),
                            onTap: () {
                              context.pop(departman[index]);
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Divider(thickness: 1),
                        itemCount: departman.length,
                      );
                    },
                  );
                  if (departman != null) {
                    setState(() {
                      selectedDepartman = departman;
                    });
                  }
                },
                value: selectedDepartman,
              ),
            SizedBox(height: 10),
            if (selectedDepartman != null) ...[
              TaskInputField(
                title: "Görev adı",
                controller: taskNameController,
              ),
              SizedBox(height: 10),
              TaskInputField(
                title: "Görev tanımı",
                controller: taskExplainController,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final newTask = TaskItem(
                    title: taskNameController.text,
                    subtitle: taskExplainController.text,
                  );
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Başarılı"),
                      content: Text("Görev oluşturuldu"),
                      backgroundColor: Theme.of(
                        context,
                      ).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            context.pop();
                            context.pop(newTask);
                          },
                          child: Text(
                            "Tamam",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.1),
                  maximumSize: Size(150, 50),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Gönder"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
