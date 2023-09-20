PImage I;

void setup(){
  size(768, 256);
  I=loadImage("lena.png");
  I.resize(256, 256);
  image(I, 0, 0);
  image(tBox(I, (int)random(16, 256)), 256, 0);
}

void draw(){}

PImage tBox(PImage I, int h){
  PImage R=I.copy();
  PImage tmp=get(0, 0, h, h);
  
  for(int j=0; j<h; j++){
    for(int i=0; i<h-j; i++){
       tmp.set(j ,i, color(128));
    }
   }
   
  R.set(0, 0, tmp);
  return R;
}

void keyPressed(){
  if((key=='R') || (key=='r')) setup();
}
