class Attractor{
  private float GRAVITATIONAL_CONSTANT = 1;
  private PVector position;
  private float mass;
  
  public Attractor(float x, float y, float mass){
    this.position = new PVector(x,y);
    this.mass = mass;
  }
  
  public void attract(Particle p){
    PVector gravity = computeGravity(p);
    p.applyForce(gravity);
  }
  
  public PVector computeGravity(Particle p){
    PVector direction = PVector.sub(position,p.position);
    float distance = direction.magSq();
    direction.normalize();
    
    float magnitude = (GRAVITATIONAL_CONSTANT*mass*p.mass)/distance;
    direction.mult(magnitude);
    
    return direction;
  }
  
  public void show(color c){
    fill(c);
    ellipseMode(CENTER);
    ellipse(position.x,position.y,4*mass,4*mass);
  }
}
