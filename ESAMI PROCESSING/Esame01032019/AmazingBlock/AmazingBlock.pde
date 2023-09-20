class AmazingBlock extends Block{
  float a;
   AmazingBlock(float _x, float _y, float we, float he){
     super(_x, _y, we, he);
     a=random(0, 360);
   }
   
   void dislpay(){
    noStroke();
    rectMode(CENTER);
    fill(a%256,255-(a%256),255);
    
    pushMatrix();
    translate(x,y);
    rotate(radians(a));
    rect(0,0,w,h);
    popMatrix();
   }
   
   void move(){
     a+=5;
     super.move();
   }
   

   
   
}
