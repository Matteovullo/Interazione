class Bullet{
  float x, y;
  
  Bullet(float _x, float _y){
    x=_x;
    y=_y;
  }
  
  void display(){
    noStroke();
    fill(128, 0, 128);
    ellipse(x, y, 10, 10);
  }
  
  void move(){
    y-=10;
  }
  
  void run(){
    move();
    display();
  }
 
}
