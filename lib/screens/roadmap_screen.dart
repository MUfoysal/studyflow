import 'package:flutter/material.dart';

class RoadmapStep {
  final String number;
  final String title;
  final String subtitle;
  final bool completed;

  const RoadmapStep({
    required this.number,
    required this.title,
    required this.subtitle,
    this.completed = false,
  });
}

class RoadmapScreen extends StatelessWidget {
  const RoadmapScreen({super.key});

  static const List<RoadmapStep> _steps = [
    RoadmapStep(
      number: "01",
      title: "Dart Programming",
      subtitle: "Learn the fundamentals of Dart.",
    ),
    RoadmapStep(
      number: "02",
      title: "Flutter Basics",
      subtitle: "Learn widgets and build Flutter UI.",
    ),
    RoadmapStep(
      number: "03",
      title: "Git & GitHub",
      subtitle: "Learn version control and collaboration.",
    ),
  ];

  void _onStepTap(
    BuildContext context,
    RoadmapStep step,
  ) {
    Navigator.of(context).pushNamed(
      '/roadmap-detail',
      arguments: step,
    );
  }

  @override
  Widget build(BuildContext context) {
    final completedCount =
        _steps.where((step) => step.completed).length;

    final progress = _steps.isEmpty
        ? 0.0
        : completedCount / _steps.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: const Text("Roadmap"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(
          16,
          8,
          16,
          24,
        ),
        itemCount: _steps.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _RoadmapHeader(
              progress: progress,
              completedCount: completedCount,
              total: _steps.length,
            );
          }

          final stepIndex = index - 1;
          final step = _steps[stepIndex];
          final isLast = stepIndex == _steps.length - 1;

          return _AnimatedEntry(
            delayMs: stepIndex * 90,
            child: _RoadmapCard(
              step: step,
              showConnector: !isLast,
              onTap: () => _onStepTap(
                context,
                step,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _RoadmapHeader extends StatelessWidget {
  final double progress;
  final int completedCount;
  final int total;

  const _RoadmapHeader({
    required this.progress,
    required this.completedCount,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [
                  Color(0xFF16A34A),
                  Color(0xFF15803D),
                ],
              ).createShader(bounds);
            },
            child: Text(
              "Flutter Developer Roadmap 🚀",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.5,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Follow the roadmap step by step and build your Flutter development skills.",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade600,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 0,
                      end: progress,
                    ),
                    duration: const Duration(
                      milliseconds: 800,
                    ),
                    curve: Curves.easeOutCubic,
                    builder: (
                      context,
                      value,
                      _,
                    ) {
                      return LinearProgressIndicator(
                        value: value,
                        minHeight: 8,
                        backgroundColor:
                            const Color(0xFFE5F5EC),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(
                          Color(0xFF16A34A),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Text(
                "$completedCount/$total",
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF15803D),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnimatedEntry extends StatefulWidget {
  final Widget child;
  final int delayMs;

  const _AnimatedEntry({
    required this.child,
    required this.delayMs,
  });

  @override
  State<_AnimatedEntry> createState() =>
      _AnimatedEntryState();
}

class _AnimatedEntryState extends State<_AnimatedEntry>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 420,
      ),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    Future.delayed(
      Duration(milliseconds: widget.delayMs),
      () {
        if (mounted) {
          _controller.forward();
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}

class _RoadmapCard extends StatelessWidget {
  final RoadmapStep step;
  final bool showConnector;
  final VoidCallback onTap;

  const _RoadmapCard({
    required this.step,
    required this.showConnector,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline rail
          Column(
            children: [
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: step.completed
                      ? Colors.green
                      : Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),

              if (showConnector)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          step.completed
                              ? Colors.green.shade300
                              : Colors.grey.shade300,
                          Colors.grey.shade200,
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 14,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(18),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: onTap,
                  splashColor:
                      Colors.green.withOpacity(0.08),
                  highlightColor:
                      Colors.green.withOpacity(0.04),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient:
                                const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFDCFCE7),
                                Color(0xFFBBF7D0),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green
                                    .withOpacity(0.15),
                                blurRadius: 8,
                                offset:
                                    const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: step.completed
                              ? const Icon(
                                  Icons.check_rounded,
                                  color: Colors.green,
                                  size: 22,
                                )
                              : Text(
                                  step.number,
                                  style:
                                      const TextStyle(
                                    color: Colors.green,
                                    fontWeight:
                                        FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                        ),

                        const SizedBox(width: 18),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                step.title,
                                style: theme
                                    .textTheme.titleMedium
                                    ?.copyWith(
                                  fontWeight:
                                      FontWeight.bold,
                                  letterSpacing: -0.2,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                step.subtitle,
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      Colors.grey.shade600,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
