class GreatShield extends Shield{
  float scale, k;
  GreatShield(float _x, float _y, float _sx){
    super(_x, _y, _sx);
    scale=0.5;
    k=0.05;
  }
  
  void display(){
    stroke(255, 255, 0);
    fill(255, 0, 0);
    
    pushMatrix();
    translate(x, y);
    scale(scale);
    triangle(0, 25, -25, -25, 25, -25);
    popMatrix();
  }
  
  void move(){
    scale+=k;
    if(scale > 2){
     scale = 0.05;
     k=-k;
    }else if(scale < 0.05){
      scale=0.5;
      k=-k;
    }
    super.move();
  }
}
