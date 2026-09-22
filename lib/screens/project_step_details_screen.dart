import 'package:flutter/material.dart';
import 'package:study_flow/models/project_step.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectStepDetailsScreen extends StatefulWidget {
  final ProjectStep step;

  const ProjectStepDetailsScreen({super.key, required this.step});

  @override
  State<ProjectStepDetailsScreen> createState() =>
      _ProjectStepDetailsScreenState();
}

class _ProjectStepDetailsScreenState extends State<ProjectStepDetailsScreen> {
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _loadCompletionStatus();
  }

  Future<void> _loadCompletionStatus() async {
    final prefs = await SharedPreferences.getInstance();

    final completedSteps = prefs.getStringList('completed_project_steps') ?? [];

    if (completedSteps.contains(widget.step.id)) {
      setState(() {
        _isCompleted = true;
      });
    }
  }

  Future<void> _markStepAsComplete() async {
    final prefs = await SharedPreferences.getInstance();

    final completedSteps = prefs.getStringList('completed_project_steps') ?? [];

    if (!completedSteps.contains(widget.step.id)) {
      completedSteps.add(widget.step.id);
    }

    await prefs.setStringList('completed_project_steps', completedSteps);

    if (mounted) {
      setState(() {
        _isCompleted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF111827),
        elevation: 0,
        title: const Text(
          'Step Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildHeader(),
          const SizedBox(height: 20),

          _buildDescription(),
          const SizedBox(height: 20),

          _buildObjective(),
          const SizedBox(height: 20),

          _buildTasks(),
          const SizedBox(height: 20),

          _buildKeyPoints(),
          const SizedBox(height: 20),

          _buildExample(),
          const SizedBox(height: 20),

          _buildCompleteButton(),
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
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFDCFCE7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.task_alt_rounded,
              size: 30,
              color: Color(0xFF16A34A),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.step.title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return _buildSection(
      title: 'About This Step',
      icon: Icons.info_outline_rounded,
      child: Text(
        widget.step.description,
        style: const TextStyle(
          fontSize: 14,
          height: 1.6,
          color: Color(0xFF4B5563),
        ),
      ),
    );
  }

  Widget _buildObjective() {
    return _buildSection(
      title: 'Objective',
      icon: Icons.flag_outlined,
      child: Text(
        widget.step.objective,
        style: const TextStyle(
          fontSize: 14,
          height: 1.6,
          color: Color(0xFF4B5563),
        ),
      ),
    );
  }

  Widget _buildTasks() {
    return _buildSection(
      title: 'Tasks',
      icon: Icons.checklist_rounded,
      child: Column(
        children: widget.step.tasks.map((task) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle_outline_rounded,
                  size: 20,
                  color: Color(0xFF16A34A),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    task,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKeyPoints() {
    return _buildSection(
      title: 'Key Points',
      icon: Icons.lightbulb_outline_rounded,
      child: Column(
        children: widget.step.keyPoints.map((point) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.circle, size: 7, color: Color(0xFF16A34A)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    point,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildExample() {
    return _buildSection(
      title: 'Example',
      icon: Icons.code_rounded,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SelectableText(
          widget.step.example,
          style: const TextStyle(
            fontSize: 13,
            height: 1.6,
            color: Colors.white,
            fontFamily: 'monospace',
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: _isCompleted
            ? null
            : () async {
                await _markStepAsComplete();
              },
        icon: Icon(
          _isCompleted ? Icons.check_circle_rounded : Icons.check_rounded,
        ),
        label: Text(
          _isCompleted ? 'Completed' : 'Mark as Complete',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: _isCompleted
              ? const Color(0xFF16A34A)
              : Colors.black,
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFF16A34A),
          disabledForegroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.circle, size: 7, color: Color(0xFF16A34A)),
              const SizedBox(width: 8),
              Icon(icon, size: 20, color: const Color(0xFF16A34A)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}
