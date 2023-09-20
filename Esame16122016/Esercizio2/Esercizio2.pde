ArrayList<Planet> planets;

void setup()
{
  size(500,500);
  planets=new ArrayList();
}

void draw()
{
  fill(0,40);
  rect(0,0,500,500);
  
  for(Planet p:planets)
  {
    p.run();
  }
  
}

void keyPressed()
{
  if((key=='n')||(key=='N'))
  {
    planets.add(new Planet(random(50,450),random(50,450),random(15,45),color(255,255,random(0,255))));
  }
}
