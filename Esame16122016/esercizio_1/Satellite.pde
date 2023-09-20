class Satellite
{
  float centerX, centerY;
  float distance;
  float R;
  
  Satellite(float X, float Y, float d)
  {
    centerX=X;
    centerY=Y;
    distance=d;
    R=random(0,360);
  }
  
  void moveCenter(float X, float Y)
  {
    centerX=X;
    centerY=Y;
  }
  
  void display()
  {
    fill(200,200,255);
    noStroke();
    
    pushMatrix();
    translate(centerX,centerY);
    rotate(radians(R));
    ellipse(distance,0,10,10);
    popMatrix();
    
  }
  
  void move()
  {
    R=R+5;
  }
  
  void run()
  {
    move();
    display();
  }
}