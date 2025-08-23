class TaskItem {
  final String title;
  final String subtitle;

  const TaskItem({required this.title, required this.subtitle});

  static const List<TaskItem> task = [
    TaskItem(title: "Abdullah Erdoğan Ofisi", subtitle: "Abdullah Erdoğan"),
    TaskItem(title: "Ahmet Can Oklu Dairesi", subtitle: "Adalife Ltd.şti"),
    TaskItem(title: "Aura House", subtitle: "Bor İnşaat"),
    TaskItem(title: "Colder", subtitle: "Harputlu Otomotiv Ltd.şti"),
  ];
}
