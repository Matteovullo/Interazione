PImage imOr,imGamma,imDiff;
float gam;
void setup()
{
  size(768,300);
  gam=1;
  imOr=loadImage("lena.png");
  imOr.resize(imOr.width/2,imOr.height/2);
  imOr.filter(GRAY);
  
  imGamma=gamma(imOr,gam);
  imDiff=difference(imOr,imGamma);
  textSize(20);
  
}

void draw()
{
  background(0);
  image(imOr,0,0);
  text("Originale",80,285);
  image(imGamma,imGamma.width,0);
  text("Gamma: "+ nfs(gam,1,2),80+imGamma.width,285);
  image(imDiff,imDiff.width*2,0);
  text("Differenza",80+imDiff.width*2,285);
}

PImage difference(PImage I1, PImage I2)
{
  PImage R=createImage(I1.width,I1.height,RGB);
  
  R.updatePixels();
  I1.updatePixels();
  I2.updatePixels();
  
  for(int i=0; i<I1.pixels.length; i++)
  {
    R.pixels[i]=color(abs(red(I1.pixels[i])-red(I2.pixels[i])));
  }
  
  return R;
}

PImage gamma(PImage I, float k)
{
  
  PImage R=createImage(I.width,I.height,RGB);
  
  R.updatePixels();
  I.updatePixels();
 
  float in;
  float out;
  float c=255.0/pow(255,k);
  for(int i=0; i<I.pixels.length; i++)
  {
    in=red(I.pixels[i]);
    out=c*pow(in,k);
    
    R.pixels[i]=color(out);
  }
  return R;
  
}

void keyPressed()
{
   if((key=='+')&&(gam<10))
   {
     gam+=0.1;
     imGamma=gamma(imOr,gam);
     imDiff=difference(imOr,imGamma);
   }
   if((key=='-')&&(gam>0))
   {
     gam-=0.1;
     if(gam<0)
       gam=0;
     imGamma=gamma(imOr,gam);
     imDiff=difference(imOr,imGamma);
   }
}