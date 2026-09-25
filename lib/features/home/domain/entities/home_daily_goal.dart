class HomeDailyGoal {
  final int targetLessons;
  final int completedLessons;

  const HomeDailyGoal({
    required this.targetLessons,
    required this.completedLessons,
  });

  double get progress {
    if (targetLessons <= 0) {
      return 0;
    }

    return (completedLessons / targetLessons).clamp(0.0, 1.0);
  }
}
