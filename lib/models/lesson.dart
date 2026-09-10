class Lesson {
  final String title;
  final String description;

  Lesson({
    required this.title,
    required this.description,
  });
}

final List<Lesson> flutterLessons = [
  Lesson(
    title: "What is Flutter?",
    description:
        "Flutter is a UI toolkit developed by Google for building applications.",
  ),

  Lesson(
    title: "Why use Flutter?",
    description:
        "Flutter allows developers to build applications for multiple platforms using a single codebase.",
  ),

  Lesson(
    title: "Flutter Architecture",
    description:
        "Flutter uses widgets and a rendering system to build and display application interfaces.",
  ),
];