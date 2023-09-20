PImage ImO,R,G,B;
PImage ImM;

char state;
void setup()
{
  size(512,512);
  ImO=loadImage("lena.png");
  ImO.resize(256,256);
  ImM=ImO.copy();
  R=channel(ImO,'r');
  G=channel(ImO,'g');
  B=channel(ImO,'b');
  image(ImO,0,0);
  image(R,256,0);
  image(G,0,256);
  image(B,256,256);
  state='r';
}

void draw()
{
  
}


void keyPressed()
{
  if((key=='r')||(key=='R'))
    state='r';
  if((key=='g')||(key=='G'))
    state='g';
  if((key=='b')||(key=='B'))
    state='b';
    
  if((key=='+')||(key=='-'))
  {
    ImM=changeColor(ImM,state,(key=='+')?3:-3);
    
    R=channel(ImM,'r');
    G=channel(ImM,'g');
    B=channel(ImM,'b');
    
    image(ImM,0,0);
    image(R,256,0);
    image(G,0,256);
    image(B,256,256);
  }
  
}

PImage channel(PImage I, char c)
{
  PImage CI=createImage(I.width,I.height,RGB);
  
  I.loadPixels();
  CI.loadPixels();
  
  float value;
  for(int i=0; i<I.pixels.length;i++)
  {
    
    switch(c)
    {
      case 'r': value=red(I.pixels[i]); break;
      case 'g': value=green(I.pixels[i]); break;
      case 'b': value=blue(I.pixels[i]); break;
      default: value=0;
    }
    
    CI.pixels[i]=color(value,value,value);
  }
  
  return CI;
}

PImage changeColor(PImage I, char c, int mod)
{
  
  PImage CI=createImage(I.width,I.height,RGB);
  
  I.loadPixels();
  CI.loadPixels();

  float r,g,b;
  for(int i=0; i<I.pixels.length;i++)
  {
    r=red(I.pixels[i]);
    g=green(I.pixels[i]);
    b=blue(I.pixels[i]);
    
    switch(c)
    {
      case 'r': r+=mod; break;
      case 'g': g+=mod; break;
      case 'b': b+=mod; break;
    }
    
    CI.pixels[i]=color(r,g,b);
  }
  return CI;

}