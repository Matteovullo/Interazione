class Blob{
 float x, y, sy;
 color c;
 boolean stato;
 
 Blob(float _x, float _y, float _sy, color _c){
   x=_x;
   y=_y;
   sy=_sy;
   c=_c;
   stato=true;
 }
 
 void display(){
   if(stato) fill(c);
   else fill(128, 128, 128);
   pushMatrix();
   translate(x,y);
   rotate(radians(sy));
   bezier(x, y, x+25, y, x, y+25, x, y);
   popMatrix();
 }
 
 void move(){
  if(stato){
     y+=sy;
     if(y>height){
       sy=-sy;
       y=height;
     }
     if(y<0){
       sy=-sy;
       y=0;
     }
  }
  
    if(stato){
       y+=sy;
       if(y>height){
         sy=-sy;
         y=height;
       }
       if(y<0){
         sy=-sy;
         y=0;
       }
       sy+=0.2;
    }
     
  }
   
   void run(){
     move();
     display();
   }
   
}
