class Cifra
{
  char c = ' ';
  float x, y, sy, speed, gravity;
  
  Cifra(float x, float y, float sy, char c)
  {
    this.x = x;
    this.y = y;
    this.sy = sy;
    this.c = c;
    speed = 0;
    gravity = 0.1;
  }
  
  void display()
  {
    stroke(#A1D115);
    textSize(32);
    text(c, x, y);
  }
  
  void move()
  {
    y = y + speed;
    speed = speed + gravity;
    if (y > height)
    {
      speed = speed * -0.95;
      y = height;
    }
  }
  
  void run()
  {
    display();
    move();
  }
}
