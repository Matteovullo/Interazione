class Planet
{
  float posX,posY,size;
  color col;
  Satellite sat;
  
  Planet(float X,float Y, float s, color c)
  {
    posX=X;
    posY=Y;
    size=s;
    col=c;
    sat=new Satellite(X,Y,2*size);
  }
  
  void display()
  {
    noStroke();
    fill(col);
    ellipse(posX,posY,size,size);
  }
  
  void move()
  {
    posX=posX+random(-0.5,0.5);
    posY=posY+random(-0.5,0.5);
    sat.moveCenter(posX,posY);
  }
  
  void run()
  {
    move();
    sat.run();
    display();
  }
  
}