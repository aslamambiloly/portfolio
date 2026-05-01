import { Button } from "@/components/ui/button";
import { Github, Linkedin, Mail, ArrowDown } from "lucide-react";
import flutterLogo from "@/assets/flutter-logo.svg";
import dartLogo from "@/assets/dart-logo.svg";
import firebaseLogo from "@/assets/firebase-logo.svg";
import xcodeLogo from "@/assets/xcode-logo.svg";
import androidStudioLogo from "@/assets/androidstudio-logo.svg";
import riverpodLogo from "@/assets/riverpod-logo.svg";
import vscodeLogo from "@/assets/vscode-logo.svg";
import gitLogo from "@/assets/git-logo.svg";
import awsLogo from "@/assets/aws-logo.svg";
import materialLogo from "@/assets/material-logo.svg";
import figmaLogo from "@/assets/figma-logo.svg";
import githubLogo from "@/assets/github-logo.svg";
import { useBubblePhysics } from "@/hooks/useBubblePhysics";

const bubbleConfigs = [
  { id: 'flutter', size: 80, logo: flutterLogo, startX: 0, startY: 0, direction: 'lr' as const },
  { id: 'dart', size: 48, logo: dartLogo, startX: 0, startY: 0, direction: 'tb' as const },
  { id: 'firebase', size: 64, logo: firebaseLogo, startX: 0, startY: 0, direction: 'rl' as const },
  { id: 'xcode', size: 40, logo: xcodeLogo, startX: 0, startY: 0, direction: 'bt' as const },
  { id: 'androidstudio', size: 56, logo: androidStudioLogo, startX: 0, startY: 0, direction: 'd1' as const },
  { id: 'riverpod', size: 32, logo: riverpodLogo, startX: 0, startY: 0, direction: 'lr' as const },
  { id: 'vscode', size: 44, logo: vscodeLogo, startX: 0, startY: 0, direction: 'd2' as const },
  { id: 'git', size: 36, logo: gitLogo, startX: 0, startY: 0, direction: 'tb' as const },
  { id: 'aws', size: 32, logo: awsLogo, startX: 0, startY: 0, direction: 'rl' as const },
  { id: 'material', size: 40, logo: materialLogo, startX: 0, startY: 0, direction: 'bt' as const },
  { id: 'figma', size: 36, logo: figmaLogo, startX: 0, startY: 0, direction: 'd1' as const },
  { id: 'github', size: 48, logo: githubLogo, startX: 0, startY: 0, direction: 'd2' as const },
];

const Hero = () => {
  const bubbles = useBubblePhysics(bubbleConfigs);
  return (
    <section id="home" className="min-h-screen flex items-center justify-center relative overflow-hidden">
      {/* Animated background gradient */}
      <div className="absolute inset-0 bg-gradient-to-br from-primary/10 via-background to-secondary/10 animate-glow-pulse" />
      
      <div className="container mx-auto px-4 relative z-10">
        <div className="max-w-4xl mx-auto text-center space-y-8 animate-fade-in">
          <div className="space-y-4">
            <h1 className="text-5xl md:text-7xl font-bold">
              <span className="text-magnify font-light">hello, I'm</span>{" "}
              <span className="text-magnify custom-text-gradient">Mohammed Aslam</span>
            </h1>
            <h2 className="text-2xl md:text-4xl text-muted-foreground my-8 flex flex-wrap items-center justify-center gap-1">
              <span className="text-magnify subtitle-text">
                the
              </span>
              <span className="text-magnify">Flutter Developer</span>
              <span className="text-magnify subtitle-text">
                you need right now
              </span>
            </h2>
          </div>
          
          <div className="flex flex-wrap gap-4 justify-center">
            <Button
              size="lg"
              className="
    bg-white 
    text-gray-900 
    hover:bg-gray-900 
    hover:text-white 
    border 
    border-gray-900 
    transition-colors 
    duration-300 
    group
  "
            >
              <a href="#projects" className="flex items-center gap-2">
                View Projects
                <ArrowDown className="w-4 h-4 transition-transform group-hover:translate-y-1" />
              </a>
            </Button>

            <Button 
              size="lg" 
              variant="outline"
              className="border-white text-white hover:bg-white hover:text-gray-900 custom-glow-purple"
            >
              <a href="#contact">Get in Touch</a>
            </Button>
          </div>

          <div className="flex gap-6 justify-center pt-8">
            <a 
              href="https://github.com" 
              target="_blank" 
              rel="noopener noreferrer"
              className="text-muted-foreground hover:text-primary transition-colors hover:scale-110 transform duration-300"
            >
              <Github className="w-6 h-6" />
            </a>
            <a 
              href="https://linkedin.com" 
              target="_blank" 
              rel="noopener noreferrer"
              className="text-muted-foreground hover:text-primary transition-colors hover:scale-110 transform duration-300"
            >
              <Linkedin className="w-6 h-6" />
            </a>
            <a 
              href="mailto:your.email@example.com"
              className="text-muted-foreground hover:text-primary transition-colors hover:scale-110 transform duration-300"
            >
              <Mail className="w-6 h-6" />
            </a>
          </div>
        </div>
      </div>

      {/* Floating tech logos in bubbles - With collision physics */}
      {bubbles.map((bubble) => (
        <div
          key={bubble.id}
          className="absolute border-2 border-primary/30 rounded-full flex items-center justify-center transition-opacity duration-300 pointer-events-none"
          style={{
            left: `${bubble.x + bubble.floatOffset.x}px`,
            top: `${bubble.y + bubble.floatOffset.y}px`,
            width: `${bubble.size}px`,
            height: `${bubble.size}px`,
            opacity: bubble.opacity,
            transform: 'translate(-50%, -50%)',
          }}
        >
          <img 
            src={bubble.logo} 
            alt={bubble.id} 
            className="w-full h-full p-2 hover:opacity-100 transition-opacity duration-500" 
          />
        </div>
      ))}
    </section>
  );
};

export default Hero;
