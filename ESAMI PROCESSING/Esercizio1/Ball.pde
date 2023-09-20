class Ball{
  float x, y, R, sy;
  
  Ball(float _x, float _y, float _r){
    x=_x;
    y=_y;
    R=_r;
    sy=2;
  }
  
  void display(){
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, R*2, R*2);
  }
  
  void move(){
    y+=sy;
    if(y>height){
      sy=-sy;
      y=height;
    }
    if(y<0){
      sy=-sy;
      y=0;
    }
  }
  
  void run(){
    move();
    display();
  }
 
}
