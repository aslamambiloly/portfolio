const About = () => {
  return (
    <section id="about" className="py-20 px-4">
      <div className="container mx-auto max-w-4xl">
        <div className="space-y-8 animate-fade-in-up">
          <h2 className="text-4xl md:text-5xl font-bold text-center">
            <span className="text-magnify">About</span>{" "}
            <span className="text-magnify custom-text-gradient">Me</span>
          </h2>
          
          <div className="custom-card rounded-2xl p-8 custom-border hover:custom-glow transition-all duration-300">
            <p className="text-lg text-muted-foreground leading-relaxed mb-6">
              I'm a junior Flutter developer with a passion for crafting beautiful and functional mobile applications. 
              Currently working full-time, I'm expanding my horizons by taking on freelance projects to continuously 
              improve my skills and work on diverse challenges.
            </p>
            
            <p className="text-lg text-muted-foreground leading-relaxed mb-6">
              My expertise lies in building cross-platform mobile applications using Flutter and Dart, with a focus 
              on clean code, smooth animations, and exceptional user experiences.
            </p>

            <div className="grid md:grid-cols-2 gap-6 mt-8">
              <div className="space-y-3">
                <h3 className="text-xl font-semibold text-primary">What I Do</h3>
                <ul className="space-y-2 text-muted-foreground">
                  <li className="flex items-start gap-2">
                    <span className="text-secondary mt-1">•</span>
                    <span>Cross-platform mobile app development</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-secondary mt-1">•</span>
                    <span>UI/UX implementation with Flutter</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-secondary mt-1">•</span>
                    <span>State management & architecture</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-secondary mt-1">•</span>
                    <span>API integration & backend connectivity</span>
                  </li>
                </ul>
              </div>

              <div className="space-y-3">
                <h3 className="text-xl font-semibold text-secondary">Currently Learning</h3>
                <ul className="space-y-2 text-muted-foreground">
                  <li className="flex items-start gap-2">
                    <span className="text-primary mt-1">•</span>
                    <span>Advanced Flutter animations</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-primary mt-1">•</span>
                    <span>Firebase & cloud solutions</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-primary mt-1">•</span>
                    <span>Performance optimization</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-primary mt-1">•</span>
                    <span>Testing & CI/CD</span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default About;
