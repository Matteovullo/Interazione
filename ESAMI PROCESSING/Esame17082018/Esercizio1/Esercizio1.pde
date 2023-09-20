PImage i;
int N;

void setup(){
  size(512, 512);
  i=loadImage("lena.png");
  N=101;
}

void draw(){
   image(i, 0, 0);
   noFill();
   rect(mouseX, mouseY, N, N);
   
   if(mousePressed)
     i=applyArea(i, mouseX, mouseY, N, mouseButton==RIGHT);
}

void keyPressed(){
  if(key=='+') N+=2;
  if(key=='-') N-=2;
  if((key=='R') || (key=='r')) setup();
  if(N<51) N=51;
  if(N>151) N=151;
}

PImage lemonFilter(PImage im){
  PImage ri=im.copy();
  
  im.loadPixels();
  ri.loadPixels();
  
  float r,g,b;
  
  for(int i=0; i<im.pixels.length; i++){
    r=red(im.pixels[i]);
    g=green(im.pixels[i]);
    b=blue(im.pixels[i]);
    
    ri.pixels[i]=color(r-(b/8), g+b, 0);
  }

  return ri;
}

PImage orangeFilter(PImage im){
  PImage ri=im.copy();
  
  im.loadPixels();
  ri.loadPixels();
  
  float r,g,b;
  
  for(int i=0; i<im.pixels.length; i++){
    r=red(im.pixels[i]);
    g=green(im.pixels[i]);
    b=blue(im.pixels[i]);
    
    ri.pixels[i]=color(r+b, g, 0);
  }

  return ri;
}

PImage applyArea(PImage im, int x, int y, int d, boolean f){
  PImage ri=im.copy();
  PImage tmp=ri.get(x-d/2, y-d/2, d, d); 
  
  if(f)
    tmp=lemonFilter(tmp);
   else
    tmp=orangeFilter(tmp);
    
   ri.set(x-d/2, y-d/2, tmp);
   return ri;
}
