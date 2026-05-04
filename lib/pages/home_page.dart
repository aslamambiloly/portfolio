import 'package:curved_navigation_bar_pro/curved_navigation_bar_pro.dart';
import 'package:flutter/material.dart';
import '../components/navbar.dart';
import '../components/hero_section.dart';
import '../components/about_section.dart';
import '../components/projects_section.dart';
import '../components/skills_section.dart';
import '../components/contact_section.dart';
import '../components/footer_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool animate = false;
  final ScrollController _scrollController = ScrollController();

  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'projects': GlobalKey(),
    'skills': GlobalKey(),
    'contact': GlobalKey(),
  };

  void _scrollToSection(String sectionId) {
    final key = _sectionKeys[sectionId];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    } else if (sectionId == 'home') {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                ConstrainedBox(
                  key: _sectionKeys['home'],
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: HeroSection(
                    animate: (a) => setState(() {
                      animate = a;
                    }),
                  ),
                ),
                Container(
                  key: _sectionKeys['about'],
                  child: const AboutSection(),
                ),
                Container(
                  key: _sectionKeys['projects'],
                  child: const ProjectsSection(),
                ),
                Container(
                  key: _sectionKeys['skills'],
                  child: const SkillsSection(),
                ),
                Container(
                  key: _sectionKeys['contact'],
                  child: const ContactSection(),
                ),
                const FooterSection(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: animate ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
              child: NavBar(
                scrollController: _scrollController,
                onNavigate: _scrollToSection,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
