import { useState, useEffect, useRef } from 'react';

interface Bubble {
  id: string;
  x: number;
  y: number;
  vx: number;
  vy: number;
  size: number;
  logo: string;
  opacity: number;
  floatOffset: { x: number; y: number };
  floatPhase: number;
}

interface BubbleConfig {
  id: string;
  size: number;
  logo: string;
  startX: number;
  startY: number;
  direction: 'lr' | 'rl' | 'tb' | 'bt' | 'd1' | 'd2';
}

const getInitialPosition = (direction: string, size: number) => {
  const padding = size / 2;
  switch (direction) {
    case 'lr':
      return { x: -padding, y: Math.random() * window.innerHeight };
    case 'rl':
      return { x: window.innerWidth + padding, y: Math.random() * window.innerHeight };
    case 'tb':
      return { x: Math.random() * window.innerWidth, y: -padding };
    case 'bt':
      return { x: Math.random() * window.innerWidth, y: window.innerHeight + padding };
    case 'd1':
      return { x: -padding, y: window.innerHeight + padding };
    case 'd2':
      return { x: window.innerWidth + padding, y: -padding };
    default:
      return { x: 0, y: 0 };
  }
};

const getVelocity = (direction: string) => {
  const baseSpeed = 0.5;
  switch (direction) {
    case 'lr':
      return { vx: baseSpeed, vy: 0 };
    case 'rl':
      return { vx: -baseSpeed, vy: 0 };
    case 'tb':
      return { vx: 0, vy: baseSpeed };
    case 'bt':
      return { vx: 0, vy: -baseSpeed };
    case 'd1':
      return { vx: baseSpeed * 0.7, vy: -baseSpeed * 0.7 };
    case 'd2':
      return { vx: -baseSpeed * 0.7, vy: baseSpeed * 0.7 };
    default:
      return { vx: baseSpeed, vy: 0 };
  }
};

export const useBubblePhysics = (configs: BubbleConfig[]) => {
  const [bubbles, setBubbles] = useState<Bubble[]>([]);
  const bubblesRef = useRef<Bubble[]>([]);
  const animationFrameRef = useRef<number>();

  useEffect(() => {
    // Initialize bubbles
    const initialBubbles = configs.map((config) => {
      const pos = getInitialPosition(config.direction, config.size);
      const vel = getVelocity(config.direction);
      return {
        id: config.id,
        x: pos.x,
        y: pos.y,
        vx: vel.vx,
        vy: vel.vy,
        size: config.size,
        logo: config.logo,
        opacity: 0,
        floatOffset: { x: 0, y: 0 },
        floatPhase: Math.random() * Math.PI * 2,
      };
    });
    
    bubblesRef.current = initialBubbles;
    setBubbles(initialBubbles);

    const checkCollision = (b1: Bubble, b2: Bubble) => {
      const dx = b2.x - b1.x;
      const dy = b2.y - b1.y;
      const distance = Math.sqrt(dx * dx + dy * dy);
      const minDistance = (b1.size + b2.size) / 2;
      return distance < minDistance;
    };

    const handleCollision = (b1: Bubble, b2: Bubble) => {
      const dx = b2.x - b1.x;
      const dy = b2.y - b1.y;
      const distance = Math.sqrt(dx * dx + dy * dy);
      
      if (distance === 0) return;

      // Normalize collision vector
      const nx = dx / distance;
      const ny = dy / distance;

      // Relative velocity
      const dvx = b1.vx - b2.vx;
      const dvy = b1.vy - b2.vy;

      // Relative velocity in collision normal direction
      const dvn = dvx * nx + dvy * ny;

      // Do not resolve if velocities are separating
      if (dvn > 0) return;

      // Collision impulse
      const impulse = (2 * dvn) / 2;

      // Update velocities (with damping for realistic bounce)
      const damping = 0.8;
      b1.vx -= impulse * nx * damping;
      b1.vy -= impulse * ny * damping;
      b2.vx += impulse * nx * damping;
      b2.vy += impulse * ny * damping;

      // Separate bubbles to prevent overlap
      const overlap = (b1.size + b2.size) / 2 - distance;
      const separationX = (overlap * nx) / 2;
      const separationY = (overlap * ny) / 2;
      
      b1.x -= separationX;
      b1.y -= separationY;
      b2.x += separationX;
      b2.y += separationY;
    };

    const animate = () => {
      const updated = bubblesRef.current.map((bubble) => {
        let { x, y, vx, vy, opacity, floatPhase } = bubble;

        // Update float animation
        floatPhase += 0.02;
        const floatOffset = {
          x: Math.sin(floatPhase) * 15,
          y: Math.cos(floatPhase) * 15,
        };

        // Update position
        x += vx;
        y += vy;

        // Calculate opacity based on position (fade in/out at edges)
        const margin = 100;
        const distFromLeft = x;
        const distFromRight = window.innerWidth - x;
        const distFromTop = y;
        const distFromBottom = window.innerHeight - y;
        
        const minDist = Math.min(distFromLeft, distFromRight, distFromTop, distFromBottom);
        
        if (minDist < margin) {
          opacity = Math.max(0, Math.min(0.3, minDist / margin * 0.3));
        } else {
          opacity = 0.3;
        }

        // Reset position if bubble goes too far off screen
        const resetMargin = 200;
        if (
          x < -resetMargin ||
          x > window.innerWidth + resetMargin ||
          y < -resetMargin ||
          y > window.innerHeight + resetMargin
        ) {
          const config = configs.find((c) => c.id === bubble.id);
          if (config) {
            const pos = getInitialPosition(config.direction, bubble.size);
            const vel = getVelocity(config.direction);
            return {
              ...bubble,
              x: pos.x,
              y: pos.y,
              vx: vel.vx,
              vy: vel.vy,
              opacity: 0,
              floatOffset,
              floatPhase,
            };
          }
        }

        return {
          ...bubble,
          x,
          y,
          vx,
          vy,
          opacity,
          floatOffset,
          floatPhase,
        };
      });

      // Check collisions between all bubble pairs
      for (let i = 0; i < updated.length; i++) {
        for (let j = i + 1; j < updated.length; j++) {
          if (checkCollision(updated[i], updated[j])) {
            handleCollision(updated[i], updated[j]);
          }
        }
      }

      bubblesRef.current = updated;
      setBubbles([...updated]);
      animationFrameRef.current = requestAnimationFrame(animate);
    };

    animationFrameRef.current = requestAnimationFrame(animate);

    return () => {
      if (animationFrameRef.current) {
        cancelAnimationFrame(animationFrameRef.current);
      }
    };
  }, [configs]);

  return bubbles;
};
