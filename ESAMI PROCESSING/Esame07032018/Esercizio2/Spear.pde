class Spear{
  float x, y, sy;
  
  Spear(float _x, float _y, float _sy){
    x=_x;
    y=_y;
    sy=_sy;
  }
  
  void dislpay(){
    noStroke();
    fill(170, 170, 255);
    triangle(x, y, x-25, y+40, x-25, y+40);
  }
  
  void move() {
    y+=sy;
  }
  
  void run(){
    move();
    dislpay();
  }
  
}
