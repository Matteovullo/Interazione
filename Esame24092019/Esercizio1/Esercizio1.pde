Heart h, bh;

void setup(){
  size(300, 300);
  h=new Heart(random(0, width), random(0, height), random(-5, 5), random(-5, 5));
  bh=new BlueHeart(random(0, width), random(0, height), random(-3, 3), random(-3, 3));
}

void draw(){
  background(0, 100, 255);
  h.run();
  bh.run();
}
