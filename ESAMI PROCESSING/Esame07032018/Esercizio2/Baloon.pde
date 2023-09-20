class Baloon{
  float x, y;
  
  Baloon(float _x, float _y){
    x=_x;
    y=_y;
  }
  
  void display(){
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, 50, 50);
  }
  
  void move(double e){
    x+=e;
  }
  
  void run(double e){
    move(e);
    display();
  } 
  
  boolean checkLimit(float a, float b){
    return ((x-25<a) || (x+25>b));
  }
  
  boolean sp(Spear s){
    return (dist(s.x, s.y, x, y) < 20);
  }
  
}
