PImage I;

void setup(){
  size(512, 256);
  I=loadImage("lena.png");
  I.resize(256, 256);
  image(I, 0, 0);
  image(wow(I), 256, 0);
}

void draw(){
 
}

PImage wow(PImage I){
  PImage R = createImage(I.width, I.height, RGB);
  PImage tmp1 = I.get(I.width/2, 0, I.width/2, I.height);
  PImage tmp2 = I.get(0, 0, I.width/2, I.height);
  R.set(0, 0, tmp1);
  R.set(I.width/2, 0, tmp2);
  
  float r, g, b;
  float window = R.pixels.length*random(1,100)/100;
  
  for(int i=0; i<window; i++){
    r = red(R.pixels[i]);
    g = green(R.pixels[i]);
    b = blue(R.pixels[i]);
    
    R.pixels[i] = color(b,g,r);
  }
  
  for(int i=(int)window; i<R.pixels.length; i++){
    r = red(R.pixels[i]);
    g = green(R.pixels[i]);
    b = blue(R.pixels[i]);
    
    R.pixels[i] = color(r,b,g);
  }
  
  R.updatePixels();
  
  return R;
}

void keyPressed(){
  if((key=='R') || (key=='r')){
    setup();
  }
}
