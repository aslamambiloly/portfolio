import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.background,
        border: Border(
          top: BorderSide(color: AppTheme.border),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 768;
          
          if (isDesktop) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBrand(),
                _buildSocialLinks(),
                _buildCopyright(currentYear),
              ],
            );
          } else {
            return Column(
              children: [
                _buildBrand(),
                const SizedBox(height: 24),
                _buildSocialLinks(),
                const SizedBox(height: 24),
                _buildCopyright(currentYear),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildBrand() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mohammed Aslam',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Flutter Developer',
          style: TextStyle(
            fontSize: 14,
            color: AppTheme.mutedForeground,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(LucideIcons.github),
          color: AppTheme.mutedForeground,
          hoverColor: AppTheme.primary,
          onPressed: () => _launchUrl('https://github.com/aslamambiloly'),
        ),
        IconButton(
          icon: const Icon(LucideIcons.linkedin),
          color: AppTheme.mutedForeground,
          hoverColor: AppTheme.primary,
          onPressed: () => _launchUrl('https://linkedin.com/'), // Replace with actual LinkedIn
        ),
        IconButton(
          icon: const Icon(LucideIcons.mail),
          color: AppTheme.mutedForeground,
          hoverColor: AppTheme.primary,
          onPressed: () => _launchUrl('mailto:your.email@example.com'), // Replace with actual email
        ),
      ],
    );
  }

  Widget _buildCopyright(int year) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '© $year Made with ',
          style: TextStyle(
            fontSize: 14,
            color: AppTheme.mutedForeground,
          ),
        ),
        const Icon(
          LucideIcons.heart,
          size: 16,
          color: AppTheme.accent,
        ),
        Text(
          ' using Flutter',
          style: TextStyle(
            fontSize: 14,
            color: AppTheme.mutedForeground,
          ),
        ),
      ],
    );
  }
}
