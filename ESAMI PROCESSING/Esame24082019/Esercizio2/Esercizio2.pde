PImage Im;

void setup(){
  size(768, 256);
  Im=loadImage("lena.png");
  Im.resize(256, 256);
  Im.filter(GRAY);
  
  image(Im, 0, 0);
  image(tBox(Im,(int)random(16, 256)), 256, 0);
  image(tBox(Im,(int)random(16, 256), 7), 512, 0);
}

void draw(){}

PImage tBox(PImage I, int h){
  PImage R=I.copy();
  
  for(int i=0; i<h; i++){
    for(int j=0; j<h; j++){
      if(i+j < h)
        R.set(i, j, color(60));
     }
   }
    
   return R;
}
PImage tBox(PImage I, int h, int N){
  I=tBox(I,h);
  PImage R=createImage(I.width,I.height,RGB);
  PImage tmp;
  
  int off=N/2;
  float res;
  
  for(int i=0; i< I.width; i++)
  {
    for(int j=0; j< I.height; j++)
    {
      tmp=I.get(i-off,j-off,N,N);
      res=0;
      
      for(int p=0; p<tmp.width; p++)
      {
        for(int q=0; q<tmp.height;q++)
        {
          res=res+green(tmp.get(p,q));
        }
      }
      
      R.set(i,j,color(res/(N*N))); 
    }
  }
  
  return R;
}

void keyPressed(){
  if((key=='R') || (key=='r')){
    setup();
  }
}
