Heart h, bh;

void setup(){
  size(300, 300);
  h= new Heart(random(1, width), random(1, height), random(-5, 5), random(-5, 5));
  bh= new BlueHeart(random(1, width), random(1, height), random(-3, 3), random(-3, 3));
}

void draw(){
  background(0, 0, 255);
  h.run();
  bh.run();
}
  
void keyPressed(){
  if((key=='R') || (key=='r'))
    setup();
}
