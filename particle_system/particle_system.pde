
PSystem emitter;
void setup(){
  frameRate(60);
  size(600,600);
  emitter = new PSystem(width/2,height/2,10,1.25,40,15,30);
  
}

void draw(){
  background(252);
  //emitter.coneWidth = (int)map(mouseX,0,width,0,40);
  emitter.emitterPos = new PVector(mouseX,mouseY);
  emitter.emit();
  
}
