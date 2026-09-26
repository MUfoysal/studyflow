class ProjectStep {
  final String id;
  final String title;
  final String description;
  final String objective;
  final List<String> tasks;
  final List<String> keyPoints;
  final String example;

  const ProjectStep({
    required this.id,
    required this.title,
    required this.description,
    required this.objective,
    required this.tasks,
    required this.keyPoints,
    required this.example,
  });
}