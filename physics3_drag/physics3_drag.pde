Particle[] ps;
Particle p;
Fluid water;
float drag;
void setup(){
  size(600,600);
  frameRate(60);
  drag = 0.09;
  water = new Fluid(0,height/2,width,height/2,drag);
  
  float dist = width/10;
  float pos = dist/2;
  ps = new Particle[10];
  for(int i = 0; i <10;i++){
    Particle temp = new Particle(pos,20);
    temp.setMass(random(1.2,8));
    //temp.setMass(3);
    ps[i] = temp;
    pos+=dist;
  }
  
}

void draw(){
  background(255);
  
  
  water.show(color(0,130,190));
  
  
  for(Particle p : ps){
    //float m = drag*p.mass;
    PVector grav = new PVector(0,0.3);
    grav.mult(p.mass);
    p.applyForce(grav);
    
    
    if(water.contains(p)){
      PVector drag = water.drag(p);
      p.applyForce(drag);
    }
    
    if(p.mass<=12){
      println(p.velocity);
    }
    
    
    p.update();
    p.edges();
    p.show();
  }
  
  
}

void mousePressed(){
  PVector center = new PVector(width/2,height/2);
  PVector mouse = new PVector(mouseX,mouseY);
  PVector force = PVector.sub(mouse,center);
  //print(force.mag());
  force.setMag(60);
  for(Particle p :ps){
    p.applyForce(force);
  }
    
}
