class Planet{
  float x, y, s;
  color c;
  Satellite sa;
  
  Planet(float _x, float _y, float _s, color _c){
    x=_x;
    y=_y;
    s=_s;
    c=_c;
    sa=new Satellite(x, y, s*2);
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(x, y, s, s);
  }
  
  void move(){
    x+=random(-0.5, 0.5);
    y+=random(-0.5, 0.5);
    sa.change(x, y);
  }
  
  void run(){
    move();
    sa.run();
    display();
  }
  

}
