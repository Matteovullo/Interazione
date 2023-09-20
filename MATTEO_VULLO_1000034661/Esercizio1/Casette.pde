class Casetta extends Casa{

  Casetta(){
    super();
  }
 
  void display(){
    float k=l/2;
    stroke(255);
    strokeWeight(3);
    fill(0);
    rectMode(CENTER);
    rect(x, y, l, l);
    strokeWeight(3);
    triangle(x-k-5, y-k, x+k+5, y-k, x, y-l); 
    stroke(0);
    strokeWeight(3);
    fill(255);
    rect(x, y+k-5, 10, 10);
  }
 
 void move(){
    x-= sx;
   if(x+(l/2) < 0)
      x = width;
 }
 
 void run(){
   display();
   move();
 }
 
}
