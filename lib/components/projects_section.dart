import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> projects = [
      {
        'title': "E-Commerce App",
        'description': "A full-featured e-commerce mobile application with cart management, payment integration, and real-time order tracking. Built with Flutter and Firebase.",
        'technologies': ["Flutter", "Dart", "Firebase", "Stripe", "Provider"],
        'githubUrl': "https://github.com/yourusername/project",
        'liveUrl': "https://yourproject.com",
      },
      {
        'title': "Social Media App",
        'description': "Instagram-like social media application featuring photo sharing, likes, comments, and real-time messaging. Implements clean architecture and state management.",
        'technologies': ["Flutter", "Dart", "BLoC", "Firebase", "Cloud Storage"],
        'githubUrl': "https://github.com/yourusername/project",
      },
      {
        'title': "Weather Forecast App",
        'description': "Beautiful weather application with animated weather conditions, 7-day forecast, and location-based weather updates using OpenWeather API.",
        'technologies': ["Flutter", "Dart", "REST API", "GetX", "Lottie"],
        'githubUrl': "https://github.com/yourusername/project",
        'liveUrl': "https://yourproject.com",
      },
      {
        'title': "Task Management App",
        'description': "Productivity app with todo lists, reminders, categories, and statistics. Features include local storage, dark mode, and custom animations.",
        'technologies': ["Flutter", "Dart", "Hive", "Riverpod", "Local Notifications"],
        'githubUrl': "https://github.com/yourusername/project",
      },
    ];

    return Container(
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1152),
          child: Column(
            children: [
              _buildHeader().animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 48),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth > 768;
                  return Wrap(
                    spacing: 32,
                    runSpacing: 32,
                    alignment: WrapAlignment.center,
                    children: projects.asMap().entries.map((entry) {
                      return SizedBox(
                        width: isDesktop ? (constraints.maxWidth / 2) - 16 : constraints.maxWidth,
                        child: _ProjectCard(project: entry.value)
                            .animate()
                            .fadeIn(delay: (entry.key * 100).ms, duration: 800.ms)
                            .slideY(begin: 0.1, end: 0),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 48),
              TextButton(
                onPressed: () => launchUrl(Uri.parse('https://github.com/aslamambiloly')),
                child: const Text(
                  'Want to see more? Check out my GitHub profile',
                  style: TextStyle(
                    color: AppTheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            children: [
              const TextSpan(text: 'Featured '),
              WidgetSpan(
                child: ShaderMask(
                  shaderCallback: (bounds) => AppTheme.primaryGradient.createShader(bounds),
                  child: const Text('Projects', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Here are some of my recent Flutter projects.",
          style: TextStyle(
            fontSize: 18,
            color: AppTheme.mutedForeground,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        decoration: BoxDecoration(
          color: _isHovered ? AppTheme.cardHover : AppTheme.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppTheme.primary.withOpacity(0.5) : AppTheme.border,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: AppTheme.primary.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.project['title'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.project['description'],
                style: const TextStyle(
                  fontSize: 16,
                  color: AppTheme.mutedForeground,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: (widget.project['technologies'] as List<String>).map((tech) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.muted,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      tech,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  if (widget.project['githubUrl'] != null)
                    IconButton(
                      icon: const Icon(LucideIcons.github),
                      color: Colors.white,
                      onPressed: () => _launchUrl(widget.project['githubUrl']),
                    ),
                  if (widget.project['liveUrl'] != null)
                    IconButton(
                      icon: const Icon(LucideIcons.externalLink),
                      color: Colors.white,
                      onPressed: () => _launchUrl(widget.project['liveUrl']),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
