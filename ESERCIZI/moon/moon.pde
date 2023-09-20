int x=50;
int y=200/2;
int p=2;
void setup(){
  size(500, 200);
  background(0);
  for(int i=0; i<6; i++){
     fill(255);
     noStroke();
     circle(x, y, 50);
     x+=80;
  }
  x=50;
  y=200/2;
  for(int i=0; i<6; i++){
     fill(0);
     noStroke();
     circle(x+p, y-p, 50);
     x+=80;
     p+=3;
  }
}
 void draw(){}
