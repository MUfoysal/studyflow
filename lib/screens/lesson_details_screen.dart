
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LessonDetailsScreen extends StatefulWidget {
  final String courseTitle;
  final String lessonTitle;
  final int lessonNumber;
  final String description;
  final List<String> keyPoints;
  final String exampleCode;
  final VoidCallback? onComplete;

  const LessonDetailsScreen({
    super.key,
    required this.courseTitle,
    required this.lessonTitle,
    required this.lessonNumber,
    required this.description,
    required this.keyPoints,
    required this.exampleCode,
    this.onComplete,
  });

  @override
  State<LessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<LessonDetailsScreen> {
  bool isCompleted = false;
  bool _copied = false;

  Future<void> loadCompletionStatus() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLessons =
        prefs.getStringList('completed_${widget.courseTitle}') ?? [];

    final lessonIndex = widget.lessonNumber - 1;

    if (!mounted) return;

    setState(() {
      isCompleted = savedLessons.contains(lessonIndex.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    loadCompletionStatus();
  }

  void _handleComplete() {
    if (isCompleted) return;

    setState(() {
      isCompleted = true;
    });

    widget.onComplete?.call();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Lesson completed!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  Future<void> _handleCopy() async {
    await Clipboard.setData(
      ClipboardData(text: widget.exampleCode),
    );

    if (!mounted) return;

    setState(() {
      _copied = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Code copied"),
        duration: Duration(seconds: 1),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      setState(() {
        _copied = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: Text(widget.lessonTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _LessonHeader(
              courseTitle: widget.courseTitle,
              lessonTitle: widget.lessonTitle,
              lessonNumber: widget.lessonNumber,
              isCompleted: isCompleted,
            ),

            const SizedBox(height: 28),

            const _SectionLabel("What you will learn"),

            const SizedBox(height: 12),

            Text(
              widget.description,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 28),

            const _SectionLabel("Key Points"),

            const SizedBox(height: 14),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.keyPoints
                  .map(
                    (point) => _KeyPointRow(
                      text: point,
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 28),

            const _SectionLabel("Example"),

            const SizedBox(height: 14),

            _CodeBlock(
              code: widget.exampleCode,
              copied: _copied,
              onCopy: _handleCopy,
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                child: ElevatedButton(
                  onPressed: _handleComplete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCompleted
                        ? const Color(0xFF16A34A)
                        : Colors.black,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      isCompleted
                          ? "Completed ✓"
                          : "Mark as Complete",
                      key: ValueKey(isCompleted),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LessonHeader extends StatelessWidget {
  final String courseTitle;
  final String lessonTitle;
  final int lessonNumber;
  final bool isCompleted;

  const _LessonHeader({
    required this.courseTitle,
    required this.lessonTitle,
    required this.lessonNumber,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFDCFCE7),
            Color(0xFFC7F3D8),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.14),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              "$lessonNumber",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF16A34A),
                fontSize: 16,
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courseTitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF15803D),
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  lessonTitle,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          if (isCompleted)
            const Icon(
              Icons.check_circle,
              color: Color(0xFF16A34A),
              size: 24,
            ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _KeyPointRow extends StatelessWidget {
  final String text;

  const _KeyPointRow({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFF16A34A),
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeBlock extends StatelessWidget {
  final String code;
  final bool copied;
  final VoidCallback onCopy;

  const _CodeBlock({
    required this.code,
    required this.copied,
    required this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              10,
              8,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    3,
                    (index) {
                      const colors = [
                        Color(0xFFFF5F56),
                        Color(0xFFFFBD2E),
                        Color(0xFF27C93F),
                      ];

                      return Container(
                        margin: const EdgeInsets.only(right: 6),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: colors[index],
                          shape: BoxShape.circle,
                        ),
                      );
                    },
                  ),
                ),

                IconButton(
                  onPressed: onCopy,
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      copied ? Icons.check : Icons.copy,
                      key: ValueKey(copied),
                      color: copied
                          ? const Color(0xFF4ADE80)
                          : Colors.white70,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              0,
              16,
              16,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                code,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                  fontFamily: "monospace",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
