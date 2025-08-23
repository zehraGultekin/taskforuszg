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
          onPressed: () {
            context.goNamed(AppRouteName.navigator.name);
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
                  context: context,
                  builder: (context) {
                    List<String> cities = ["Adana", "Hatay", "Mersin"];
                    return ListView.builder(
                      itemCount: cities.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(cities[index]),
                        onTap: () {
                          context.pop(cities[index]);
                        },
                      ),
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
              InkWell(
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

                      return ListView.separated(
                        itemCount: projects.length,
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(projects[index].title[0]),
                              backgroundColor: Colors.black,
                            ),
                            title: Text(projects[index].title),
                            subtitle: Text(projects[index].subtitle),
                            onTap: () {
                              Navigator.pop(context, projects[index].title);
                            },
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
                    child: Text(
                      selectedProject ?? "Proje Seçiniz",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            if (selectedProject != null)
              InkWell(
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
                    child: Text(
                      selectedDepartman ?? "Proje Seçiniz",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 10),
            if (selectedDepartman != null) ...[
              SizedBox(
                height: 50,
                child: TextField(
                  controller: taskNameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                    hintText: "Görev Adı",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: taskExplainController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    hintText: "Görev Açıklaması",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
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
