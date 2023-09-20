int hX;
Ball b, bh;
void setup(){
  size(512, 256);
   hX=width/2;
  b=new Ball(random(1,hX),random(1,height),40);
  hb=new HyperBall(random(hX,width),random(1,height),40);
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
