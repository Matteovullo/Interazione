class EnergySpot
{
  float posX,posY;
  
  EnergySpot(float x, float y)
  {
    posX=x;
    posY=y;
  }
  
  void display()
  {
    noStroke();
    fill(0,128,255);
    ellipse(posX,posY,30,30);
  }
}

class Alien
{
  float posX;
  float posY;
  float energia;
  float L;
  boolean vivo;
  boolean arrivato;
  
  Alien(float x, float y, float e,float d)
  {
    posX=x;
    posY=y;
    energia=e;
    L=d;
    vivo=true;
  }
  
  void display()
  {
    rectMode(CENTER);
    fill(0, (vivo)?255:0 ,0);
    rect(posX,posY,L,L);
  }
  
  EnergySpot scegliSpot(EnergySpot[] spots)
  {
    EnergySpot vicino=spots[0];
    float min=dist(posX,posY,spots[0].posX,spots[0].posY);
    float d;
    
    for(int i=1;i<spots.length;i++)
    {
      d=dist(posX,posY,spots[i].posX,spots[i].posY);
      if (d<min)
      {
        min=d;
        vicino=spots[i];
      }
    }
    
    return vicino;
  }
  
  void muovi(EnergySpot[] spots)
  {
    EnergySpot vicino=scegliSpot(spots);
    
    float d=dist(posX,posY,vicino.posX,vicino.posY);    
    float sx=-((posX-vicino.posX)/d)*3;
    float sy=-((posY-vicino.posY)/d)*3;
    
    posX+=sx;
    posY+=sy;
    energia-=0.01;
  }
  
  void checkDeath()
  {
    vivo=energia>0;
  }
  
  void checkArrive(EnergySpot[] spots)
  {
    EnergySpot vicino=scegliSpot(spots);
    
    arrivato=dist(posX,posY,vicino.posX,vicino.posY)<10;
  }
  
  void run(EnergySpot[] spots)
  {
    if((vivo)&&(!arrivato))
      muovi(spots);
      
    checkDeath();
    checkArrive(spots);
    display();
  }
}

int k;
int h;

EnergySpot[] spots;
Alien[] aliens;
void setup()
{
  size(512,512);
  h=round(random(1,5));
  k=round(random(7,19));
  
  spots=new EnergySpot[h];
  
  for(int i=0; i<h;i++)
  {
    spots[i]=new EnergySpot(random(0,width),random(0,height));
  }
  
  aliens=new Alien[k];
  
  for(int i=0; i<k;i++)
  {
    aliens[i]=new Alien(random(0,width),random(0,height),random(0,1),random(5,20));
  }
  
}

void draw()
{
  background(255);
  
   for(int i=0;i<h;i++)
  {
    spots[i].display();
  }
  
  for(int i=0;i<k;i++)
  {
    aliens[i].run(spots);
  }
  
}

void keyPressed()
{
  if ((key=='R') || (key=='r'))
    setup();
}
  
