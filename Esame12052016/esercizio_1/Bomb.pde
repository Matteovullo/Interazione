class Bomb
{
  float posX, posY, sy;
  
  Bomb(float x, float y, float power)
  {
    posX=x;
    posY=y;
    sy=power;
  }
  
  void move()
  {
    posY-=sy;
  }
  
  void display()
  {
    fill(0,0,60);
    if (sy>8) fill(0,128,0);
    if (sy>18) fill(255,0,0);
    noStroke();
    ellipse(posX,posY, 18,18);
  }
  
  void run()
  {
    move();
    display();
  }
}