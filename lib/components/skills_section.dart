import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skillCategories = [
      {
        'category': "Mobile Development",
        'skills': ["Flutter", "Dart", "Android", "iOS", "Cross-platform"],
      },
      {
        'category': "State Management",
        'skills': ["Provider", "BLoC", "Riverpod", "GetX", "Redux"],
      },
      {
        'category': "Backend & APIs",
        'skills': ["Firebase", "REST API", "GraphQL", "Supabase", "Node.js"],
      },
      {
        'category': "Tools & Others",
        'skills': ["Git", "VS Code", "Figma", "Postman", "CI/CD"],
      },
    ];

    return Container(
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1152), // max-w-6xl
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
                    children: skillCategories.asMap().entries.map((entry) {
                      return SizedBox(
                        width: isDesktop ? (constraints.maxWidth / 2) - 16 : constraints.maxWidth,
                        child: _buildSkillCard(
                          entry.value['category'] as String,
                          entry.value['skills'] as List<String>,
                        ).animate().fadeIn(delay: (entry.key * 100).ms, duration: 800.ms).slideY(begin: 0.1, end: 0),
                      );
                    }).toList(),
                  );
                },
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
              const TextSpan(text: 'Skills & '),
              WidgetSpan(
                child: ShaderMask(
                  shaderCallback: (bounds) => AppTheme.primaryGradient.createShader(bounds),
                  child: const Text('Technologies', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Technologies and tools I work with to build amazing mobile applications",
          style: TextStyle(
            fontSize: 18,
            color: AppTheme.mutedForeground,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSkillCard(String category, List<String> skills) {
    return Card(
      elevation: 0,
      color: AppTheme.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppTheme.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppTheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: skills.map((skill) => _buildBadge(skill)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String skill) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        skill,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
