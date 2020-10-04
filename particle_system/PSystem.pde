class PSystem{
  private PVector emitterPos;
  private ArrayList<Particle> particles;
  private int pLife;
  private int perturbation;
  private boolean emitting = true;
  private float emissionForce;
  private float emissionOffset;
  private int coneWidth;
  private String imagePath;
  
  public PSystem(float x,float y,float force,float forceOffset,int life,int lifeOffset,int coneWidth){
    this.coneWidth = coneWidth;
    emissionOffset = forceOffset;
    emissionForce = force;
    emitterPos = new PVector(x,y);
    particles = new ArrayList<Particle>();
   
    pLife = life;
    perturbation = lifeOffset;
    
    
  }
  
  public PSystem(String path,float x,float y,float force,float forceOffset,int life,int lifeOffset,int coneWidth){
    this(x,y,force,forceOffset,life,lifeOffset,coneWidth);
    imagePath = path;
    
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
      
      Particle newP = null;
      if(imagePath == null){
        newP = new Particle(emitterPos.x,emitterPos.y,1,lspan);
      }
      else{
        newP = new Particle(imagePath,emitterPos.x,emitterPos.y,1,lspan);
      }
      
      PVector yeet = randomDirection();
      yeet.mult(emissionForce*random(emissionOffset/2,emissionOffset));
       
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
      
      for(int i = 0 ; i<particles.size();i++){
        Particle curr = particles.get(i);
        
        if(curr.isDead()){
          particles.remove(i);
          i--;
        }
      }
      
      
     }
  }
  
  
}
