/*riempire tutto di pallini*/
int q=10;
size(1000, 500);
int d=width/q;
colorMode(RGB, width);
for(int y=d/2; y<=height; y+=d){
  for(int x=d/2; x<=width; x+=d){
    fill(x, y, 0);
    ellipse(x, y, d, d);
  }
}
