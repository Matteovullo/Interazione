class Satellite{
  float x, y, d, r;
  
  Satellite(float _x, float _y, float _d){
    x=_x;
    y=_y;
    d=_d;
    r=random(0, 360);
  }
  
  void display(){
    noStroke();
    fill(200, 200, 255);
    pushMatrix();
    translate(x, y);
    rotate(radians(r));
    ellipse(d, 0, 10, 10);
    popMatrix();
  }
  
  void change(float _x, float _y){
    x=_x;
    y=_y;
  }
  
  void move(){
    r+=5;
  }
  
  void run(){
    move();
    display();
  }
  
}
  
  
