Particle[] objs;

void setup(){
  size(900,600);
  objs = new Particle[10];
  for(int i=0;i<objs.length;i++){
    Particle p= new Particle("soccerBall.png",random(width),height/2);
    p.setMass(random(2,7));
    p.resizeSprite(0.09,0.09);
    objs[i]= p;
  }
}

void draw(){
 background(255);
 
 PVector gravity = new PVector(0,0.4);
 for(Particle p : objs){
   p.applyForce(gravity);
   p.update();
   p.edges();
   p.show();
 }
}
