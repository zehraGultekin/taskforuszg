import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/core/route/app_route_name.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';
import 'package:taskforuszehra/features/task/widgets/task_item.dart';

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
          onPressed: () {},
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
                          child: Text(cities[index][0]),
                          backgroundColor: Colors.black,
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
                                          child: Text(item.title[0]),
                                          backgroundColor: Colors.black,
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
                              child: Text(departman[index][0]),
                              backgroundColor: Colors.black,
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
              TaskName(title: "Görev adı", controller: taskNameController),
              SizedBox(height: 10),
              TaskName(
                title: "Görev tanımı",
                controller: taskExplainController,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text("Gönder"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.1),
                  maximumSize: Size(150, 50),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class TaskName extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const TaskName({super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          hintText: title,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.1),
        ),
      ),
    );
  }
}

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
