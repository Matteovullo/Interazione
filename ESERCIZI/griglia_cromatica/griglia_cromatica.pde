int x=0;
int y=0;
int c=0;
int p=c;
void setup(){
  size(500, 500);
  background(0);
  for(int i=0; i<10; i++){
    for(int j=0; j<10; j++){
      noStroke();
      fill(c);
      rect(x, y, 50, 50);
        y+=50;
        c+=10;
    }
    p+=10;
    c=p;
    y=0;
    x+=50;
  }
}
