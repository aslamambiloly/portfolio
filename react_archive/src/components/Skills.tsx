import { Badge } from "@/components/ui/badge";

const Skills = () => {
  const skillCategories = [
    {
      category: "Mobile Development",
      skills: ["Flutter", "Dart", "Android", "iOS", "Cross-platform"],
    },
    {
      category: "State Management",
      skills: ["Provider", "BLoC", "Riverpod", "GetX", "Redux"],
    },
    {
      category: "Backend & APIs",
      skills: ["Firebase", "REST API", "GraphQL", "Supabase", "Node.js"],
    },
    {
      category: "Tools & Others",
      skills: ["Git", "VS Code", "Figma", "Postman", "CI/CD"],
    },
  ];

  return (
    <section id="skills" className="py-20 px-4">
      <div className="container mx-auto max-w-6xl">
        <div className="space-y-12 animate-fade-in-up">
          <div className="text-center space-y-4">
            <h2 className="text-4xl md:text-5xl font-bold">
              <span className="text-magnify">Skills &</span>{" "}
              <span className="text-magnify custom-text-gradient">Technologies</span>
            </h2>
            <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
              Technologies and tools I work with to build amazing mobile applications
            </p>
          </div>

          <div className="grid md:grid-cols-2 gap-8">
            {skillCategories.map((category, index) => (
              <div
                key={index}
                className="custom-card rounded-2xl p-8 custom-border hover:custom-glow transition-all duration-300"
                style={{ animationDelay: `${index * 0.1}s` }}
              >
                <h3 className="text-xl font-semibold mb-6 text-primary">
                  {category.category}
                </h3>
                <div className="flex flex-wrap gap-3">
                  {category.skills.map((skill) => (
                    <Badge
                      key={skill}
                      variant="secondary"
                      className="text-base px-4 py-2 bg-black text-white hover:bg-custom-blue hover:text-white hover:scale-110 transition-all duration-300 cursor-default"
                    >
                      {skill}
                    </Badge>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};

export default Skills;
