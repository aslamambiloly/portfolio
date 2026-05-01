import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final contactMethods = [
      {
        'icon': LucideIcons.mail,
        'label': "Email",
        'value': "your.email@example.com",
        'href': "mailto:your.email@example.com",
        'color': AppTheme.primary,
      },
      {
        'icon': LucideIcons.linkedin,
        'label': "LinkedIn",
        'value': "linkedin.com/in/yourprofile",
        'href': "https://linkedin.com/in/yourprofile",
        'color': AppTheme.secondary,
      },
      {
        'icon': LucideIcons.github,
        'label': "GitHub",
        'value': "github.com/aslamambiloly",
        'href': "https://github.com/aslamambiloly",
        'color': AppTheme.primary,
      },
      {
        'icon': LucideIcons.messageSquare,
        'label': "Discord",
        'value': "YourUsername#1234",
        'href': "#",
        'color': AppTheme.secondary,
      },
    ];

    return Container(
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 896), // max-w-4xl
          child: Column(
            children: [
              _buildHeader().animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 48),
              Card(
                elevation: 0,
                color: AppTheme.card,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: AppTheme.border),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Column(
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isDesktop = constraints.maxWidth > 500;
                          return Wrap(
                            spacing: 24,
                            runSpacing: 24,
                            children: contactMethods.map((method) {
                              return SizedBox(
                                width: isDesktop ? (constraints.maxWidth / 2) - 12 : constraints.maxWidth,
                                child: _ContactMethodCard(method: method),
                              );
                            }).toList(),
                          );
                        },
                      ),
                      const SizedBox(height: 48),
                      const Divider(color: AppTheme.border),
                      const SizedBox(height: 24),
                      const Text(
                        "Available for freelance work · Full-time employed",
                        style: TextStyle(color: AppTheme.mutedForeground),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () => launchUrl(Uri.parse('mailto:your.email@example.com')),
                        child: const Text('Send me an email', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideY(begin: 0.2, end: 0),
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
              const TextSpan(text: 'Let\'s '),
              WidgetSpan(
                child: ShaderMask(
                  shaderCallback: (bounds) => AppTheme.primaryGradient.createShader(bounds),
                  child: const Text('Connect', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "I'm currently available for freelance projects. Feel free to reach out if you want to work together!",
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

class _ContactMethodCard extends StatefulWidget {
  final Map<String, dynamic> method;

  const _ContactMethodCard({required this.method});

  @override
  State<_ContactMethodCard> createState() => _ContactMethodCardState();
}

class _ContactMethodCardState extends State<_ContactMethodCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color iconColor = widget.method['color'] as Color;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(widget.method['href'] as String)),
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white.withOpacity(0.05) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? iconColor.withOpacity(0.5) : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.muted,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  widget.method['icon'] as IconData,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.method['label'] as String,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isHovered ? iconColor : Colors.white,
                      ),
                    ),
                    Text(
                      widget.method['value'] as String,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppTheme.mutedForeground,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
