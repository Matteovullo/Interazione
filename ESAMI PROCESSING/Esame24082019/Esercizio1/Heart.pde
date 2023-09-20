class Heart{
  float x, y, sx, sy;
  
  Heart(float _x, float _y, float _sx, float _sy){
    x=_x;
    y=_y;
    sx=_sx;
    sy=_sy;
  }
  
  void display(){
    noStroke();
    fill(255, 0, 0);
    
    pushMatrix();
    translate(x,y);
    rotate(radians(25));
    bezier(0,0,-50,-60,50,-60,0,0);
    popMatrix();
      
    pushMatrix();
    translate(x,y);
    rotate(radians(-25));
    bezier(0,0,-50,-60,50,-60,0,0);
    popMatrix();
   }
  
   void move(){
    x+=sx;
    y+=sy;
    if( x > width){
      sx=-sx;
      x=width;
    }
    if( x < 0){
      sx=-sx;
      x=0;
    }
    if( y > height){
      sy=-sy;
      y=height;
    }
    if( y < 0){
      sy=-sy;
      y=height;
    }
  }
  
  void run(){
    move();
    display();
  }
  
}
    
