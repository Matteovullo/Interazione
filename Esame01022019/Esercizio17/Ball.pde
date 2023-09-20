class Ball{
  float x, y, sy, r;
  
  Ball(float _x, float _y, float _r){
    x=_x;
    y=_y;
    r=_r;
    sy=5;
  }
  
  void display(){
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, r*2, r*2);
  }
  
  void move(){
    y+=sy;
    if(y>height){
      y=height;
      sy=-sy;
    }
    if(y<0){
      y=0;
      sy=-sy;
    }
  }
  
  void run(){
    move();
    display();
  }
  
}
