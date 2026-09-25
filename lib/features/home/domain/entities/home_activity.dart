enum HomeActivityType { completed, started, achievement }

class HomeActivity {
  final HomeActivityType type;
  final String title;
  final String time;

  const HomeActivity({
    required this.type,
    required this.title,
    required this.time,
  });
}
