import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class NavBar extends StatefulWidget {
  final ScrollController scrollController;
  final Function(String) onNavigate;
  final String activeSection;

  const NavBar({
    super.key,
    required this.scrollController,
    required this.onNavigate,
    this.activeSection = 'home',
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (widget.scrollController.offset > 100 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (widget.scrollController.offset <= 100 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return wrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                spacing: 10,
                children: [
                  // Image.asset('assets/images/aslam.png', height: 30, width: 30),
                  InkWell(
                    onTap: () => widget.onNavigate('home'),

                    child: AnimatedCrossFade(
                      crossFadeState: _isScrolled
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 300),
                      firstChild: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Mohammed ',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: FontOptions.ubuntuMedium.name,
                                color: Colors.white70,
                              ),
                            ),
                            TextSpan(
                              text: 'Aslam',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: FontOptions.ubuntuMedium.name,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      secondChild: Text(
                        'Portfolio',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: FontOptions.ubuntuMedium.name,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isDesktop)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _NavItem(
                      title: 'Home',
                      isActive: widget.activeSection == 'home',
                      onTap: () => widget.onNavigate('home'),
                    ),
                    _NavItem(
                      title: 'About',
                      isActive: widget.activeSection == 'about',
                      onTap: () => widget.onNavigate('about'),
                    ),
                    _NavItem(
                      title: 'Projects',
                      isActive: widget.activeSection == 'projects',
                      onTap: () => widget.onNavigate('projects'),
                    ),
                    _NavItem(
                      title: 'Skills',
                      isActive: widget.activeSection == 'skills',
                      onTap: () => widget.onNavigate('skills'),
                    ),
                    _NavItem(
                      title: 'Contact',
                      isActive: widget.activeSection == 'contact',
                      onTap: () => widget.onNavigate('contact'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(
                          'assets/resume.pdf',
                        ); // Update this path or URL as needed
                        if (!await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        )) {
                          debugPrint('Could not launch $url');
                        }
                      },
                      child: Row(
                        spacing: 5,
                        children: [
                          
                          Text(
                            'Resume',
                            style: TextStyle(
                              color: AppTheme.primary,
                              fontSize: 16,
                              fontFamily: FontOptions.ubuntuRegular.name,
                            ),
                          ),
                          Icon(
                            LucideIcons.download,
                            color: AppTheme.primary,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            else
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  // Implement mobile menu
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget wrapper({required Widget child}) => AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 80,
    // margin: const .all(10),
    decoration: BoxDecoration(
      color: AppTheme.background.withValues(alpha: 0.2),
    ),
    child: ClipRRect(
      child: BackdropFilter(
        // filter: _isScrolled
        //     // ? ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop)
        //     ? ImageFilter.blur(sigmaX: 10, sigmaY: 10)
        //     : const ColorFilter.mode(Colors.transparent, BlendMode.dstATop),
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: child,
      ),
    ),
  );
}

class _NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const _NavItem({
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  State<_NavItem> createState() => __NavItemState();
}

class __NavItemState extends State<_NavItem> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: .circular(25),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: widget.onTap,
        borderRadius: .circular(25),

        onHover: (value) {
          setState(() {
            _isSelected = value;
          });
        },

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            style: TextStyle(
              color: _isSelected || widget.isActive
                  ? AppTheme.foreground
                  : Colors.white70,
              fontSize: 16,
              fontFamily: FontOptions.ubuntuRegular.name,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
