class MongolfieraMotorizzata extends Mongolfiera{
  color c;
  
  MongolfieraMotorizzata(){
    super();
    super.y=height*0.7;
    super.sx=125/2;
    c=(int)random(0, 255);
  }
  
  void display(){
    fill(c);
    rect(x, y, 60, 30);
    fill(c);
    ellipse(x+30, y-50, 70, 70);
    line(x, y, x-5, y-50);
    line(x+60, y, x+65, y-50);
  }
  
  void move(){
     x+=sx;
     if(x>width){
      x=width;
      sx=-sx;
    }
    if(x<0){
      x=0;
      sx=-sx;
    }
  }
  
  void run(){
    move();
    display();
  }
  
}
