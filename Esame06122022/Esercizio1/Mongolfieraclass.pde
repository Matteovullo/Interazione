class Mongolfiera{
  float x, y, sx;
  
  Mongolfiera(){
     x=random(100, width/2);
     y=height*0.4;
     sx=random(2, 10);
  }
  
  void display(){
    fill(0, 255, 0);
    rect(x, y, 60, 30);
    fill(0, 255, 0);
    ellipse(x+30, y-50, 70, 70);
    line(x, y, x-5, y-50);
    line(x+60, y, x+65, y-50);
  }
  
  void move(){
    x+=sx;
     if(x>width){
      x=0;
    }
    if(x<0){
      x=width;
    }
  }
  
  void run(){
    move();
    display();
  }
  
}
