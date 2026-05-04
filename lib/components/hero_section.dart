import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        animate = true;
      });
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
            child: Opacity(
              opacity: 0.2,
              child: Image.asset('assets/images/bg.gif', fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.transparent, AppTheme.background],
                  center: Alignment.center,
                  radius: 0.5,
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
                  strutStyle: StrutStyle(height: 2, forceStrutHeight: true),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "I'm ",
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: FontOptions.ubuntuLight.name,
                          letterSpacing: 0,
                          color: Colors.white70,
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

                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 1200),
                          curve: Curves.fastOutSlowIn,
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: animate ? null : 0,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 1000),
                              opacity: animate ? 1.0 : 0.0,
                              child: Text(
                                "the ",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white70,
                                  fontFamily: FontOptions.ubuntuLight.name,
                                ),
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: ShaderMask(
                          shaderCallback: (bounds) =>
                              AppTheme.primaryGradient.createShader(bounds),
                          child: Text(
                            "Flutter Developer",
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: FontOptions.ubuntuMedium.name,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 1200),
                          curve: Curves.fastOutSlowIn,
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: animate ? null : 0,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 1000),
                              opacity: animate ? 1.0 : 0.0,
                              child: Text(
                                " you need right now.",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white70,
                                  fontFamily:
                                      FontOptions.ubuntuLightItalic.name,
                                ),
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(50),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 26,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              gradient: AppTheme.primaryGradient,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      // TextSpan(
                                      //   text: 'View '.toUpperCase(),
                                      //   style: TextStyle(
                                      //     fontSize: 16,
                                      //     fontFamily:
                                      //         FontOptions.ubuntuRegular.name,
                                      //     color: Colors.black,
                                      //   ),
                                      // ),
                                      TextSpan(
                                        text: 'Projects'.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily:
                                              FontOptions.ubuntuBold.name,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Material(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            // gradient: AppTheme.primaryGradient,
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppTheme.primary),
                          ),
                          child: Row(
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Contact'.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: FontOptions.ubuntuBold.name,
                                        color: AppTheme.primary,
                                      ),
                                    ),
                                    // TextSpan(
                                    //   text: ' Me'.toUpperCase(),
                                    //   style: TextStyle(
                                    //     fontSize: 16,
                                    //     fontFamily:
                                    //         FontOptions.ubuntuRegular.name,
                                    //     color: AppTheme.primary,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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

