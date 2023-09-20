PImage Im;
PImage ImRF;
PImage ImRI;
float T=1;

void setup()
{
  size(768,256);
  Im=loadImage("lena.png");
  Im.resize(256,256);
  update();
}

void draw()
{
}

void update()
{
  ImRF=scaleF(Im,T);
  ImRI=scaleI(Im,T);
  background(0);
  image(Im,0,0);
  image(ImRF,256,0);
  image(ImRI,256*2,0);
}

void keyPressed()
{
  if ((key=='+')&&(T<2))
  {
    T+=0.1;
    T=min(T,2);
    update();
  }
  
  if ((key=='-')&&(T>0.1))
  {
    T-=0.1;
    T=max(T,0.1);
    update();
  }
  println(T);
}

PImage scaleF(PImage I, float theta)
{
  PImage R=createImage(I.width,I.height,RGB);;

  R.loadPixels();
 
  float x,y;
  for (int v=0; v<I.width;v++)
  {
    for (int w=0; w<I.height;w++)
    {
       //Traslazione nel punto centrale
       int v1=v-(I.width/2);
       int w1=w-(I.height/2);
       
       //Rotazione
       x= v1*theta;
       y= w1*theta;
       
       //Traslazione nelle coordinate originali
       x=x+(I.width/2);
       y=y+(I.height/2);
       
       if ((x>=0) && (x<R.width) && (y>=0) && (y<R.height))
       {
         R.pixels[pos(int(x),int(y),R.width)]=I.pixels[pos(v,w,I.width)];
       }
    }
  }
  
  return R;
}

PImage scaleI(PImage I, float theta)
{
  PImage R=createImage(I.width,I.height,RGB);;

  R.loadPixels();
 
  float v,w;
  for (int x=0; x<I.width;x++)
  {
    for (int y=0; y<I.height;y++)
    {
       //Traslazione nel punto centrale
       int x1=x-(I.width/2);
       int y1=y-(I.height/2);
       
       //Rotazione
       v= x1*(1/theta);
       w= y1*(1/theta);
       
       //Traslazione nelle coordinate originali
       v=v+(I.width/2);
       w=w+(I.height/2);
       
       if ((v>=0) && (v<R.width) && (w>=0) && (w<R.height))
       {
         R.pixels[pos(x,y,R.width)]=I.pixels[pos(int(v),int(w),I.width)];
       }
    }
  }
  
  return R;
}

int pos(int i, int j, int w)
{
  return i*w+j;
}