class Smoke{
   float x, y, vel, d;
   color c;
   
   Smoke(float _x, float _y, float _vel, float _d, color _c){
     x=_x;
     y=_y; 
     vel=_vel;
     d=_d;
     c=_c;
   }
   
   void display(){
     noStroke();
     fill(c);
     ellipse(x, y, d, d);
   }
   
   void move(){
     y+=vel;
     if(vel>height){
       vel=-vel;
       y=height;
     }
     if(vel<0){
       vel=-vel;
       y=0;
     }
   }
   
   void run(){
     move();
     display();
   }
}
