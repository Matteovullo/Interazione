Mongolfiera m, mm;

void setup(){
  size(512, 512);
  m=new Mongolfiera();
  mm=new MongolfieraMotorizzata();
}

void draw(){
  background(255);
  m.run();
  mm.run();
}

void keyPressed(){
  if((key=='R') || (key=='r')) setup();
}
