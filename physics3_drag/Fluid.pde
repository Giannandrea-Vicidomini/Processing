class Fluid{
  private float posx;
  private float posy;
  private float fwidth;
  private float fheight;
  private float dragCoefficient;
  
  public Fluid(float posx,float posy,float fwidth,float fheight,float dragCoefficient){
    this.posx = posx;
    this.posy = posy;
    this.fwidth = fwidth;
    this.fheight = fheight;
    this.dragCoefficient = dragCoefficient;
    
  }
  
  public void show(color c){
    fill(c);
    rect(posx,posy,fwidth,fheight);
  }
  
  public boolean contains(Particle p){
    
    float px = p.position.x;
    float py = p.position.y;
    float psize = 10*p.mass;
    
    boolean xcoll = px+psize/2 >= posx && posx+fwidth >= px;
    boolean ycoll = py+psize/2 >= posy && posy+fheight >= py;
    
    return xcoll&&ycoll;
    
  }
  
  public PVector drag(Particle p){
    PVector drag = p.getDragVector();
    drag.mult(dragCoefficient);
    return drag;
  }
}
