class ProjectItem {
  final String title;
  final String subtitle;

  const ProjectItem({required this.title, required this.subtitle});

  static const List<ProjectItem> task = [
    ProjectItem(title: "Abdullah Erdoğan Ofisi", subtitle: "Abdullah Erdoğan"),
    ProjectItem(title: "Ahmet Can Oklu Dairesi", subtitle: "Adalife Ltd.şti"),
    ProjectItem(title: "Aura House", subtitle: "Bor İnşaat"),
    ProjectItem(title: "Colder", subtitle: "Harputlu Otomotiv Ltd.şti"),
  ];
}
