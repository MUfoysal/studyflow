
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_flow/data/project_data.dart';
import 'package:study_flow/features/project/domain/entities/project.dart';

class ProjectLocalDataSource {
  static const String _completedStepsKey = 'completed_project_steps';

  Future<List<Project>> getProjects() async {
    return projects;
  }

  Future<Project?> getProjectById(String projectId) async {
    for (final project in projects) {
      if (project.id == projectId) {
        return project;
      }
    }

    return null;
  }

  Future<Set<String>> getCompletedStepIds() async {
    final preferences = await SharedPreferences.getInstance();

    final completedSteps =
        preferences.getStringList(_completedStepsKey) ?? <String>[];

    return completedSteps.toSet();
  }

  Future<bool> isProjectStepCompleted(String stepId) async {
    final completedSteps = await getCompletedStepIds();

    return completedSteps.contains(stepId);
  }

  Future<void> completeProjectStep(String stepId) async {
    final preferences = await SharedPreferences.getInstance();

    final completedSteps =
        preferences.getStringList(_completedStepsKey) ?? <String>[];

    if (!completedSteps.contains(stepId)) {
      completedSteps.add(stepId);
      await preferences.setStringList(
        _completedStepsKey,
        completedSteps,
      );
    }
  }
}
