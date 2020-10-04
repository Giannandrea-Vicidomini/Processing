class PSystem{
  private PVector emitter;
  private ArrayList<Particle> particles;
  private int pLife;
  private int perturbation;
  private boolean emitting = true;
  private float emissionForce;
  private int coneWidth = 20;
  
  public PSystem(float x,float y,float force,int life,int lifeOffset){
    emissionForce = force;
    emitter = new PVector(x,y);
    particles = new ArrayList<Particle>();
   
    pLife = life;
    perturbation = lifeOffset;
    
    
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
  
  void emit(){
    if(emitting){
      int lspan =(int) (pLife + random(-perturbation, perturbation));
      Particle newP = new Particle(emitter.x,emitter.y,1,lspan);
      PVector yeet = randomDirection();
      yeet.mult(emissionForce);
       
      newP.applyForce(yeet);
      particles.add(newP);
        
      for(Particle p : particles){
        PVector gravity = new PVector(0,1);
        gravity.mult(p.mass);
        
        
        p.applyForce(gravity);
        
        float l = p.lifespan;
        l = map(l,0,pLife,0,255);
        
        p.update();
        p.show(color(0,190,220,l));
      }
     }
  }
  
  
}
