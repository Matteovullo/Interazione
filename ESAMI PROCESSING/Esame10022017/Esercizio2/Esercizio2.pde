int S;
PImage I;

void setup(){
  size(512, 256);
  I=loadImage("lena.png");
  I.resize(256, 256);
  I.filter(GRAY);
  S=2;
  image(I, 0, 0);
  image(jonnyFilter(I, S), 256, 0);
   textSize(20);
  text(S,500,20);
}

void draw(){}

PImage jonnyFilter(PImage I, int n){
    PImage R=createImage(I.width, I.height, RGB);
    PImage tmp;
    float max;
    float min;
    
    R.loadPixels();
    I.loadPixels();
    
    for(int i=0; i<R.width; i++){
      for(int j=0; j<R.height; j++){
      tmp=I.get(max(i-(n/2), 0), max(j-(n/2), 0), min(n, I.width), min(n, I.height-j));
      tmp.loadPixels();
      
      max=green(tmp.pixels[0]);
      min=green(tmp.pixels[0]);
      
      for(int h=0; h<tmp.pixels.length; h++){
        if(tmp.pixels[h]<min) min=green(tmp.pixels[h]);
        if(tmp.pixels[h]>max) max=green(tmp.pixels[h]);
      }
      
      R.set(i, j, color((max)-(min)));
      }
    }
   
   R.updatePixels();
   return R;
        
}

void keyPressed()
{
  if((key=='+')&&(S<9))
  {
    S++;
    image(jonnyFilter(I,S),I.width,0);
    text(S,500,20);
  }
  
  if((key=='-')&&(S>2))
  {  
    S--;
    image(jonnyFilter(I,S),I.width,0);
    text(S,500,20);
  }
}
