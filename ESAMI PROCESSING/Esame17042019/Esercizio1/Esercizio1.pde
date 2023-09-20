Shield s, gs;
float h;

void setup(){
  size(256, 512);
  h=height/2;
  s= new Shield(random(1, width), random(1, h), random(-5, 5));
  gs= new GreatShield(random(1, width), random(h, height), random(-5, 5));
}

void draw(){
  background(0);
  s.run();
  gs.run();
}
  

void keyPressed(){
  if((key=='R') || (key=='r'))
    setup();
}
