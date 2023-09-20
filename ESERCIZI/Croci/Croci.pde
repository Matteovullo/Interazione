void setup(){
  size(500, 500);
  background(255);
  strokeWeight(2);
  stroke(255, 0, 0);
  int d=20;
   for(int i=40; i<=height-d; i+=40){
    for(int j=40; j<=width-d; j+=40){
        line(i-d, j, i, j-d);
        line(i, j, i-d, j-d);
        j+=d;
    }
    i+=d;
  }
}

void draw(){}
