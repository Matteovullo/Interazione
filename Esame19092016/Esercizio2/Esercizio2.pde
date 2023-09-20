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

PImage channel(PImage I, char c){
  PImage R=I.copy();
  
  R.loadPixels();
  I.loadPixels();
  
  for(int i=0; i<R.pixels.length; i++){
    if(c == 'r') R.pixels[i]=color(red(I.pixels[i]), red(I.pixels[i]), red(I.pixels[i]));
    if(c == 'g') R.pixels[i]=color(green(I.pixels[i]), green(I.pixels[i]), green(I.pixels[i]));
    if(c == 'b') R.pixels[i]=color(blue(I.pixels[i]), blue(I.pixels[i]), blue(I.pixels[i]));
  }
  
  R.updatePixels();
  return R;
}

PImage changeColor(PImage I, char c, int n){
   
 PImage R=I.copy();
  
  R.loadPixels();
  I.loadPixels();
  
  for(int i=0; i<R.pixels.length; i++){
  if(c == 'r') R.pixels[i]=color(red(I.pixels[i])+n, green(I.pixels[i]), blue(I.pixels[i]));
    if(c == 'g') R.pixels[i]=color(red(I.pixels[i]), green(I.pixels[i])+n, blue(I.pixels[i]));
    if(c == 'b') R.pixels[i]=color(red(I.pixels[i]), green(I.pixels[i]), blue(I.pixels[i])+n);
  }
  
  R.updatePixels();
 
 return R;
}
