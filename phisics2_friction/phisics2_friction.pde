Particle p;

void setup(){
  p = new Particle(0,width/2-22);
  size(600,600);
  
}

void draw(){
  background(255);
  
  drawGround();
  if(mousePressed){
    p.applyForce(new PVector(1,0));
  }
  
  PVector friction = p.getVelocityOpposite();
  friction.mult(0.1);
  
  if(detectMudCollision()){
    
    p.applyForce(friction);
  }
  
  p.update();
  p.edges();
  p.show();
  stroke(0,255,0);
  line(p.position.x,p.position.y,p.position.x+p.velocity.x*20,p.position.y+p.velocity.y*20);
  stroke(0,0,255);
  line(p.position.x,p.position.y,p.position.x-(friction.x*100),p.position.y-(friction.y*100));

}
void drawGround(){
  noStroke();
  fill(35);
  rect(0,height/2,width,height/2);
  
  fill(122,89,0);
  rect(width/2,height/2-2,120,20);
}

boolean detectMudCollision(){
  if(p.position.x >= width/2 && p.position.x <= width/2+120){
    return true;
  }
  return false;
}
