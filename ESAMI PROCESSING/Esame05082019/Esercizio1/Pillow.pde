class Pillow{
  float x, y, w, h, sx;
  
  Pillow(float _x, float _y, float _w, float _h){
    w=_w;
    h=_h;
    sx=2;
    x=_x;
    y=_y;
  }
  
  void display(){
    noStroke();
    fill(255, 255, 255);
    rect(x, y, w, h);
  }
  
  void move(){
    x+=sx;
    if( x > width){
      sx=-sx;
      x=0;
    }
    if( x < 0){
      sx=-sx;
      x=0;
    }
  }
  
  void run(){
    move();
    display();
  }
 
}
