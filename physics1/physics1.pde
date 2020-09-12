Particle[] objs;

void setup(){
  size(900,600);
  objs = new Particle[10];
  for(int i=0;i<objs.length;i++){
    Particle p= new Particle("soccerBall.png",random(width),height/2);
    p.setMass(random(2,7));
    p.resizeSprite(0.09*map(p.mass,0,7,0.5,1.5),0.09*map(p.mass,0,7,0.3,1.5));
    objs[i]= p;
  }
}

void draw(){
 background(255);
 
 for(Particle p : objs){
   
   PVector gravity = new PVector(0,0.4);
   gravity.mult(p.mass);
   
   if(mousePressed){
     PVector wind = new PVector(0.5,0);
     p.applyForce(wind);
   }
   
   p.applyForce(gravity);
   p.update();
   p.edges();
   p.show();
 }
}
