PImage img;
PSystem emitter;

void setup(){
  img = loadImage("star.png");
  img.resize((int)(img.width*0.009),(int)(img.height*0.009));
  
  frameRate(60);
  size(600,600);
  emitter = new PSystem(width/2,height/2,9,1.30,30);
  emitter.emitting = false;
  
}

void draw(){
  background(252);
  //emitter.coneWidth = (int)map(mouseX,0,width,0,40);
  
  emitter.emitterPos = new PVector(mouseX,mouseY);
  //Particle p = new Particle(emitter.emitterPos.copy(),1,50);
  
  SpriteParticle p = new SpriteParticle(img,emitter.emitterPos.x,emitter.emitterPos.y,1,30);
  
  
  emitter.generateParticle(p);
  emitter.gravity(1);
  if(keyPressed){
    if(key == 32){
      emitter.applyForce(new PVector(1,0));
    }
  }
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
