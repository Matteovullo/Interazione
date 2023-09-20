PImage im;
int N;
int K;

void setup(){
  frameRate('v'-60);
  size(1024, 512);
  im=loadImage("lena.png");
  N=1;
  image(im, 0, 0);
  image(grid(im, int(pow(N,2))), 512, 0);
}

void draw(){
  K++;
  if(K==20+1){
    N++;
    if(N==8)
      N=1;
    image(grid(im,int(pow(2,N))),512,0);
    K=0;
  }
}

PImage stretching(PImage I){
  PImage R=I.copy();
  float maxr, minr, maxg, ming, maxb, minb;
  R.loadPixels();
  maxr=red(R.pixels[0]);
  minr=red(R.pixels[0]);
  maxg=green(R.pixels[0]);
  ming=green(R.pixels[0]);
  maxb=blue(R.pixels[0]);
  minb=blue(R.pixels[0]);
  
  for (int i=0;i<R.pixels.length;i++){
    if (red(R.pixels[i])<minr){
      minr=red(R.pixels[i]);
    }
    if (red(R.pixels[i])>maxr){
      maxr=red(R.pixels[i]);
    }
    if (green(R.pixels[i])<ming){
      ming=green(R.pixels[i]);
    }
    if (green(R.pixels[i])>maxg){
      maxg=green(R.pixels[i]);
    }
    if (blue(R.pixels[i])<minb){
      minb=blue(R.pixels[i]);
    }
    if (blue(R.pixels[i])>maxb){
      maxb=blue(R.pixels[i]);
    }
  }
  
  for (int i=0;i<R.pixels.length;i++){
    R.pixels[i]=color(255*(red(R.pixels[i])-minr)/(maxr-minr), 255*(green(R.pixels[i])-ming)/(maxg-ming), 
    255*(blue(R.pixels[i])-minb)/(maxb-minb));
  }
  
  R.updatePixels();
  return R; 
}

PImage grid(PImage I, int n){
  PImage R=I.copy();
  PImage tmp;
  int hx=I.width/2;
  int hy=I.height/2;
  for(int i=0; i<n; i++){
    for(int j=0; j<n; j++){
      tmp=R.get(i*hx, j*hy, hx, hy);
      tmp=stretching(tmp);
      R.set(i*hx, j*hy, tmp);
    }
  }
  
  return R;
}
