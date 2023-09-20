class BlueHeart extends Heart{
  BlueHeart(float _x, float _y, float _sx, float _sy){
    super(_x, _y, _sx, _sy);
  }
  
  void display(){
    noStroke();
    if(check())
        fill(120,120,120);
    else
        fill(50,50,255);
    
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
   
  boolean check(){
    return dist(mouseX,mouseY, x, y-30)<30;
  }
  
  void run(){
    if(!check())
      move();
    display();
  }

}
