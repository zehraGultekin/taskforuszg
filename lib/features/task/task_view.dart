import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/core/route/app_route_name.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';
import 'package:taskforuszehra/features/task/widgets/task_item.dart';
import 'package:taskforuszehra/features/task/widgets/task_widget.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Görevlerim',

        actions: [
          IconButton(
            icon: Icon(Icons.repeat_rounded, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TaskWidget(
                icon: Icons.calendar_view_day,
                number: "0",
                title: "Tamamlanmayı",
                subtitle: "Bekleyen",
                color: Colors.amber,
              ),
              SizedBox(width: 10),
              TaskWidget(
                icon: Icons.task_alt_outlined,
                title: "Başarıyla",
                subtitle: "Tamamlanan",
                number: "0",
                color: Colors.green,
              ),
              SizedBox(width: 10),
              TaskWidget(
                icon: Icons.person_add_disabled,
                title: "Alınmayı",
                subtitle: "Bekleyen",
                number: "5",
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.task_rounded, size: 30, color: Colors.white),
                SizedBox(width: 5),
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
                          ).colorScheme.primary,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 200,
                              child: Center(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        left: 20,
                                        right: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Proje Seç",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.onSurface,
                                                ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                      ),
                                      child: Container(
                                        height: 45,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.surface,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.search,
                                                color: Colors.grey,
                                                size: 20,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                "Proje Ara...",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      color: Colors.grey,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.withAlpha(1),
                                      thickness: 1,
                                      endIndent: 20,
                                      indent: 20,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Theme.of(
                              context,
                            ).scaffoldBackgroundColor,
                            context: context,
                            builder: (context) {
                              int? selectedIndex;
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
                                                onPressed: () {},
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
                                              fillColor: Colors.white
                                                  .withValues(alpha: 0.1),
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
                                              itemCount: TaskItem.task.length,
                                              itemBuilder: (context, index) {
                                                final item =
                                                    TaskItem.task[index];
                                                final bool isSelected =
                                                    selectedIndex == index;
                                                return GestureDetector(
                                                  onTap: () {
                                                    setModalState(() {
                                                      selectedIndex = index;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                                color:
                                                                    isSelected
                                                                    ? Colors
                                                                          .green
                                                                    : Colors
                                                                          .white,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
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

                        child: Icon(Icons.filter),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        context.goNamed(AppRouteName.task_create.name);
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
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
