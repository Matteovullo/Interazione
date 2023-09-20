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

PImage gamma(PImage I, float k){
PImage R=createImage(I.width,I.height,RGB);
  
  R.loadPixels();
  I.loadPixels();
  
  float r,g,b;
  float C=1/pow(255,k-1);
  
  for(int i=0; i<R.pixels.length; i++)
  {
    r=C*pow(red(I.pixels[i]),k);
    g=C*pow(green(I.pixels[i]),k);
    b=C*pow(blue(I.pixels[i]),k);
    
    R.pixels[i]=color(r,g,b);
  }
  R.updatePixels();
  return R;
}

PImage difference(PImage I1, PImage I2){
  PImage O=createImage(I1.width, I2.height, RGB);
  
  O.loadPixels();
  for(int i=0; i<O.pixels.length; i++){
    O.pixels[i]=abs(I1.pixels[i]-I2.pixels[i]);
  }
  
  return O;
}
