PImage Im;
int N=1;
int K;
void setup()
{
  frameRate('a'-60);
  size(1024,512);
  Im=loadImage("lena.png");
  image(Im,0,0);
  image(grid(Im,int(pow(N,2))),512,0);
  K=0;
}

void draw()
{
  K++;
  if(K==20+3)
  {
    N++;
    if(N==8)
      N=1;
    image(grid(Im,int(pow(2,N))),512,0);
    K=0;
  }
}

PImage grid(PImage I, int n)
{
  PImage R=I.copy();
  PImage tmp;
  int nW=I.width/n;
  int nH=I.height/n;
  
  for (int i=0;i<n;i++)
  {
    for(int j=0;j<n;j++)
    {
      tmp=I.get(i*nW,j*nH,nW,nH);
      tmp=stretching(tmp);
      R.set(i*nW,j*nH,tmp);
    }
  }

  return R;
}

//Stretching Lineare Istogramma
PImage stretching(PImage I)
{
  PImage R=createImage(I.width,I.height,RGB);
  
  I.loadPixels();
  R.loadPixels();
  
  float[] mins={255,255,255};
  float[] maxs={0,0,0};
  float[] tmps={0,0,0};
  
  for(int i=0; i<R.pixels.length;i++)
  {
    for(int k=0; k<3;k++)
    {
      switch(k)
      {
        case 0: tmps[k]=red(I.pixels[i]); break;
        case 1: tmps[k]=green(I.pixels[i]); break;
        case 2: tmps[k]=blue(I.pixels[i]); break;
      }
           
      if(tmps[k]<mins[k])
        mins[k]=tmps[k];
 
      if(tmps[k]>maxs[k])
        maxs[k]=tmps[k];
    }
    
  }
  
  for(int i=0; i<R.pixels.length;i++)
  {
    tmps[0]=red(I.pixels[i]);
    tmps[0]=((tmps[0]-mins[0])/(maxs[0]-mins[0]))*255;
    tmps[1]=green(I.pixels[i]);
    tmps[1]=((tmps[1]-mins[1])/(maxs[1]-mins[1]))*255;
    tmps[2]=blue(I.pixels[i]);
    tmps[2]=((tmps[2]-mins[2])/(maxs[2]-mins[2]))*255;
    
    R.pixels[i]=color(tmps[0],tmps[1],tmps[2]);
  }
  
  R.updatePixels();
  return R;
}