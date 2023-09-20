PImage I;
PImage imRep;
int R;

void setup(){
  size(512, 300);
  I=loadImage("lena.png");
  I.resize(256, 256);
  R=0;
  
  image(I, 0, 0);
  image(dropResolution(I, R), 256, 0);
  stroke(255);
  textSize(15);
  textAlign(CENTER);
  text("Degrado= "+ R,256,280 );
}

void draw(){}
  

void keyPressed()
{
  if (key=='+' && R<8)
  {
    background(0);
    R++;
    imRep=dropResolution(I,R);
    image(I,0,0);
    image(imRep,256,0);
    text("Degrado= "+ R,256,280);
  }
  
  if (key=='-' && R>0)
  {
    R--;
    background(0);
    imRep=dropResolution(I,R);
    image(I,0,0);
    image(imRep,256,0);
    text("Degrado= "+ R,256,280);
  }
  
}

PImage downScale(PImage I){
  PImage R=createImage(I.width/2, I.height/2, RGB);
  
  R.loadPixels();
  
  for(int i=0;i< R.width;i++)
  {
    
    for(int j=0; j<R.height ;j++)
    {
      R.set(i,j,I.get(i*2,j*2));
    }
  }
  
  
  R.updatePixels();
  return R;
}

PImage upScale(PImage I){
  PImage R=createImage(2*I.width,2*I.height,RGB);
  
  for(int x=0; x<I.width; x++)
  {
    for(int y=0; y<I.height;y++)
    {
      
      R.set(2*x,2*y,I.get(x,y));
      
      R.set(2*x+1,2*y,I.get(x,y));
      R.set(2*x,2*y+1,I.get(x,y));
      R.set(2*x+1,2*y+1,I.get(x,y));
      
    }
  }
  
  return R;
}


PImage dropResolution(PImage I, int n){
 PImage tmp=I.copy();
 
 for(int i=0; i<n; i++){
   tmp=downScale(tmp);
 }
 
 for(int i=0; i<n; i++){
   tmp=upScale(tmp);
 }
 
 return tmp;
 
}
