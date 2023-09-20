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


PImage magicEraser(PImage I, color c, float t)
{
  PImage R=I.copy();
  
  float r=red(c);
  float g=green(c);
  float b=blue(c);
  
  R.loadPixels();
  
  color tmp;
  float rTmp;
  float gTmp;
  float bTmp;
  
  for (int i=0; i< R.pixels.length; i++)
  {
    tmp=R.pixels[i];
    
    rTmp=red(tmp);
    gTmp=green(tmp);
    bTmp=blue(tmp);
    
    if((abs(r-rTmp)<t) && (abs(g-gTmp)<t) && (abs(b-bTmp)<t))
    {
      R.pixels[i]=color(0);
    }
    
  }
  R.updatePixels();
  
  return R;
}

PImage magicReverse(PImage I, PImage IO)
{
  PImage R=I.copy();
  
  R.loadPixels();
  IO.loadPixels();
  color tmp;
  
  for (int i=0; i< R.pixels.length; i++)
  {
    tmp=R.pixels[i];
    
    if(tmp!=color(0))
    {
      R.pixels[i]=color(0);
    }
    else
    {
      R.pixels[i]=IO.pixels[i];
    }
    
  }
  R.updatePixels();
  
  return R;
}