ArrayList<Particle> particles;
Attractor atc;

void setup(){
  size(1080,720);
  frameRate(30);
  particles = new ArrayList<Particle>();
  atc = new Attractor(width/2,height/2,50);
  setupParticles();
}

void draw(){
  background(255);
  
  atc.show(color(42,42,42));
  
  for(Particle p : particles){
    
    atc.attract(p);
    
    
    float velocity = p.velocity.mag();
    PVector airDrag = p.getVelocityOpposite().mult(velocity*velocity*0.05);
    p.applyForce(airDrag);
    
    p.visualize();
  }
  
  
}

void mousePressed(){
  Particle p = new Particle(mouseX,mouseY,random(2,6));
  
  particles.add(p);
}

void setupParticles(){
  int num =round(random(10,29));
  float offset = 360/num;
  float increment = 0;
  
  for(int i = 0;i<num;i++){
    
    float posx = cos(radians(increment))*420 +atc.position.x;
    float posy = sin(radians(increment))*420 +atc.position.y;
    PVector pos = new PVector(posx,posy);
    PVector toAttractor = (PVector.sub(atc.position,pos)).setMag(random(-96,96));
    pos.add(toAttractor);
    Particle p = new Particle(pos.x,pos.y,random(2,6));
    particles.add(p);
    
    increment+=offset;
  }
  
}
