import 'package:flutter/material.dart';
import 'package:study_flow/models/project.dart';
import 'package:study_flow/widgets/bullet_list.dart';
import 'package:study_flow/widgets/project_section.dart';
import 'package:study_flow/widgets/technology_chip.dart';
import 'package:study_flow/widgets/code_block.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF111827),
        elevation: 0,
        title: Text(project.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildHeader(),
          const SizedBox(height: 24),

          ProjectSection(
            title: 'Overview',
            child: Text(project.description, style: _bodyStyle()),
          ),

          ProjectSection(
            title: 'Why Build This?',
            child: Text(project.whyBuild, style: _bodyStyle()),
          ),

          ProjectSection(
            title: 'Features',
            child: BulletList(items: project.features),
          ),

          ProjectSection(
            title: 'Technologies',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.technologies
                  .map((technology) => TechnologyChip(technology: technology))
                  .toList(),
            ),
          ),

          ProjectSection(
            title: 'Folder Structure',
            child: CodeBlock(code: project.folderStructure),
          ),

          ProjectSection(
            title: 'Important Files',
            child: BulletList(items: project.importantFiles),
          ),

          ProjectSection(
            title: 'Bad Practices ❌',
            child: BulletList(items: project.badPractices),
          ),

          ProjectSection(
            title: 'Good Practices ✅',
            child: BulletList(items: project.goodPractices),
          ),
          ProjectSection(
            title: 'Project Steps',
            child: Column(
              children: List.generate(project.steps.length, (index) {
                final step = project.steps[index];

                return Container(
                  margin: EdgeInsets.only(
                    bottom: index == project.steps.length - 1 ? 0 : 12,
                  ),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAF9),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDCFCE7),
                          borderRadius: BorderRadius.circular(10),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                    ],
                  ),
                );
              }),
            ),
          ),

          ProjectSection(
            title: 'What You Learn',
            child: Text(project.whatYouLearn, style: _bodyStyle()),
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
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.code, size: 42, color: Color(0xFF16A34A)),
          const SizedBox(height: 14),
          Text(
            project.title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            project.difficulty,
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

  TextStyle _bodyStyle() {
    return const TextStyle(fontSize: 14, color: Color(0xFF4B5563), height: 1.6);
  }
}
