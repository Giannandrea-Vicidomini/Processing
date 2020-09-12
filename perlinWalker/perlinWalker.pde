Walker walker1;
Walker walker2;

void setup(){
  frameRate(60);
  size(600,600);
  walker1 = new Walker(width/2,height/2,0.009,0.004);
  walker2 = new Walker(30,30,0.004,0.009);
}

void draw(){
  background(0);
  walker1.move();
  walker1.show();
  walker2.move();
  walker2.show();
}
