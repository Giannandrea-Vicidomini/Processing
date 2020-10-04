
PSystem emitter;
void setup(){
  size(600,600);
  emitter = new PSystem(width/2,height/2,10,40,15);
  
}

void draw(){
  background(252);
  emitter.coneWidth = (int)map(mouseX,0,width,0,40);
  emitter.emit();
  
}
