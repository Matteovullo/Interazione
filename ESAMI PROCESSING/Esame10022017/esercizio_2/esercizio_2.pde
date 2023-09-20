PImage imO;
int S;           
void setup()
{
  size(512,256);
  imO=loadImage("lena.png");
  imO.filter(GRAY);
  imO.resize(imO.width/2,imO.height/2);
  S=2;
  image(imO,0,0);
  image(jonnyFilter(imO,S),imO.width,0);
  textSize(20);
  text(S,500,20);


}

void draw()
{
  
  
}


void keyPressed()
{
  if((key=='+')&&(S<9))
  {
    S++;
    image(jonnyFilter(imO,S),imO.width,0);
    text(S,500,20);
  }
  
  if((key=='-')&&(S>2))
  {  
    S--;
    image(jonnyFilter(imO,S),imO.width,0);
    text(S,500,20);
  }
}



PImage jonnyFilter(PImage I, int N)
{
  int off=N/2;
  PImage R=createImage(I.width,I.height,RGB);
  PImage tmp;
  float[] tmpF;
  int size;
  
  for(int i=0; i <I.width;i++)
  {
    for(int j=0;j<I.height;j++)
    {
      //Seleziono sottoimmagine NxN gestendo il caso limite
      tmp=I.get( max(i-off,0) , max(j-off,0) , min(N,I.width-i) , min(N,I.height-j) );
      
      tmp.loadPixels();
      size=tmp.pixels.length;
      
      tmpF=new float[size];
      
      for (int k=0;k<size;k++)
      {
        tmpF[k]=green(tmp.pixels[k]);
      }
     
      R.set(i,j,color(max(tmpF)-min(tmpF)));
      
    }
  }
  
  return R;
}