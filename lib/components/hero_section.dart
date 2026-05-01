import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import 'dart:math';

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
            child: Opacity(
              opacity: 0.2,
              child: Lottie.asset('assets/lotties/bg.json', fit: BoxFit.cover),
            ),
          ),

          // Image.asset('assets/images/bg.png'),
          // Background Gradient (Glow Pulse effect from CSS)
          Positioned.fill(
            child:
                Container(
                      decoration: const BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            Color(0x1A0C87F2), // Primary/10
                            Color(0x00000000), // Transparent
                          ],
                          radius: 1.0,
                        ),
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .fade(duration: 4.seconds),
          ),

          // Bubbles
          // ..._bubbles.map((bubble) => _buildBubble(bubble)),

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
                    )
                    .animate()
                    .fadeIn(duration: 1.seconds)
                    .slideY(begin: 0.2, end: 0),
                const Text(
                      "the Flutter Developer you need right now",
                      style: TextStyle(
                        fontSize: 24,
                        color: AppTheme.mutedForeground,
                      ),
                      textAlign: TextAlign.center,
                    )
                    .animate()
                    .fadeIn(delay: 500.ms, duration: 800.ms)
                    .slideY(begin: 0.2, end: 0),
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Scroll to projects - handled in parent via GlobalKeys optimally or passed callback
                      },
                      child: const Row(
                        children: [
                          Text('View Projects', style: TextStyle(fontSize: 16)),
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
                          borderRadius: BorderRadius.circular(8),
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
                ).animate().fadeIn(delay: 1.seconds, duration: 800.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//   Widget _buildBubble(_BubbleConfig bubble) {
//     // Generate some random deterministic position
//     final random = Random(bubble.id.hashCode);
//     final top = random.nextDouble() * 500 + 100;
//     final left = random.nextDouble() * 800 + 100;

//     return Positioned(
//       top: top,
//       left: left,
//       child:
//           Container(
//                 width: bubble.size,
//                 height: bubble.size,
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: AppTheme.primary.withValues(alpha: 0.3),
//                     width: 2,
//                   ),
//                 ),
//                 child: SvgPicture.asset(
//                   bubble.assetPath,
//                   fit: BoxFit.contain,
//                   placeholderBuilder: (context) =>
//                       const Icon(Icons.code, color: AppTheme.primary),
//                 ),
//               )
//               .animate(onPlay: (controller) => controller.repeat(reverse: true))
//               .moveY(
//                 begin: -10,
//                 end: 10,
//                 duration: (random.nextInt(2000) + 2000).ms,
//                 curve: Curves.easeInOut,
//               ),
//     );
//   }
// }

// class _BubbleConfig {
//   final String id;
//   final double size;
//   final String assetPath;

//   _BubbleConfig(this.id, this.size, this.assetPath);
// }
