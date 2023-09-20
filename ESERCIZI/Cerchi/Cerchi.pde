void setup(){
  size(1000, 500);
  background(255);
  int n=7;
  int centro=100;
  int diametro=100;
  for(int i=1; i<n+1; i++){
    stroke(#FE05FF);
    strokeWeight(3);
    circle(centro, 250, diametro);
    centro=(diametro*2)+(centro/2)+5;
    diametro/=i+1;
  }
}
