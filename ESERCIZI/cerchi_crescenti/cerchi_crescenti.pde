int x=50;
int y=500/2;
int d=400;
size(500, 500);
background(255);
for(int i=8; i>0; i--){
  circle(x, y, d);
  x-=d/2;
  d/=2;
}
