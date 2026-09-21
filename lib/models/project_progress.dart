enum ProjectStatus { notStarted, inProgress, completed }

class ProjectProgress {
  final String projectId;
  final int completedSteps;
  final int totalSteps;
  final ProjectStatus status;

  const ProjectProgress({
    required this.projectId,
    required this.completedSteps,
    required this.totalSteps,
    required this.status,
  });

  double get progress {
    if (totalSteps <= 0) {
      return 0.0;
    }

    final value = completedSteps / totalSteps;

    return value.clamp(0.0, 1.0).toDouble();
  }
}
