import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _lottieController;
  Timer? _idleTimer;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _idleTimer?.cancel();
    _lottieController.dispose();
    super.dispose();
  }

  void _onCursorMove() {
    // Resume animation when cursor moves
    if (!_lottieController.isAnimating) {
      _lottieController.repeat();
    }
    // Reset the idle timer — pause after 1.5s of no cursor movement
    _idleTimer?.cancel();
    _idleTimer = Timer(const Duration(milliseconds: 1500), () {
      if (mounted) _lottieController.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: AppTheme.background),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: MouseRegion(
              onHover: (_) => _onCursorMove(),
              child: RepaintBoundary(
                child: ColorFiltered(
                  colorFilter: ColorFilter.matrix([
                    1, 0, 0, 0, 0,
                    0, 1, 0, 0, 0,
                    0, 0, 1, 0, 0,
                    0, 0, 0, 0.2, 0,
                  ]),
                  child: Lottie.asset(
                    'assets/lotties/bg.json',
                    fit: BoxFit.cover,
                    frameRate: FrameRate.composition,
                    controller: _lottieController,
                    onLoaded: (composition) {
                      // Bind duration from the JSON; start paused
                      _lottieController.duration = composition.duration;
                    },
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "hello, ",
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: FontOptions.ubuntuLightItalic.name,
                          letterSpacing: 0,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: "I'm ",
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: FontOptions.ubuntuLight.name,
                          letterSpacing: 0,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: "Mohammed Aslam",
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: 'ubuntuBold',
                          letterSpacing: 0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  "the Flutter Developer you need right now",
                  style: TextStyle(
                    fontSize: 32,
                    color: AppTheme.mutedForeground,
                    fontFamily: FontOptions.ubuntuRegular.name,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        // Scroll to projects
                      },
                      child: Row(
                        children: [
                          Text(
                            'View Projects',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: FontOptions.ubuntuRegular.name,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(LucideIcons.arrowDown, size: 16),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        // Scroll to contact
                      },
                      child: const Text(
                        'Get in Touch',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
