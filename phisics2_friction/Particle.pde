class Particle{
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private float mass;
  private PImage sprite;
  private float originalWidth;
  private float originalHeight;
  
  public Particle(float x,float y){
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 1;
  }
  
  public Particle(String path, float x, float y){
    this(x,y);
    sprite = loadImage(path);
    originalWidth = sprite.width;
    originalHeight = sprite.height;
    
  }
  
  public void update(){
    
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    //velocity.limit(5);
  }
  
  
  public void edges(){
    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } else if (position.x < 0) {
      velocity.x *= -1;
      position.x = 0;
    }

    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    }
    else if(position.y<0){
      position.y = 0;
      velocity.y*=-1;
    }
      
   
  }
  
  public void show(){
    if(sprite == null){
      stroke(255);
      fill(255,0,255);
      ellipseMode(CENTER);
      ellipse(position.x,position.y,50,50);
    }
    else{
      imageMode(CENTER);
      image(sprite,position.x,position.y);
    }
    
  }
  
  public void applyForce(PVector force){
    PVector newForce = PVector.div(force,mass);
    acceleration.add(newForce);
  }
  
  public void setMass(float newMass){
    mass = newMass;
  }
  
  public int resizeSprite(float wPercentage, float hPercentage){
    if(sprite!=null){
      sprite.resize(int(originalWidth*wPercentage),int(originalHeight*hPercentage));
      return 1;
    }
    return 0;
  }
  
  public PVector getVelocityOpposite(){
    PVector friction = velocity.copy();
    friction.normalize();
    friction.mult(-1);
    return friction; 
  }
  
}
