ArrayList<Smoke> smokes;
ArrayList<Torpedo> torpedos;
void setup()
{
  size(500,500);
  smokes=new ArrayList<Smoke>();
  torpedos=new ArrayList<Torpedo>();
}

void draw()
{
  background(0,150,255);
  
  
  for(Smoke S:smokes)
  {
    S.run();
  }
  
  for(Torpedo T:torpedos)
  {
    if (random(0,1)<0.50)
      smokes.add(T.create());
    T.run();
  }
}

void keyPressed()
{
  if ((key=='n')||(key=='N'))
    torpedos.add(new Torpedo(-50,random(50,450),random(5,10)));
}
