Particle ship;
ArrayList<Particle> stars;

void setup(){
  size(900,600);
  frameRate(30);
  stars = new ArrayList<Particle>();
  ship = new Particle("ship.png",width/2,height/2,10);
  ship.resizeSprite(0.15,0.15);
  
  for(int i=0;i<300;i++){
    Particle p = new Particle(random(0,width),random(0,height),random(0.1,0.8));
    
    stars.add(p);
    
  }
}

void draw(){
  background(0,0,52);
  for(Particle star : stars){
    star.visualize(color(255,255,255,random(10,255)));
  }
  ship.applyForce(ship.getDragVector(0.07));
  ship.visualize(0);
  
  if(keyPressed){
    handleInput();
  }
}

void handleInput(){
   if ((key == CODED) && (keyCode == LEFT))
    {
      ship.angle-=0.081;
      //ship.applyTorque(-0.11);
      //ship.aVelocity-=0.1;
    }
    if(key == CODED && keyCode == RIGHT)
    {
      ship.angle+=0.081;
      //ship.applyTorque(0.11);
      //ship.aVelocity+=0.1;
    }
    if(key == 32){
      float angle = ship.angle-PI/2;
      PVector force = new PVector(cos(angle),sin(angle)).setMag(17);
      ship.applyForce(force);
    }
}
