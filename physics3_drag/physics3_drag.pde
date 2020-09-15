Particle[] ps;
Particle p;
Fluid water;
void setup(){
  size(600,600);
  frameRate(30);
  water = new Fluid(0,height/2,width,height/2,0.1);
  
  float dist = width/10;
  float pos = dist/2;
  ps = new Particle[10];
  for(int i = 0; i <10;i++){
    Particle temp = new Particle(pos,20);
    temp.setMass(random(1,8));
    //temp.setMass(3);
    ps[i] = temp;
    pos+=dist;
  }
  
}

void draw(){
  background(255);
  
  
  water.show(color(0,130,190));
  
  
  for(Particle p : ps){
    
    PVector grav = new PVector(0,1);
    grav.mult(p.mass);
    p.applyForce(grav);
    
    
    if(water.contains(p)){
      PVector drag = water.drag(p);
      p.applyForce(drag);
    }
    
    
    p.update();
    p.edges();
    p.show();
  }
  

  
}
