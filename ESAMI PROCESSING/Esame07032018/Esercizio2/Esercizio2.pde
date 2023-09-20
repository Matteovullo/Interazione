ArrayList<Spear> spears;
Baloon b;
double energy;
 
void setup()
{
   size(512,512);
   background(230,230,255);
   loop();
   energy=0;
   spears=new  ArrayList<Spear>();
   b=new Baloon(256,475);
}
 
void draw()
{
  background(230,230,255);
  
  if (keyPressed)
  {
    if (((key=='a')||(key=='A'))&&(energy>-3))
      energy-=0.2;
    if (((key=='d')||(key=='D'))&&(energy<3))
      energy+=0.2;
  }
  else
  {
    if(energy>0)
      energy-=0.05;
    else if (energy<0)
      energy+=0.05;
  }
  
  if (b.checkLimit(0,512))
  {
    energy*=-1;
  }
   
  b.run(energy);
  fill(255);
  rect(0,500,512,12);
  
  if(random(0,1)<0.1)
    spears.add(new Spear(random(12,500),-60, random(3,8)));
    
  for(Spear s:spears)
  {
    s.run();
    if (b.sp(s))
      noLoop();
  }
  
 
}

void keyPressed()
{
  if((key=='r') || (key=='R'))
    setup();
}
