class Block{
  float x, y, w, h, sx;
  
  Block(float we, float he, float _x, float _y){
    x=_x;
    y=_y;
    sx=4;
    w=we;
    h=he;
  }
  
  void display(){
    noStroke();
    fill(#00FF28); // fill(0, 255, 0);
    rectMode(CENTER);
    rect(x, y,w, h);
  }
  
  void move(){
    x+=sx;
    if(x > width){
      sy=-sy;
      w=width;
    }
    if(x < 0){
      sx=-sx;
      x=0;
    }
  }
  
  void run(){
    move();
    display();
  }
  
}
