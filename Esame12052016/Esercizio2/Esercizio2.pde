PImage imOr;
PImage im;
int t;
void setup()
{
  size(512,512);
  imOr=loadImage("lena.png");
  im=imOr.copy();
  t=25;
  image(im,0,0);
  
}


void draw()
{
  image(im,0,0);
  
  fill(255);
  rect(0,0,30,30);
  
  fill(0);
  textSize(15);
  textAlign(RIGHT);
  text(t,25,20);
}

void mousePressed()
{
  if(mouseButton==LEFT)
  {
    im=magicEraser(im,im.get(mouseX,mouseY),t);
  }
}


void keyPressed()
{
  if ((key=='r')||(key=='R'))
  {
       im=imOr.copy();
  }
  else if((key=='+')&&(t<50))
  {
    t++;
  }
  else if((key=='-')&&(t>1))
  {
    t--;
  }
  else if((key=='i')||(key=='I'))
  {
    im=magicReverse(im,imOr);
  }
}

PImage magicEraser(PImage I, color c, float t){
  PImage R=I.copy();
  
  R.loadPixels();
  I.loadPixels();
  
  float r, g, b;
  r=red(c);
  g=green(c);
  b=blue(c);
  
  for(int i=0; i<R.pixels.length; i++){
    if((abs(r-red(I.pixels[i])) < t) && (abs(g-green(I.pixels[i])) < t) && (abs(b-blue(I.pixels[i])) < t))
      R.pixels[i]=color(0, 0, 0);
  }
  
  R.updatePixels();
  
  return R;
}

PImage magicReverse(PImage I1, PImage I2){
  PImage R=I1.copy();
  
  R.loadPixels();
  I1.loadPixels();
  I2.loadPixels();
  
  for(int i=0; i<I1.pixels.length; i++){
    if(R.pixels[i] == color(0)) R.pixels[i] = I2.pixels[i];
    else R.pixels[i] = color(0);
  }
  
  R.updatePixels();
  
  return R;

}
