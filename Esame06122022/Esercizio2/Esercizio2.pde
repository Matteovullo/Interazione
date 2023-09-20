PImage I;

void setup(){
  size(512, 256);
  I=loadImage("lena.png");
  I.resize(256, 256);
  image(I, 0, 0);
  image(rev(I), 256, 0);
}

void draw(){}

void keypressed(){
  if((key=='R') || (key=='r')){
    setup();
  }
}

PImage rev(PImage I){
  
  PImage tmp1=get(0, 0, I.width/2, I.height);
  PImage tmp2=get(I.width/2, 0, I.width/2, I.height);
  
  PImage R=createImage(I.width, I.height, RGB);
  
  R.set(0, 0, tmp2);
  R.set(I.width/2, 0, tmp1);
  
  R.loadPixels();
  for(int i=0; i<R.pixels.length/2; i++){
    R.set(i, i, color(random(0, 255)));
  }
  R.updatePixels();
  
  return R;
  
}
