class Gun{
  float x, float y;
  
  Gunt(float _x, float _y){
    x=_x;
    y=_y;
  }
  
  void display(){
    fill(128, 128,128);
    rect(x, y, 20, 70);
  }
  
  void move(){
    x+=mouseX;
    
  void run(){
    move();
    display();
  }
  
  Bullet shot(){
    return Bullet(x, y-25); 
  }
  
}
