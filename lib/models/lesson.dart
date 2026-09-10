class Lesson {
  final String title;
  final String description;
  final List<String> keyPoints;

  Lesson({
    required this.title,
    required this.description,
    required this.keyPoints,
  });
}

final List<Lesson> flutterLessons = [
  Lesson(
    title: "What is Flutter?",
    description:
        "Flutter is a UI toolkit developed by Google for building applications.",
    keyPoints: [
      "Flutter is developed by Google.",
      "Flutter uses widgets to build user interfaces.",
      "Flutter can build apps for multiple platforms.",
    ],
  ),

  Lesson(
    title: "Why use Flutter?",
    description:
        "Flutter allows developers to build applications for multiple platforms using a single codebase.",
    keyPoints: [
      "Flutter uses a single codebase.",
      "Flutter supports multiple platforms.",
      "Flutter provides fast development with hot reload.",
    ],
  ),

  Lesson(
    title: "Flutter Architecture",
    description:
        "Flutter uses widgets and a rendering system to build and display application interfaces.",
    keyPoints: [
      "Flutter UI is built using widgets.",
      "Flutter has its own rendering system.",
      "Widgets can be combined to create complex interfaces.",
    ],
  ),
];