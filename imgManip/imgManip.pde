import controlP5.*;
ControlP5 env;
PImage frog;
PImage buffer;

void setup(){
  
  env = new ControlP5(this);
  env.addButton("lol").setValue(0).setPosition(0,0).setSize(200,100);
  frog = loadImage("frog.jpeg");
  buffer = createImage(frog.width,frog.height,RGB);
  surface.setSize(frog.width,frog.height);
  
  
}

void draw(){
  //image(frog,0,0);
  
  Operation op=new Operation(){
    @Override
    public color op(int x,int y,float r,float g,float b){
      
      return 0;
    }
  };
  
  ImageP(frog,buffer,op);
  image(buffer,0,0);
   
  
}

interface Operation{
  color op(int x,int y,float r,float g,float b);
}

void ImageP(PImage source,PImage buffer,Operation operate){
  frog.loadPixels();
  buffer.loadPixels();
  for(int x=0;x<source.width;x++){
    for(int y=0;y<source.height;y++){
      int index = x+y*width;
      float r = red(source.pixels[index]);
      float g = green(source.pixels[index]);
      float b = blue(source.pixels[index]);
      
      buffer.pixels[index] = operate.op(x,y,r,g,b);
    }
  }
  buffer.updatePixels();
}  

void keyPressed(){
  if(key==32){
     buffer.save("/Users/giannandreavicidomini/Desktop/lol.jpeg");
  }
 
}
