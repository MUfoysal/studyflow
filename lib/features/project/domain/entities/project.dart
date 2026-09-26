import 'package:study_flow/features/project/domain/entities/project_step.dart';

class Project {
  final String id;
  final String title;
  final String description;
  final String difficulty;
  final List<String> technologies;
  final List<String> features;
  final String whyBuild;
  final String whatYouLearn;
  final String folderStructure;
  final List<String> importantFiles;
  final List<String> badPractices;
  final List<String> goodPractices;
  final List<ProjectStep> steps;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.technologies,
    required this.features,
    required this.whyBuild,
    required this.whatYouLearn,
    required this.folderStructure,
    required this.importantFiles,
    required this.badPractices,
    required this.goodPractices,
    required this.steps,
  });
}