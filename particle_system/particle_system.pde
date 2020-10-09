
PSystem emitter;
void setup(){
  frameRate(60);
  size(600,600);
  emitter = new PSystem(width/2,height/2,9,1.30,30);
  emitter.emitting = false;
  
}

void draw(){
  background(252);
  //emitter.coneWidth = (int)map(mouseX,0,width,0,40);
  emitter.emitterPos = new PVector(mouseX,mouseY);
  Particle p = new Particle(emitter.emitterPos.copy(),1,50);
  //SpriteParticle p = new SpriteParticle("star.png",emitter.emitterPos.x,emitter.emitterPos.y,1,30);
  //p.resizeSprite(0.003,0.003);
  emitter.generateParticle(p);
  emitter.emit();
  
}

void mousePressed(){
  if(emitter.emitting == false){
    emitter.emitting=true;
  }else{
    emitter.emitting=false;
  }
  
}

void mouseReleased(){
  if(emitter.emitting == false){
    emitter.emitting=true;
  }else{
    emitter.emitting=false;
  }
}
