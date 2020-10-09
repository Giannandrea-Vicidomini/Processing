class PSystem{
  private PVector emitterPos;
  private ArrayList<Particle> particles;
  private boolean emitting = true;
  private float emissionForce;
  private float emissionOffset;
  private int coneWidth;
  
  public PSystem(float x,float y,float force,float forceOffset,int coneWidth){
    this.coneWidth = coneWidth;
    emissionOffset = forceOffset;
    emissionForce = force;
    emitterPos = new PVector(x,y);
    particles = new ArrayList<Particle>();
  
    
  }
 
  
  private PVector randomDirection(){
    int pos = coneWidth/2;
    PVector one = new PVector(-pos,-40);
    PVector two = new PVector(pos,-40);
    
    //println(PVector.sub(one,two).mag());
    
    float factor = random(0,1);
     
    PVector direction = PVector.add(one.mult(factor),two.mult(1-factor)).normalize();
    return direction;
  }
  
  void generateParticle(Particle p){
    if(emitting){
      
      PVector yeet = randomDirection();
      yeet.mult(emissionForce*random(1,emissionOffset));
       
      p.applyForce(yeet);
      particles.add(p);
    }
   
  }
  
  void applyForce(PVector force){
    for(Particle p : particles){
       
        p.applyForce(PVector.mult(force,p.mass));
    }
    
  }
  
  void emit(){
      
    for(int i = 0 ; i<particles.size();i++){
        
        Particle p = particles.get(i);
        
        //println("current ="+p.currentLife);
        //println("total ="+p.lifespan);
        
        
        
        float opacity = lerp(0,255,(float)p.currentLife/(float)p.lifespan);
        
        //println("opacity ="+(float)p.currentLife/(float)p.lifespan);
        
        p.update();
        p.show(color(0,190,220,opacity));
        
        if(p.isDead()){
          particles.remove(i);
          i--;
       }
       //println("Particles:"+ particles.size());
    }
       
  }
  
  
}
