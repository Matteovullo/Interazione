int h;
Block b, ab;

void setup(){
  size(256, 512);
  h=height/2;
  b=new Block(random(1, width), random(1, h), 40, 60);
  ab=new AmazingBlock(random(1,width), random(h, height), 40, 60);
}

void draw(){
  background(255);
  b.run();
  ab.run();
}

void keyPressed(){
  if((key=='R') || (key=='r')){
    setup();
  }
}
