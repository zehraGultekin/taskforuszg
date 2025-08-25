import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/core/route/app_route_name.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';
import 'package:taskforuszehra/features/task/data/models/project_item.dart';
import 'package:taskforuszehra/features/task/data/models/task_item.dart';
import 'package:taskforuszehra/features/task/view/widgets/task_widget.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  int? selectedTaskWidget;
  List<TaskItem> taskList = [];
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Görevlerim',
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              setState(() {
                taskList.clear();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TaskWidget(
                isSelected: selectedTaskWidget == 0,
                icon: Icons.pending_actions,
                number: "0",
                title: "Tamamlanmayı",
                subtitle: "Bekleyen",
                color: Colors.amber,
                onTap: () {
                  setState(() {
                    selectedTaskWidget = 0;
                    taskList = allTasks
                        .where((e) => e.status == TaskStatus.bekleyen)
                        .toList();
                  });
                },
              ),
              SizedBox(width: 10),
              TaskWidget(
                isSelected: selectedTaskWidget == 1,
                icon: Icons.task_alt_outlined,
                title: "Başarıyla",
                subtitle: "Tamamlanan",
                number: "0",
                color: Colors.green,
                onTap: () {
                  setState(() {
                    selectedTaskWidget = 1;
                    taskList = allTasks
                        .where((e) => e.status == TaskStatus.tamamlanan)
                        .toList();
                  });
                },
              ),
              SizedBox(width: 10),
              TaskWidget(
                isSelected: selectedTaskWidget == 2,
                icon: Icons.person_off,
                title: "Alınmayı",
                subtitle: "Bekleyen",
                number: "5",
                color: Colors.grey,
                onTap: () {
                  setState(() {
                    selectedTaskWidget = 2;
                    taskList = allTasks
                        .where((e) => e.status == TaskStatus.alinmayan)
                        .toList();
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.assignment_outlined, size: 30, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Görevler",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Theme.of(
                            context,
                          ).scaffoldBackgroundColor,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setModalState) {
                                return SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Proje Seç",
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyLarge,
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: () {
                                                context.pop();
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        TextField(
                                          decoration: InputDecoration(
                                            hintText: "Proje Ara...",
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            prefixIcon: IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.search),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white.withValues(
                                              alpha: 0.1,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.white,
                                          endIndent: 5,
                                          indent: 5,
                                          thickness: 1,
                                        ),
                                        SizedBox(height: 10),
                                        Expanded(
                                          child: ListView.separated(
                                            itemCount: ProjectItem.task.length,
                                            itemBuilder: (context, index) {
                                              final item =
                                                  ProjectItem.task[index];
                                              final bool isSelected =
                                                  selectedIndex == index;
                                              return InkWell(
                                                onTap: () {
                                                  setModalState(() {
                                                    selectedIndex = index;
                                                  });
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                  ),
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    border: Border.all(
                                                      color: isSelected
                                                          ? Colors.green
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.apartment,
                                                        color: isSelected
                                                            ? Colors.green
                                                            : Colors.white,
                                                      ),
                                                      SizedBox(width: 10),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            item.title,
                                                            style: TextStyle(
                                                              color: isSelected
                                                                  ? Colors.green
                                                                  : Colors
                                                                        .white,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          SizedBox(height: 10),
                                                          Text(
                                                            item.subtitle,
                                                            style: isSelected
                                                                ? TextStyle(
                                                                    color: Colors
                                                                        .green,
                                                                    fontSize:
                                                                        12,
                                                                  )
                                                                : Theme.of(
                                                                        context,
                                                                      )
                                                                      .textTheme
                                                                      .bodySmall,
                                                          ),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Radio(
                                                        value: index,
                                                        groupValue:
                                                            selectedIndex,
                                                        onChanged: (value) {
                                                          setModalState(() {
                                                            selectedIndex =
                                                                value;
                                                          });
                                                        },
                                                        activeColor:
                                                            Colors.green,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (
                                                  BuildContext context,
                                                  int index,
                                                ) {
                                                  return SizedBox(height: 10);
                                                },
                                          ),
                                        ),
                                        if (selectedIndex != null) ...[
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                      color: Colors.red,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Temizle",
                                                        style: Theme.of(
                                                          context,
                                                        ).textTheme.bodyLarge,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    color: Colors.green,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Projeye Göre Filtrele",
                                                      style: Theme.of(
                                                        context,
                                                      ).textTheme.bodyLarge,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },

                      child: Icon(Icons.filter_list),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    final TaskItem? newTask = await context.pushNamed(
                      Routes.createTaskName,
                    );
                    if (newTask != null) {
                      setState(() {
                        taskList.add(newTask);
                      });
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "+ Yeni Görev",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final item = taskList[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.4),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      item.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      item.subtitle,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
