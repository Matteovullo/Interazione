class Torpedo{
  float x, y, velX;
  
  Torpedo(float _x, float _y, float _velX){
    x=_x;
    y=_y;
    velX=_velX;
  }
  
  void display(){
    noStroke();
    fill(255, 0, 50);
    rectMode(CENTER);
    rect(x, y, 100, 20);
    fill(255, 0, 50);
    ellipse(X+50,y,20,20);
  }
  
  void move(){
    x+=velX;
    if(x>width){
      velX=-velX;
      x=width;
    }
    if(x<0){
      velX=-velX;
      x=0;
    }
  }
  
  void run(){
    move();
    display();
  }
  
  /*void create(){
    Smoke sm;
    int r=(int)random(10, 30);
    int r1=(int)random(0, 1);
    color c1 = color(192, 192, 192);    
    color c2 = color(128, 128, 128);
    if(r1==0)
      sm=new Smoke(x+150, y+150, r, r/5, c1);
     else
      sm=new Smoke(x+150, y+150, r, r/5, c2);
  }*/
  
  public Smoke create()
  {
    float bSize=random(10,30);
    return new Smoke(x-40,y,bSize/5,bSize,color(random(100,200)));
  }
  
}
