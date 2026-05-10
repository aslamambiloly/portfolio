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
  String _activeSection = 'home';

  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'projects': GlobalKey(),
    'skills': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    String currentSection = 'home';
    for (var entry in _sectionKeys.entries) {
      final key = entry.value;
      if (key.currentContext != null) {
        final renderBox = key.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero);
          final double top = position.dy;
          final double bottom = top + renderBox.size.height;
          // Use a fixed value for screenHeight or calculate it. We'll use 500 as an approximate mid-point if context is an issue, but we can safely assume it's visible if top is above half screen and bottom is below half screen.
          // Since we can't reliably use MediaQuery in a scroll listener without context, we check if top is <= 300 and bottom > 300.
          if (top <= 300 && bottom > 300) {
            currentSection = entry.key;
            break;
          }
        }
      }
    }

    if (_activeSection != currentSection) {
      setState(() {
        _activeSection = currentSection;
      });
    }
  }

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
    _scrollController.removeListener(_onScroll);
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
                    onNavigate: (s) {
                      _scrollToSection(s);
                    },
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
                activeSection: _activeSection,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
