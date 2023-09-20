class Spike{
  float x, y, sx, d;
  boolean stato;
  
  Spike(float _x, float _y,float _sx,float _d){
    x=_x;
    y=_y;
    sx=_sx;
    d=_d;
    stato=false;
  }
  
  void dispay(){
    fill(255, 0, 50);
    ellipse(x, y, d, d);
  }
  
  void move(){
    x+=sx;
    if(x>width){
      sx=-sx;
      x=width;
    }
    if(x<0){
      sx=-sx;
      x=0;
    }
  }
  
  void run(){
    move();
    display();
  }
 
}
