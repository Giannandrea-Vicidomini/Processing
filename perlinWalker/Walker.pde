class Walker{
  private float timeX;
  private float timeY;
  private float x;
  private float y;
  private float xvelocity;
  private float yvelocity;
  
  public Walker(int x,int y,float xvelocity,float yvelocity){
    
    this.x=x;
    this.y=y;
    this.xvelocity = xvelocity;
    this.yvelocity = yvelocity;
    
    float coefficient = random(-50,50);
    this.timeX = random(0,500+coefficient);
    this.timeY = random(0,500+coefficient);
    
  }
  
  public void move(){
    float perlinx = noise(timeX);
    float perliny = noise(timeY);
    perlinx = map(perlinx,0,1,-x,width-x);
    perliny = map(perliny,0,1,-y,height-y);
    this.x+=perlinx;
    this.y+=perliny;
    timeX+=xvelocity;
    timeY+=yvelocity;
  }
  
  public void show(){
    noStroke();
    fill(255);
    ellipse(x,y,20,20);
  }
  
}
