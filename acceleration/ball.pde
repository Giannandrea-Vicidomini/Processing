class Ball{
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  
  public Ball(float x,float y){
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  public void update(){
    /*
    PVector direction = new PVector(mouseX,mouseY).sub(position);
    //acceleration = PVector.random2D();
    direction.setMag(0.4);
    acceleration = direction;
    */
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
    noStroke();
    fill(255,0,255);
    ellipse(position.x,position.y,50,50);
  }
  
  public void applyForce(PVector force){
    acceleration.add(force);
  }
  
  
}
