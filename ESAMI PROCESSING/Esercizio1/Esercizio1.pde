Ball b, hb;

void setup(){
  size(512, 256);
  b=new Ball(random(0, width/2), random(0, height), 40);
  hb=new HyperBall(random(width/2, width), random(0, height), 40);
}

void draw(){
  background(255);
  b.run();
  hb.run();
}

void keyPressed(){
  if((key=='R') || (key=='r')){
    setup();
  }
}
