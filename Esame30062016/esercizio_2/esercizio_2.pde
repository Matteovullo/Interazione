PImage imOr;
PImage imRep;
int R=0;


void setup()
{
  size(512,300);
  background(0);
  imOr=loadImage("lena.png");
  imOr.resize(256,256);
  
  imRep=dropResolution(imOr,R);
  image(imOr,0,0);
  image(imRep,256,0);
  stroke(255);
  textSize(15);
  textAlign(CENTER);
  text("Degrado= "+ R,256,280 );
  
}

void draw()
{
  
}

void keyPressed()
{
  if (key=='+' && R<8)
  {
    background(0);
    R++;
    imRep=dropResolution(imOr,R);
    image(imOr,0,0);
    image(imRep,256,0);
    text("Degrado= "+ R,256,280);
  }
  
  if (key=='-' && R>0)
  {
    R--;
    background(0);
    imRep=dropResolution(imOr,R);
    image(imOr,0,0);
    image(imRep,256,0);
    text("Degrado= "+ R,256,280);
  }
  
}

PImage downScale(PImage I)
{
  PImage J=createImage(I.width/2,I.height/2,RGB);
  
  for(int i=0;i<J.width;i++)
  {
    
    for(int j=0;j<height;j++)
    {
      J.set(i,j,I.get(i*2,j*2));
    }
  }
  
  return J;
  
}

PImage upScale(PImage I)
{
  PImage J=createImage(I.width*2,I.height*2,RGB);
  
  for(int i=0;i<I.width;i++)
  {
    
    for(int j=0;j<I.height;j++)
    {
      J.set(i*2,j*2,I.get(i,j));
      J.set(i*2+1,j*2,I.get(i,j));
      J.set(i*2,j*2+1,I.get(i,j));
      J.set(i*2+1,j*2+1,I.get(i,j));
    }
  }
  
  return J;
}

PImage dropResolution(PImage I, int n)
{
  PImage Itmp=I.copy();
  for(int i=0;i<n;i++)
  {
    Itmp=downScale(Itmp);
  }
  
   for(int i=0;i<n;i++)
  {
    Itmp=upScale(Itmp);
  }
  
  return Itmp;
}

//float computeMSE(PImage I, PImage J)
//{
//  I.loadPixels();
//  J.loadPixels();
  
//  float mseR=0,mseG=0,mseB=0,mse=0;
//  for(int i=0;i<I.pixels.length;i++)
//  {
//    mseR+=pow(red(I.pixels[i])-red(J.pixels[i]),2);
//    mseG+=pow(green(I.pixels[i])-green(J.pixels[i]),2);
//    mseB+=pow(blue(I.pixels[i])-blue(J.pixels[i]),2);
//  }
  
//  mse=(mseR+mseG+mseB)/(3.0*I.pixels.length);
//  return mse;
//}