class Ball{
  float posX, posY, raggio, sy;
  
  Ball(float x, float y, float r){
    this.posX = x;
    this.posY = y;
    this.raggio = r;
    this.sy=5;
  }
  
  void display(){
    noStroke();
    fill(255, 0, 0);
    ellipse(posX, posY, r*2, r*2);
  }
    
  void move(){
      posY+=sy;
      if(posY > height){
        sy=-sy;
        posY=height;
      }
      if(posY<0){
        sy=-sy;
        y=0;
      }
  }
  
  void run(){
    move();
    display();
  }
}
