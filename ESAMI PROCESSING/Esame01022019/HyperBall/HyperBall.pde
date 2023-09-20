class HyperBall extends Ball{
  color c;
  
  HyperBall(float x, float y, float r){
    super(x, y, r);
    c=color(0, 0, 255);
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(x,y,r*2,r*2);
  }
  
  void check(){
    if(dist(mouseX,mouseY,x,y)<r)
      c=color(random(0,255),random(0,255),random(0,255));
  }
  
  void run(){
    check();
    super.run();
  }
}
