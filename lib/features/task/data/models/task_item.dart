enum TaskStatus { bekleyen, tamamlanan, alinmayan }

class TaskItem {
  final TaskStatus status;
  final String title;
  final String subtitle;

  const TaskItem(this.status, {required this.title, required this.subtitle});
}

List<TaskItem> allTasks = [
  TaskItem(
    TaskStatus.alinmayan,
    title: "Protekno giriş kapısı",
    subtitle: "Kapı düzeltilmeli",
  ),
  TaskItem(
    TaskStatus.alinmayan,
    title: "elektrik tesisatı düzenlenmeli",
    subtitle: "Kapı düzeltilmeli",
  ),
  TaskItem(
    TaskStatus.alinmayan,
    title: "asasasasasasas",
    subtitle: "Kapı düzeltilmeli",
  ),
  TaskItem(
    TaskStatus.alinmayan,
    title: "asasasasasa",
    subtitle: "Kapı düzeltilmeli",
  ),
];
