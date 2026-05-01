import ProjectCard from "./ProjectCard";

const Projects = () => {
  const projects = [
    {
      title: "E-Commerce App",
      description: "A full-featured e-commerce mobile application with cart management, payment integration, and real-time order tracking. Built with Flutter and Firebase.",
      technologies: ["Flutter", "Dart", "Firebase", "Stripe", "Provider"],
      // videoUrl: "/path/to/your/video.mp4", // Add your screen recording here
      githubUrl: "https://github.com/yourusername/project",
      liveUrl: "https://yourproject.com",
    },
    {
      title: "Social Media App",
      description: "Instagram-like social media application featuring photo sharing, likes, comments, and real-time messaging. Implements clean architecture and state management.",
      technologies: ["Flutter", "Dart", "BLoC", "Firebase", "Cloud Storage"],
      // videoUrl: "/path/to/your/video.mp4",
      githubUrl: "https://github.com/yourusername/project",
    },
    {
      title: "Weather Forecast App",
      description: "Beautiful weather application with animated weather conditions, 7-day forecast, and location-based weather updates using OpenWeather API.",
      technologies: ["Flutter", "Dart", "REST API", "GetX", "Lottie"],
      // videoUrl: "/path/to/your/video.mp4",
      githubUrl: "https://github.com/yourusername/project",
      liveUrl: "https://yourproject.com",
    },
    {
      title: "Task Management App",
      description: "Productivity app with todo lists, reminders, categories, and statistics. Features include local storage, dark mode, and custom animations.",
      technologies: ["Flutter", "Dart", "Hive", "Riverpod", "Local Notifications"],
      // videoUrl: "/path/to/your/video.mp4",
      githubUrl: "https://github.com/yourusername/project",
    },
  ];

  return (
    <section id="projects" className="py-20 px-4 bg-muted/30">
      <div className="container mx-auto max-w-7xl">
        <div className="space-y-12 animate-fade-in-up">
          <div className="text-center space-y-4">
            <h2 className="text-4xl md:text-5xl font-bold">
              <span className="text-magnify">Featured</span>{" "}
              <span className="text-magnify custom-text-gradient">Projects</span>
            </h2>
            <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
              Here are some of my recent Flutter projects. Hover over the cards to see the apps in action.
            </p>
          </div>

          <div className="grid md:grid-cols-2 gap-8">
            {projects.map((project, index) => (
              <div
                key={index}
                className="animate-fade-in-up"
                style={{ animationDelay: `${index * 0.1}s` }}
              >
                <ProjectCard {...project} />
              </div>
            ))}
          </div>

          <div className="text-center pt-8">
            <p className="text-muted-foreground">
              Want to see more? Check out my{" "}
              <a
                href="https://github.com/yourusername"
                target="_blank"
                rel="noopener noreferrer"
                className="text-primary hover:text-secondary underline underline-offset-4 transition-colors"
              >
                GitHub profile
              </a>
            </p>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Projects;
