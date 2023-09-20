class Asteroid{
   float x, y, sx, sy;
   boolean stato;
   
   Asteroid(float _x, float _y, float _sx, float _sy){
     x=_x;
     y=_y;
     sx=_sx;
     sy=_sy;
     stato=true;
   }
   
   void display(){
     stroke(255, 255, 0);
     strokeWeight(6);
     if(stato) fill(128, 0, 0);
     if(!stato) fill(128, 128, 128);
     ellipse(x, y, 50, 50);
   }
   
   void move(){
     x+=sx;
     y+=sy;
     if(!stato) sy+=0.2;
   }
  
   
   void run(){
     move();
     display();
   }
   
   void check(Bullet B){
    if(dist(x,y,B.x,B.y)<25) stato=false;
  } 
   
}
