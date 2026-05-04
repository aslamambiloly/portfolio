import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';

class NavBar extends StatefulWidget {
  final ScrollController scrollController;
  final Function(String) onNavigate;

  const NavBar({super.key, required this.scrollController, required this.onNavigate});

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
                children: [
                  Image.asset('assets/images/aslam.png', height: 30, width: 30),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () => widget.onNavigate('home'),
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: FontOptions.ubuntuMedium.name,
                        color: Colors.white,
                      ),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Text(_isScrolled ? 'Mohammed Aslam' : 'Portfolio'),
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
                      onTap: () => widget.onNavigate('home'),
                    ),
                    _NavItem(
                      title: 'About',
                      onTap: () => widget.onNavigate('about'),
                    ),
                    _NavItem(
                      title: 'Projects',
                      onTap: () => widget.onNavigate('projects'),
                    ),
                    _NavItem(
                      title: 'Skills',
                      onTap: () => widget.onNavigate('skills'),
                    ),
                    _NavItem(
                      title: 'Contact',
                      onTap: () => widget.onNavigate('contact'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
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


class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(
            color: AppTheme.mutedForeground,
            fontSize: 16,
            fontFamily: FontOptions.ubuntuRegular.name,
          ),
        ),
      ),
    );
  }
}
