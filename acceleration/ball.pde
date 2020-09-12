class Ball{
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private PImage sprite;
  private float originalWidth;
  private float originalHeight;
  
  public Ball(float x,float y){
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  public Ball(String path, float x, float y){
    this(x,y);
    sprite = loadImage(path);
    originalWidth = sprite.width;
    originalHeight = sprite.height;
    
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
    if(sprite == null){
      noStroke();
      fill(255,0,255);
      ellipse(position.x,position.y,50,50);
    }
    else{
      imageMode(CENTER);
      image(sprite,position.x,position.y);
    }
    
  }
  
  public void applyForce(PVector force){
    acceleration.add(force);
  }
  
  public int resizeSprite(float wPercentage, float hPercentage){
    if(sprite!=null){
      sprite.resize(int(originalWidth*wPercentage),int(originalHeight*hPercentage));
      return 1;
    }
    return 0;
  }
  
}
