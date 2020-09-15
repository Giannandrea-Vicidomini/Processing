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
  
  if(detectMudCollision()){
    PVector friction = p.getVelocityOpposite();
    print("("+p.velocity.x+","+p.velocity.y+")\n");
    friction.mult(0.1);
    p.applyForce(friction);
  }
  
  p.update();
  p.edges();
  p.show();
}

void drawGround(){
  fill(35);
  rect(0,height/2,width,height/2);
  noStroke();
  fill(122,89,0);
  rect(width/2,height/2-2,120,20);
}

boolean detectMudCollision(){
  if(p.position.x >= width/2 && p.position.x <= width/2+120){
    return true;
  }
  return false;
}
