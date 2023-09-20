class Cannon
{
  float posX;
  float posY;
  
  Cannon()
  {
    posX=mouseX;
    posY=mouseY;
  }
  
  void display()
  {
    noStroke();
    fill(128);
    pushMatrix();
    
    rectMode(CENTER);
    rect(posX, posY, 20, 80);
    ellipse(posX,posY+40,10,10);
    
    popMatrix();
  }
  
  Bomb shot(float power)
  {
    return new Bomb(posX, posY-20,power);
  }
  
  void move()
  {
    posX=mouseX;
    posY=mouseY;
  }
  
  void run()
  {
    move();
    display();
  }
  
  
}