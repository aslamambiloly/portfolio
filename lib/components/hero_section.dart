import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: AppTheme.background),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: RepaintBoundary(
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix([
                  1,
                  0,
                  0,
                  0,
                  0,
                  0,
                  1,
                  0,
                  0,
                  0,
                  0,
                  0,
                  1,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0.2,
                  0,
                ]),
                child: Lottie.asset(
                  'assets/lotties/bg.json',
                  fit: BoxFit.cover,
                  frameRate: FrameRate.composition,
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
                        // Scroll to projects - handled in parent via GlobalKeys optimally or passed callback
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
                          SizedBox(width: 8),
                          Icon(LucideIcons.arrowDown, size: 16),
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

