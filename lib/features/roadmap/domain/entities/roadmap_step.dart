class RoadmapStep {
  final String number;
  final String title;
  final String subtitle;
  final bool completed;

  const RoadmapStep({
    required this.number,
    required this.title,
    required this.subtitle,
    this.completed = false,
  });
}
