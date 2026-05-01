import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Mail, Linkedin, Github, MessageSquare } from "lucide-react";

const Contact = () => {
  const contactMethods = [
    {
      icon: Mail,
      label: "Email",
      value: "your.email@example.com",
      href: "mailto:your.email@example.com",
      color: "text-primary",
    },
    {
      icon: Linkedin,
      label: "LinkedIn",
      value: "linkedin.com/in/yourprofile",
      href: "https://linkedin.com/in/yourprofile",
      color: "text-secondary",
    },
    {
      icon: Github,
      label: "GitHub",
      value: "github.com/yourusername",
      href: "https://github.com/yourusername",
      color: "text-primary",
    },
    {
      icon: MessageSquare,
      label: "Discord",
      value: "YourUsername#1234",
      href: "#",
      color: "text-secondary",
    },
  ];

  return (
    <section id="contact" className="py-20 px-4 bg-muted/30">
      <div className="container mx-auto max-w-4xl">
        <div className="space-y-12 animate-fade-in-up">
          <div className="text-center space-y-4">
            <h2 className="text-4xl md:text-5xl font-bold">
              <span className="text-magnify">Let's</span>{" "}
              <span className="text-magnify custom-text-gradient">Connect</span>
            </h2>
            <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
              I'm currently available for freelance projects. Feel free to reach out if you want to work together!
            </p>
          </div>

          <Card className="custom-card p-8 md:p-12">
            <div className="grid md:grid-cols-2 gap-6">
              {contactMethods.map((method, index) => {
                const Icon = method.icon;
                return (
                  <a
                    key={index}
                    href={method.href}
                    target={method.href.startsWith("http") ? "_blank" : undefined}
                    rel={method.href.startsWith("http") ? "noopener noreferrer" : undefined}
                    className="flex items-start gap-4 p-4 rounded-xl hover:bg-muted/50 transition-all duration-300 group custom-border hover:custom-glow"
                  >
                    <div className={`${method.color} p-3 rounded-lg bg-muted group-hover:glow-primary transition-all duration-300`}>
                      <Icon className="w-6 h-6" />
                    </div>
                    <div className="flex-1">
                      <p className="font-semibold text-foreground group-hover:text-primary transition-colors">
                        {method.label}
                      </p>
                      <p className="text-sm text-muted-foreground break-all">
                        {method.value}
                      </p>
                    </div>
                  </a>
                );
              })}
            </div>

            <div className="mt-12 text-center space-y-6">
              <div className="h-px bg-border" />
              <p className="text-muted-foreground">
                Available for freelance work · Full-time employed
              </p>
              <Button
                size="lg"
                className="bg-white hover:bg-gray-100 text-gray-900 custom-glow"
              >
                <a href="mailto:your.email@example.com">Send me an email</a>
              </Button>
            </div>
          </Card>
        </div>
      </div>
    </section>
  );
};

export default Contact;
