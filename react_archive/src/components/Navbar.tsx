import { useState, useEffect } from "react";
import { Menu, X } from "lucide-react";
import { Button } from "@/components/ui/button";

const Navbar = () => {
  const [isScrolled, setIsScrolled] = useState(false);
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const [showName, setShowName] = useState(false);
  const [activeSection, setActiveSection] = useState("home");
  const [isIdle, setIsIdle] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 50);
      setShowName(window.scrollY > window.innerHeight * 0.8);

      // Detect active section based on scroll position
      const sections = ["home", "about", "projects", "skills", "contact"];
      const scrollPosition = window.scrollY + 100;

      for (const section of sections) {
        const element = document.getElementById(section);
        if (element) {
          const offsetTop = element.offsetTop;
          const offsetBottom = offsetTop + element.offsetHeight;
          
          if (scrollPosition >= offsetTop && scrollPosition < offsetBottom) {
            setActiveSection(section);
            break;
          }
        }
      }
    };
    
    handleScroll(); // Initial check
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  // Idle detection for auto fade-out
  useEffect(() => {
    let idleTimer: NodeJS.Timeout;

    const resetIdleTimer = () => {
      setIsIdle(false);
      clearTimeout(idleTimer);
      idleTimer = setTimeout(() => {
        setIsIdle(true);
      }, 3000); // Fade out after 3 seconds of inactivity
    };

    // Listen for user activity
    window.addEventListener("mousemove", resetIdleTimer);
    window.addEventListener("mousedown", resetIdleTimer);
    window.addEventListener("keypress", resetIdleTimer);
    window.addEventListener("scroll", resetIdleTimer);
    window.addEventListener("touchstart", resetIdleTimer);

    // Initialize timer
    resetIdleTimer();

    return () => {
      clearTimeout(idleTimer);
      window.removeEventListener("mousemove", resetIdleTimer);
      window.removeEventListener("mousedown", resetIdleTimer);
      window.removeEventListener("keypress", resetIdleTimer);
      window.removeEventListener("scroll", resetIdleTimer);
      window.removeEventListener("touchstart", resetIdleTimer);
    };
  }, []);

  const navLinks = [
    { name: "Home", href: "#home" },
    { name: "About", href: "#about" },
    { name: "Projects", href: "#projects" },
    { name: "Skills", href: "#skills" },
    { name: "Contact", href: "#contact" },
  ];

  return (
    <nav
      className={`fixed top-0 left-0 right-0 z-50 transition-all duration-500 ${
        isScrolled
          ? "bg-background/80 backdrop-blur-xl border-b border-border shadow-lg"
          : "bg-transparent"
      } ${
        isIdle && !isMobileMenuOpen ? "opacity-0 pointer-events-none" : "opacity-100"
      }`}
    >
      <div className="w-full px-6 lg:px-8">
        <div className="flex items-center justify-between h-16 md:h-20">
          {/* Logo */}
          <a
            href="#home"
            className="text-2xl font-bold text-white hover:scale-105 transition-transform relative inline-flex items-center"
            style={{ minWidth: '220px', height: '32px' }}
          >
            <span 
              className={`absolute inset-0 transition-all duration-700 whitespace-nowrap ${
                showName 
                  ? 'opacity-0 scale-75 blur-sm' 
                  : 'opacity-100 scale-100 blur-0'
              }`}
              style={{ 
                transform: showName ? 'translateY(-10px)' : 'translateY(0)'
              }}
            >
              Portfolio
            </span>
            <span 
              className={`absolute inset-0 transition-all duration-700 whitespace-nowrap ${
                showName 
                  ? 'opacity-100 scale-100 blur-0' 
                  : 'opacity-0 scale-75 blur-sm'
              }`}
              style={{ 
                transform: !showName ? 'translateY(10px)' : 'translateY(0)'
              }}
            >
              Mohammed Aslam
            </span>
          </a>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center gap-8">
            {navLinks.map((link) => {
              const sectionId = link.href.replace("#", "");
              const isActive = activeSection === sectionId;
              
              return (
                <a
                  key={link.name}
                  href={link.href}
                  className={`transition-colors ${
                    isActive 
                      ? "text-white" 
                      : "text-muted-foreground hover:text-primary"
                  }`}
                >
                  <span className="text-magnify">{link.name}</span>
                </a>
              );
            })}
          </div>

          {/* Mobile Menu Button */}
          <Button
            variant="ghost"
            size="icon"
            className="md:hidden text-foreground"
            onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
          >
            {isMobileMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
          </Button>
        </div>

        {/* Mobile Navigation */}
        {isMobileMenuOpen && (
          <div className="md:hidden py-4 animate-fade-in">
            <div className="flex flex-col gap-4">
              {navLinks.map((link) => {
                const sectionId = link.href.replace("#", "");
                const isActive = activeSection === sectionId;
                
                return (
                  <a
                    key={link.name}
                    href={link.href}
                    className={`transition-colors px-4 py-2 rounded-lg hover:bg-muted ${
                      isActive 
                        ? "text-white hover:text-primary" 
                        : "text-muted-foreground hover:text-primary"
                    }`}
                    onClick={() => setIsMobileMenuOpen(false)}
                  >
                    {link.name}
                  </a>
                );
              })}
            </div>
          </div>
        )}
      </div>
    </nav>
  );
};

export default Navbar;
