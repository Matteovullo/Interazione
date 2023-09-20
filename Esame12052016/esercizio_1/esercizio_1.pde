Cannon c;
ArrayList<Bomb> bombs= new ArrayList<Bomb>();
float power;

void setup()
{
  background(255);
  size(500,500);
  c=new Cannon();
  power=2;
}

void draw()
{
  background(255);
  
  fill(0,255,0);
  noStroke();
  rectMode(CORNER);
  rect(10,20,power*4,20);
  
  stroke(0);
  noFill();
  rectMode(CORNER);
  rect(10,20,100,20);
  
  fill(0);
  text(int(power),10,60);
  
  if ((mousePressed)&&(power<25))
  {
    if(mouseButton==LEFT)
        power+=0.25; 
  }
  
  for (Bomb b:bombs)
  {
    b.run();
  }
  
  c.run();
}

void mouseReleased()
{
  if(mouseButton==LEFT)
  {
    bombs.add(c.shot(power));
    power=2;
  }
}