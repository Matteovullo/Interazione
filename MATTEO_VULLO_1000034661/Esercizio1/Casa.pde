class Casa{
  float x, y, sx, l;
  
  Casa(){
    x = random(30, width); 
    y = random(30, height); 
    sx = random(2, 10); 
    l = 30;
  }
 
  void display(){
    float k = l/2;
    stroke(255, 255, 0);
    fill(0, 0, 0);
    rectMode(CENTER);
    strokeWeight(3);
    rect(x, y, l, l);
    strokeWeight(3);
    triangle(x-k-5, y-k, x+k+5, y-k, x, y-l); 
  }
 
 void move(){
   x+=sx;
   if(x>width){
     x=width;
     sx=-sx;
   }
   if(x<0){
     x=0;
     sx=-sx;
   }
 }
 
 void run(){
   display();
   move();
 }
 
}
