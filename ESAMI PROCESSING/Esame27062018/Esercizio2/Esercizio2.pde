float k=0.5;
PImage im1, im2;

void setup(){
  size(512, 512);
  im1=loadImage("lena.png");
  im2=loadImage("lena.png");
  
  im1.resize(256, 256);
  im2.resize(256, 256);
  
  image(im1, 0, 0);
  image(im2, 0, 256);
  image(fusion(im1, im2, k), 256, 0);
  image(subtract(im1, im2, k), 256, 256);
}

void draw(){}

PImage fusion(PImage i1, PImage i2, float k){
  PImage i3=createImage(i1.width, i2.height, RGB);
 
  i1.loadPixels();
  i2.loadPixels();
  i3.loadPixels();
  
  float r1,g1,b1,r2,g2,b2;  
  
  for(int i=0; i<i1.pixels.length; i++){
    r1=red(i1.pixels[i]);
    g1=green(i1.pixels[i]);
    b1=blue(i1.pixels[i]);
    
    r2=red(i2.pixels[i]);
    g2=green(i2.pixels[i]);
    b2=blue(i2.pixels[i]);
    
    i3.pixels[i]=color(k*r1+(1-k)*r2,k*g1+(1-k)*g2,k*b1+(1-k)*b2);
  }
  
  return i3;
}

PImage subtract(PImage i1, PImage i2, float k){
  PImage i3=createImage(i1.width, i2.height, RGB);
 
  i1.loadPixels();
  i2.loadPixels();
  i3.loadPixels();
  
  float r1,g1,b1,r2,g2,b2;  
  
  for(int i=0; i<i1.pixels.length; i++){
    r1=red(i1.pixels[i]);
    g1=green(i1.pixels[i]);
    b1=blue(i1.pixels[i]);
    
    r2=red(i2.pixels[i]);
    g2=green(i2.pixels[i]);
    b2=blue(i2.pixels[i]);
    
    i3.pixels[i]=color(r1-k*r2,g1-k*g2,b1-k*b2);
  }
  
  return i3;
}

void keyPressed(){
  if(key=='+')
    k+=0.05;
  if(key=='-')
    k-=0.05;
  if(k<0)
    k=0;
  if(k>1)
    k=1;
}

  
