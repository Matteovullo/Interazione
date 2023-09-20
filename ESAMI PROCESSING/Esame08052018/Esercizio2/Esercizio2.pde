PImage im;
float k=(10*1)+1;
int x,y

void setup(){
  
  size(1024, 512);
  im=loadImage("lena.png");
  im.resize(512, 512);
}

void draw()
{
  checkLimit();
  image(Im,0,0);
  M=regionMean(Im,int(x),int(y),k);
  noStroke();
  fill(m);
  rectMode(CORNER);
  rect(512,0,512,512);
  
  noFill();
  stroke(0,255,0);
  rectMode(CENTER);
  rect(x,y,k,k);
}


color imMean(PImage im){
  im.loadPixels();
  float r=0, g=0, b=0;
  
  for(int i=0; i<im.pixels.length; i++){
    r+=red(im.pixels[i]);
    g+=green(im.pixels[i]);
    b+=blue(im.pixels[i]);
  }
  
  return color(r/im.pixels.length, g/im.pixels.length, b/im.pixels.length);
}

color regionMean(PImage im, int x, int y, int n){
  int off=n/2;
  PImage tmp;
  tmp=I.get(x-off,y-off,n,n);
  return imMean(tmp);
}

void keyPressed(){
  if(key=='+')
    k+=10;
  if(key=='-')
    k-=10;
   if(k<10) k=10;
   if(k>250) k=250;
}
