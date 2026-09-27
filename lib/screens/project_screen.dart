import 'package:flutter/material.dart';
import 'package:study_flow/features/project/domain/entities/project.dart';
import 'package:study_flow/features/project/domain/usecases/get_project_progress.dart';
import 'package:study_flow/features/project/domain/usecases/get_projects.dart';
import 'package:study_flow/widgets/project_card.dart';

class ProjectScreen extends StatefulWidget {
  final GetProjects getProjects;
  final GetProjectProgress getProjectProgress;

  const ProjectScreen({
    super.key,
    required this.getProjects,
    required this.getProjectProgress,
  });

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late Future<List<Project>> _projects;

  @override
  void initState() {
    super.initState();
    _projects = widget.getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Projects 🛠️',
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<Project>>(
        future: _projects,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong.'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final projects = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text(
                'Build. Practice. Understand.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Practice what you learn by building real-world projects.',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              ...projects.map(
                (project) => ProjectCard(
                  project: project,
                  getProjectProgress: widget.getProjectProgress,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}