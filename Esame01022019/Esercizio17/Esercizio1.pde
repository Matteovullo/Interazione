Ball b, hb;
int h;

void setup(){
  size(512, 256);
  h=width/2;
  b=new Ball(random(1, h), random(1, height), 40);
  hb=new HyperBall(random(h, width), random(1, height), 40);
}

void draw(){
  background(255);
  b.run();
  hb.run();
}

void keyPressed(){
  if((key=='R') || (key=='r'))
    setup();
}
