ArrayList<Particle> particles;
Attractor atc;

void setup(){
  size(1080,720);
  particles = new ArrayList<Particle>();
  atc = new Attractor(width/2,height/2,50);
}

void draw(){
  background(255);
  
  atc.show(color(42,42,42));
  
  for(Particle p : particles){
    
    atc.attract(p);
    
    
    p.visualize();
  }
  
  
}

void mousePressed(){
  Particle p = new Particle(mouseX,mouseY);
  p.setMass(random(2,6));
  particles.add(p);
}
