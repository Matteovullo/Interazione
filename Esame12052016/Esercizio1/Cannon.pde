class Cannon{
  float x, y;
  
  Cannon(float _x, float _y){
    x=_x;
    y=_y;
  }
  
  Cannon()
  {
    x=mouseX;
    y=mouseY;
  }
  
  void display(){
    noStroke();
    fill(128);
    rect(x, y, 20, 80);
    noStroke();
    fill(128);
    ellipse(x+10, y+80, 10, 10);
  }
  
  void move(){
    x=mouseX;
    y=mouseY;
  }
  
  Bomb shot(float v){
    return new Bomb(x, y-20, v);
  }
  
  void run(){
    move();
    display();
  }
  
}
    
