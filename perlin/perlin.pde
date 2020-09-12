float timex = 0;
float timey = 200;
float offsetx;
float offsety;

void setup(){
  frameRate(30);
  
  size(600,600);
 
}

void draw(){
 
  background(255);
  offsetx = noise(timex);
  offsety = noise(timey);
  offsetx=map(offsetx,0,1,0,width);
  offsety=map(offsety,0,1,0,height);
  noStroke();
  fill(0,0,0);
  ellipse(offsetx,offsety,20,20);
  timex+=0.01;
  timey+=0.007;
}
