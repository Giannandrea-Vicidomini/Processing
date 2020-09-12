Ball ball;


float time;
void setup(){
  time = 0;
  size(600,600);
  frameRate(30);
  ball= new Ball("ball.png",width/2,height/2);
  ball.resizeSprite(0.20,0.20);
}

void draw(){
  background(255);
  /*
  
  //translate(width/2,height/2);
  PVector center = new PVector(width/2,height/2);
  PVector mouse = new PVector(mouseX,mouseY);
  
  mouse.sub(center);
  
  line(center.x,center.y,center.x+mouse.x,center.y+mouse.y);
  */
  
  PVector gravity = new PVector(0,-0.02);
  ball.applyForce(gravity);
  /*
  if(mousePressed){
     PVector wind = new PVector(0.9,0);
     ball.applyForce(wind);
  }
  */
  
  float amt = noise(time);
  
  PVector wind = new PVector(map(amt,0,1,-0.3,0.3),0);
  ball.applyForce(wind);
  
  time+=0.05;
  
  ball.update();
  ball.edges();
  ball.show();
  
}
