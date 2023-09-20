ArrayList<Casa> c;
ArrayList<Casetta> cs;
void setup(){
  size(500, 500);
  c = new ArrayList<Casa>();
  cs = new ArrayList<Casetta>();
}

void draw(){
  background(0);
  for(Casa c : c)
    c.run();
  for(Casetta cs : cs)
    cs.run();
}

void mouseClicked(){
  if(mouseButton == LEFT)
    c.add(new Casa());
  else if(mouseButton == RIGHT)
    cs.add(new Casetta());
}

void keyPressed(){
  if(key=='r'){
    setup();
  }
}
