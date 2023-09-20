Pillow p, sp;
float h;

void setup(){
  size(256, 512);
  h=height/2;
  p= new Pillow(random(1, width), random(1, h), 40, 80);
  sp=new SuperPillow(random(1, width), random(h, height), 40, 80);
}

void draw(){
  background(0);
  p.run();
  sp.run();
}

void keyPressed(){
  if((key=='R') || (key=='r'))
    setup();
}
