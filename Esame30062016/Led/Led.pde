Class Led{
  float x, y;
  color c;
  boolean stato;
  
  Led(float _x, float _y, color _c){
    x=_x;
    y=_y;
    c=_c;
    stato=true;
  }
  
  void change(){
    if(stato) stato=true;
    else stato=false;
  }
  
  void display(){
    noStroke();
    if(!stato){
      fill(255);
      ellipse(x, y, 10, 10);
    }else{
      fill(c);
      ellipse(x, y, 10, 10);
    }
  }
 
}
 
  
