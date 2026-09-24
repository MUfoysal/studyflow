import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:study_flow/models/project.dart';
import 'package:study_flow/models/project_progress.dart';
import 'package:study_flow/widgets/bullet_list.dart';
import 'package:study_flow/widgets/project_section.dart';
import 'package:study_flow/widgets/technology_chip.dart';
import 'package:study_flow/widgets/code_block.dart';
import 'package:study_flow/screens/project_step_details_screen.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final Project project;

  const ProjectDetailsScreen({
    super.key,
    required this.project,
  });

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  int _completedSteps = 0;

  @override
  void initState() {
    super.initState();
    _loadProjectProgress();
  }

  Future<void> _loadProjectProgress() async {
    final prefs = await SharedPreferences.getInstance();

    final completedSteps =
        prefs.getStringList('completed_project_steps') ?? [];

    final projectStepIds =
        widget.project.steps.map((step) => step.id).toSet();

    final completedProjectSteps = completedSteps
        .where((stepId) => projectStepIds.contains(stepId))
        .length;

    if (mounted) {
      setState(() {
        _completedSteps = completedProjectSteps;
      });
    }
  }

  ProjectProgress get _projectProgress {
    final totalSteps = widget.project.steps.length;

    ProjectStatus status;

    if (_completedSteps == 0) {
      status = ProjectStatus.notStarted;
    } else if (_completedSteps >= totalSteps) {
      status = ProjectStatus.completed;
    } else {
      status = ProjectStatus.inProgress;
    }

    return ProjectProgress(
      projectId: widget.project.id,
      completedSteps: _completedSteps,
      totalSteps: totalSteps,
      status: status,
    );
  }

  String _statusText(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.notStarted:
        return 'Not Started';
      case ProjectStatus.inProgress:
        return 'In Progress';
      case ProjectStatus.completed:
        return 'Completed';
    }
  }

  Color _statusColor(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.notStarted:
        return const Color(0xFF6B7280);
      case ProjectStatus.inProgress:
        return const Color(0xFF2563EB);
      case ProjectStatus.completed:
        return const Color(0xFF16A34A);
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = _projectProgress;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF111827),
        elevation: 0,
        title: Text(widget.project.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildHeader(),
          const SizedBox(height: 24),

          _buildProgressSection(progress),
          const SizedBox(height: 20),

          ProjectSection(
            title: 'Overview',
            child: Text(
              widget.project.description,
              style: _bodyStyle(),
            ),
          ),

          ProjectSection(
            title: 'Why Build This?',
            child: Text(
              widget.project.whyBuild,
              style: _bodyStyle(),
            ),
          ),

          ProjectSection(
            title: 'Features',
            child: BulletList(
              items: widget.project.features,
            ),
          ),

          ProjectSection(
            title: 'Technologies',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.project.technologies
                  .map(
                    (technology) => TechnologyChip(
                      technology: technology,
                    ),
                  )
                  .toList(),
            ),
          ),

          ProjectSection(
            title: 'Folder Structure',
            child: CodeBlock(
              code: widget.project.folderStructure,
            ),
          ),

          ProjectSection(
            title: 'Important Files',
            child: BulletList(
              items: widget.project.importantFiles,
            ),
          ),

          ProjectSection(
            title: 'Bad Practices ❌',
            child: BulletList(
              items: widget.project.badPractices,
            ),
          ),

          ProjectSection(
            title: 'Good Practices ✅',
            child: BulletList(
              items: widget.project.goodPractices,
            ),
          ),

          ProjectSection(
            title: 'Project Steps',
            child: Column(
              children: List.generate(
                widget.project.steps.length,
                (index) {
                  final step = widget.project.steps[index];

                  return InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProjectStepDetailsScreen(
                            step: step,
                          ),
                        ),
                      );

                      await _loadProjectProgress();
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: index ==
                                widget.project.steps.length - 1
                            ? 0
                            : 12,
                      ),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAF9),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCFCE7),
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF15803D),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  step.title,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF111827),
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  step.description,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    height: 1.5,
                                    color: Color(0xFF6B7280),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8),

                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                            color: Color(0xFF9CA3AF),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          ProjectSection(
            title: 'What You Learn',
            child: Text(
              widget.project.whatYouLearn,
              style: _bodyStyle(),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.code,
            size: 42,
            color: Color(0xFF16A34A),
          ),

          const SizedBox(height: 14),

          Text(
            widget.project.title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            widget.project.difficulty,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF16A34A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection(ProjectProgress progress) {
    final statusColor = _statusColor(progress.status);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Project Progress',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _statusText(progress.status),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${progress.completedSteps}/${progress.totalSteps} steps completed',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF6B7280),
                ),
              ),

              Text(
                '${(progress.progress * 100).round()}%',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF16A34A),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress.progress,
              minHeight: 10,
              backgroundColor: const Color(0xFFE5E7EB),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF16A34A),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _bodyStyle() {
    return const TextStyle(
      fontSize: 14,
      color: Color(0xFF4B5563),
      height: 1.6,
    );
  }
}