class Particle{
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private float mass;
  private PImage sprite;
  private float originalWidth;
  private float originalHeight;
  private float angle;
  private float aVelocity;
  private float aAcc;
  
  public Particle(float x,float y,float mass){
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    angle = 0;
    aVelocity = 0;
    aAcc = 0;
    this.mass = mass;
    
  }
  
  public Particle(String path, float x, float y,float mass){
    this(x,y,mass);
    sprite = loadImage(path);
    originalWidth = sprite.width;
    originalHeight = sprite.height;
    
  }
  
  public void update(){
    
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    velocity.limit(15);
    //if(aVelocity >0.2) aVelocity = 0.2;
    //if(aVelocity <-0.2) aVelocity = -0.2;
    angle += aVelocity;
    aVelocity += aAcc;
    aAcc = 0;
    
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
  
  public void show(color c){
    push();
    translate(position.x,position.y);
    
    rotate(angle);
    if(sprite == null){
      
      //stroke(255);
      noStroke();
      fill(c);
      ellipseMode(CENTER);
      ellipse(0,0,10*mass,10*mass);
    }
    else{
      imageMode(CENTER);
      image(sprite,0,0);
    }
    pop();
  }
  
  public void visualize(color c){
    update();
    edges();
    show(c);
  }
  
  public void applyForce(PVector force){
    PVector newForce = PVector.div(force,mass);
    acceleration.add(newForce);
  }
  
  public void applyTorque(float rotation){
    aAcc+=rotation;
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
  
  public PVector getDragVector(float dragCoefficient){
    PVector f = getVelocityOpposite().mult(velocity.magSq()).mult(dragCoefficient);
    return f;
  }
  
  
}
