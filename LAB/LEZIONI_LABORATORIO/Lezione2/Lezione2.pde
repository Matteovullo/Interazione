//size(500, 500);
//background(0);
//rect(100, 100, 200, 150, 10);  //ultimo parametro smussa i vertici
//rect(100, 100, 200, 200, 10, 20, 30, 40); //smussa di piu alcuni vertici

/*void setup(){
  println("sono nel setup");
  frameRate(1);
}

void draw(){
  //println("sono nel draw! Sono passati " + frameCount+ " frame..." );  //per contare i frame
  println("sono nel draw! Sono passati " + millis()/1000+ " secondi..." ); //contare i secondi
}*/

/*
int x=0;
void setup(){
  size(500, 500);
}

void draw(){
  background(255);
  line(x, 0, x, height);
  x++;
}*/

/*
int x=10;
int v=3;
int dir=1;
void setup(){
  size(500, 500);
}

void draw(){
  background(255);
  line(x, 0, x, height);
  if(x<0 || x>=width){
    dir=-dir;
  }
  x=v+dir;
}
*/

/*
int a=45;
int va=5;
int dira=1;

void setup(){
  size(500, 500);
  fill(255, 255, 0);
}

void draw(){
  background(0);
  arc(width/2, height/2, 100, 100, radians(a), radians(350-a));
  if(a<0 || a >= 45){
    dira=-dira;
  }
  a+=va*dira;
}
*/
