import { useState } from "react";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { ExternalLink, Github } from "lucide-react";

interface ProjectCardProps {
  title: string;
  description: string;
  videoUrl?: string;
  imageUrl?: string;
  technologies: string[];
  githubUrl?: string;
  liveUrl?: string;
}

const ProjectCard = ({
  title,
  description,
  videoUrl,
  imageUrl,
  technologies,
  githubUrl,
  liveUrl,
}: ProjectCardProps) => {
  const [isHovered, setIsHovered] = useState(false);

  return (
    <Card
      className="custom-card overflow-hidden group cursor-pointer"
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
    >
      {/* Video/Image Container */}
      <div className="relative aspect-video bg-muted overflow-hidden">
        {videoUrl ? (
          <video
            src={videoUrl}
            className="w-full h-full object-cover"
            autoPlay={isHovered}
            loop
            muted
            playsInline
          />
        ) : imageUrl ? (
          <img
            src={imageUrl}
            alt={title}
            className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
          />
        ) : (
          <div className="w-full h-full flex items-center justify-center text-muted-foreground">
            <span className="text-sm">Add video or screenshot here</span>
          </div>
        )}
        
        {/* Overlay on hover */}
        <div className={`absolute inset-0 bg-gradient-to-t from-background/90 to-transparent transition-opacity duration-300 ${isHovered ? 'opacity-100' : 'opacity-0'}`}>
          <div className="absolute bottom-4 left-4 right-4 flex gap-3">
            {githubUrl && (
              <a
                href={githubUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="p-2 bg-card/80 backdrop-blur-sm rounded-lg hover:bg-custom-purple hover:text-white transition-colors custom-glow"
                onClick={(e) => e.stopPropagation()}
              >
                <Github className="w-5 h-5" />
              </a>
            )}
            {liveUrl && (
              <a
                href={liveUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="p-2 bg-card/80 backdrop-blur-sm rounded-lg hover:bg-custom-blue hover:text-white transition-colors custom-glow-purple"
                onClick={(e) => e.stopPropagation()}
              >
                <ExternalLink className="w-5 h-5" />
              </a>
            )}
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="p-6 space-y-4">
        <h3 className="text-2xl font-bold group-hover:text-primary transition-colors">
          {title}
        </h3>
        
        <p className="text-muted-foreground leading-relaxed">
          {description}
        </p>

        <div className="flex flex-wrap gap-2">
          {technologies.map((tech) => (
            <Badge
              key={tech}
              variant="secondary"
              className="bg-black text-white hover:bg-custom-blue hover:text-white transition-colors"
            >
              {tech}
            </Badge>
          ))}
        </div>
      </div>
    </Card>
  );
};

export default ProjectCard;
