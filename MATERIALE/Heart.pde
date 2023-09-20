class Heart
{
  String move;
  float x, y, l, speed;
  
  Heart(float x, float y, float l, float speed)
  {
    this.x = x;
    this.y = y;
    this.l = l;
    this.speed = speed;
  }
  
  Heart(float x, float y, float l, float speed, String move)
  {
    this.x = x;
    this.y = y;
    this.l = l;
    this.speed = speed;
    this.move = move;
  }
  
  void display()
  {
    strokeWeight(5);
    stroke(255, 0, 0);
    fill(255, 0, 0);
    bezier(x,y,x-30,y-30,x-30,y+30,x,y+30);
    bezier(x,y,x+30,y-30,x+30,y+30,x,y+30);
    
    if(move == "vertical")
      vertical();
      
    if(move == "horizontal")
      horizontal();
      
    if(move == "gravity")
      gravity();
    
    if(move == "randomized")
      exit();
  }
  
  //GRAVITÀ
  void gravity()
  {
    float gravity = 0.1;
    y += speed;
    speed += gravity;
    if (y+(l/2) >= height)
    {
      speed *= -0.95;
      y = height - (l/2);
    }
  }
  
  //PIO VERTICALE
  void vertical()
  {
    y += speed;
    if(y+(l/2) > height || y-(l/2) < 0)
      speed = -speed;
  }
  
  //PIO ORIZZONTALE
  void horizontal()
  {
    x += speed;
    if(x+(l/2) > width || x-(l/2) < 0)
      speed = -speed;
  }
  
  //ESCE A DX E RIENTRA A SX
  void exit()
  {
    x += speed;
    if(x+(l/2) > width)
      x = -l/2;
  }
  
  //ROTAZIONE E RIVOLUZIONE
  
  /*
    translate(width/2, height/2);   // Move coordinate system to center of sketch
    rotate(millis() * 0.001 * TWO_PI / 10.0);   // Move 360 degrees in ten second
    translate(80, 0); // Move away from the center
    rotate(millis() * 0.001 * TWO_PI);    // One revolution every second
  */
}
