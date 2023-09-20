PImage im;
PImage imGray;
PImage bitplane;
boolean saved;

void setup(){
  size(M, 3*N);
  im=loadImage("Lena.png");
  im.resize(im.width/2, im.height/2);
  saved=false;
  
  image(im, 0, 0);
   imGray=imToGray(im);
  image(imGray,imGray.width,0);

  bitplane=estraiPianoN(imGray,8);
  image(bitplane,bitplane.width*2,0);
}

void draw(){}

void keyPressed(){
  int k=key;
  if ((k>'0')&&(k<'9')){
    bitplane=estraiPianoN(imGray,k-'0');
    image(bitplane,im.width*2,0);   
  }
  if (((k=='s')||(k=='S'))&&(!saved)){
    saved=true;
    salvaBitPlane(imGray);
  } 
}

PImage imToGray(PImage im){
  PImage ri=im.copy();
  ri.filter(GRAY);
  
  float r=0, g=0, b=0;
  
  ri.loadPixels();
  im.loadPixels();
  
  for(int i=0; i<im.pixels.length; i++){
    r=red(im.pixels[i]);
    g=green(im.pixels[i]);
    b=blue(im.pixels[i]);
    ri.pixels[i]=color(r*0.5, g*0.2, b*0.3);
  }
  
  ri.updatePixels();
  return ri;
}

PImage estraiPianoN(PImage I, int n){
  PImage plane=createImage(I.width,I.height,RGB);
  
  plane.loadPixels();
  I.loadPixels();
  
  int B;
  for(int i=0;i<I.pixels.length;i++)
  {
   
    B=(int(green(I.pixels[i])))>>(n-1);
    B=B&1;
    
    plane.pixels[i]=color(B*255);
  }
  
  plane.updatePixels();
  return plane;
}

void salvaBitPlane(PImage I){
  PImage B;
  for(int i=0; i<8; i++){
    B=estraiPianoN(I, i);
    B.save(savePath("b"+i+".png"));
  }
}
