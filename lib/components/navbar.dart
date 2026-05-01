import 'package:flutter/material.dart';
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
    if (widget.scrollController.offset > 50 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (widget.scrollController.offset <= 50 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 80,
      decoration: BoxDecoration(
        color: _isScrolled ? AppTheme.background.withOpacity(0.8) : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: _isScrolled ? AppTheme.border : Colors.transparent,
          ),
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: _isScrolled
              ? ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop)
              : const ColorFilter.mode(Colors.transparent, BlendMode.dstATop),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => widget.onNavigate('home'),
                  child: Text(
                    _isScrolled ? 'Mohammed Aslam' : 'Portfolio',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                if (isDesktop)
                  Row(
                    children: [
                      _NavItem(title: 'Home', onTap: () => widget.onNavigate('home')),
                      _NavItem(title: 'About', onTap: () => widget.onNavigate('about')),
                      _NavItem(title: 'Projects', onTap: () => widget.onNavigate('projects')),
                      _NavItem(title: 'Skills', onTap: () => widget.onNavigate('skills')),
                      _NavItem(title: 'Contact', onTap: () => widget.onNavigate('contact')),
                    ],
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      // Implement mobile menu
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(
            color: AppTheme.mutedForeground,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
