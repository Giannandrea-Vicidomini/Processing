class Attractor{
  private float GRAVITATIONAL_CONSTANT = 200;
  private PVector position;
  private float mass;
  private float diameter;
  
  public Attractor(float x, float y, float mass){
    this.position = new PVector(x,y);
    this.mass = mass;
    diameter = 4*mass;
  }
  
  public void attract(Particle p){
    PVector gravity = computeGravity(p);
    p.applyForce(gravity);
  }
  
  public PVector computeGravity(Particle p){
    PVector direction = PVector.sub(position,p.position);
    if(direction.mag()>diameter/2){
      float distance = direction.magSq();
      //distance = constrain(distance,5,25);
      //distance = map(distance,0,distance,5,25);
      direction.normalize();
    
      float magnitude = (GRAVITATIONAL_CONSTANT*mass*p.mass)/distance;
      direction.mult(magnitude);
    }
    else{
      p.velocity.mult(-1);
      direction.setMag(0);
    }
    
    
    return direction;
  }
  
  public void show(color c){
    fill(c);
    ellipseMode(CENTER);
    ellipse(position.x,position.y,diameter,diameter);
  }
}
