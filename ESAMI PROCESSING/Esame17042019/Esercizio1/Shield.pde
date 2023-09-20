class Shield{
  float x,y,sx;
     
   Shield(float _x, float _y, float _sx){
     x=_x; y=_y; sx=_sx;
   }
     
   void display(){
     noStroke();
     fill(0,255,0);
     triangle(x,y+25,x-25,y-25,x+25,y-25);
  }
  
  void move(){
    x+=sx;
    if( x > width ){
      sx=-sx;
      x=width;
    }
    if( x < 0 ){
      sx=-sx;
      x=0;
    }
  }
  
  void run(){
    move();
    display();
  }
  
}
