import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 896), // max-w-4xl
          child: Column(
            children: [
              _buildTitle().animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 32),
              _buildCard().animate().fadeIn(delay: 200.ms, duration: 800.ms).slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        children: [
          const TextSpan(text: 'About '),
          WidgetSpan(
            child: ShaderMask(
              shaderCallback: (bounds) => AppTheme.primaryGradient.createShader(bounds),
              child: const Text('Me', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
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
            const Text(
              "I'm a junior Flutter developer with a passion for crafting beautiful and functional mobile applications. Currently working full-time, I'm expanding my horizons by taking on freelance projects to continuously improve my skills and work on diverse challenges.",
              style: TextStyle(fontSize: 18, color: AppTheme.mutedForeground, height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              "My expertise lies in building cross-platform mobile applications using Flutter and Dart, with a focus on clean code, smooth animations, and exceptional user experiences.",
              style: TextStyle(fontSize: 18, color: AppTheme.mutedForeground, height: 1.6),
            ),
            const SizedBox(height: 32),
            LayoutBuilder(
              builder: (context, constraints) {
                final isDesktop = constraints.maxWidth > 500;
                return Flex(
                  direction: isDesktop ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: isDesktop ? 1 : 0,
                      child: _buildListColumn('What I Do', AppTheme.primary, [
                        'Cross-platform mobile app development',
                        'UI/UX implementation with Flutter',
                        'State management & architecture',
                        'API integration & backend connectivity',
                      ]),
                    ),
                    if (isDesktop) const SizedBox(width: 24) else const SizedBox(height: 24),
                    Expanded(
                      flex: isDesktop ? 1 : 0,
                      child: _buildListColumn('Currently Learning', AppTheme.secondary, [
                        'Advanced Flutter animations',
                        'Firebase & cloud solutions',
                        'Performance optimization',
                        'Testing & CI/CD',
                      ]),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListColumn(String title, Color markerColor, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: markerColor,
          ),
        ),
        const SizedBox(height: 12),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('•', style: TextStyle(color: markerColor, fontSize: 18, height: 1.2)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(
                    color: AppTheme.mutedForeground,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
