/*
Disegnare 10 linee in lunghezza
*/

size(1000, 1000);
background(255);

int q=100;
int s=width/q;

for(int i=0; i<width; i+=s){
  fill(i, 0, 0);
  rect(i, 0, s, height);
}
