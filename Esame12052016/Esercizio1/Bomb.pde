class Bomb{
  float x, y, sy;
  
  Bomb(float _x, float _y, float _sy){
    x=_x;
    y=_y;
    sy=_sy;
  }
  
  void move(){
    y-=sy;
  }
  
  void display(){
    noStroke();
    if(sy>18) fill(255, 0, 0);
    else if(sy<18 && sy>8) fill(0, 255, 0);
    else fill(0, 0, 255);
    ellipse(x, y, 18, 18);
  }
  
  void run(){
    move();
    display();
  }
  
}
    
