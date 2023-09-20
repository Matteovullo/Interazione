// Negativo

PImage Im, ImN;
void setup(){
  Im = loadImage("lena.png");
  Im.resize(256, 256);
  size(512, 256);
  image(Im, 0, 0);
  ImN = negativo(Im);
  image(ImN, 256, 0);
}

PImage negativo(PImage I){
  PImage res = I.copy();
  res.loadPixels();
  float r,g,b;
  for(int i = 0; i < res.pixels.length; i++){
    r = 255-red(res.pixels[i]);
    g = 255-green(res.pixels[i]);
    b = 255-blue(res.pixels[i]);
    res.pixels[i] = color(r, g, b);
  }
  res.updatePixels();
  return res;
}


// Operazioni puntuali

PImage Im, ImN, ImG, ImL;
void setup(){
  Im = loadImage("lena.png");
  Im.resize(256, 256);
  size(512, 512);
  image(Im, 0, 0);
  
  ImN = negativo(Im);
  image(ImN, 256, 0);
  
  ImG = gamma(Im, 2);
  image(ImG, 0, 256);
  
  ImL = logaritmo(Im);
  image(ImL, 256, 256);
}

PImage negativo(PImage i){
  PImage res = i.copy();
  res.loadPixels();
  float r,g,b;
  for(int j = 0; j < res.pixels.length; j++){
    r = 255-red(res.pixels[j]);
    g = 255-green(res.pixels[j]);
    b = 255-blue(res.pixels[j]);
    res.pixels[j] = color(r, g, b);
  }
  res.updatePixels();
  return res;
}

PImage gamma(PImage I, float gm){
  PImage res = createImage(I.width, I.height, RGB);
  res.loadPixels();
  I.loadPixels();
  float r, g, b;
  float C = 1/pow(255, gm-1);
  for(int i = 0; i < res.pixels.length; i++){
    r = C*pow(red(I.pixels[i]), gm);
    g = C*pow(green(I.pixels[i]), gm);
    b = C*pow(blue(I.pixels[i]), gm);
    res.pixels[i] = color(r, g, b);
  }
  res.updatePixels();
  return res;
}

PImage logaritmo(PImage I){
  PImage res = createImage(I.width, I.height, RGB);
  res.loadPixels();
  I.loadPixels();
  float r, g, b;
  float C = 255/log(256);
  for(int i = 0; i < res.pixels.length; i++){
    r = C*log(1+red(I.pixels[i]));
    g = C*log(1+green(I.pixels[i]));
    b = C*log(1+blue(I.pixels[i]));
    res.pixels[i] = color(r, g, b);
  }
  res.updatePixels();
  return res;
}


// Quantizzazione

PImage Im, ImQ;
int K;
void setup(){
  K = 2;
  Im = loadImage("lena.png");
  Im.filter(GRAY);
  size(1024, 512);
  image(Im, 0, 0);
  ImQ = quantizza(Im, K);
  image(ImQ, 512, 0);
}

void draw(){}

PImage quantizza(PImage I, int k){
  PImage res = I.copy();
  res.loadPixels();
  int q;
  for(int i = 0; i < res.pixels.length; i++){
    q = floor((blue(res.pixels[i])*k)/256);
    q = int((float(q)/(k-1))*255);
    res.pixels[i] = color(q);
  }
  res.updatePixels();
  return res;
}

void keyPressed(){
  if((key == '+') && (K < 256)){
    K++;
    image(quantizza(Im, K), 512, 0);
    println(K);
  }
  if((key == '-') && (K > 2)){
    K--;
    image(quantizza(Im, K), 512, 0);
    println(K);
  }
}


// Interpolazione

PImage ImO, ImP, ImR;
float mseO, mseP, mseR, psnrO, psnrP, psnrR;
void setup(){
  ImO = loadImage("lena.png");
  ImO.filter(GRAY);
  size(1536, 512);
  background(0);
  ImP = ImO.copy();
  ImP.resize(256, 256);
  ImP.resize(512, 512);
  
  ImR = ImO.copy();
  ImR.resize(256, 256);
  ImR = replication2x(ImR);
  
  mseO = MSE(ImO, ImO);
  mseP = MSE(ImO, ImP);
  mseR = MSE(ImO, ImR);
  
  psnrO = PSNR(ImO, ImO);
  psnrP = PSNR(ImO, ImP);
  psnrR = PSNR(ImO, ImR);
  
  println("MSE con se stessa: " +mseO);
  println("MSE calcolato da processing: " +mseP);
  println("MSE con replication: " +mseR);
  
  println("PSNR con se stessa: " +psnrO);
  println("PSNR calcolato da processing: " +psnrP);
  println("PSNR con replication: " +psnrR);
  image(ImO, 0, 0);
  image(ImP, 512, 0);
  image(ImR, 1024, 0);
}

PImage replication2x(PImage I){
  PImage res = createImage(2*I.width, 2*I.height, RGB);
  for(int x = 0; x < I.width; x++){
    for(int y = 0; y < I.height; y++){
      res.set(2*x, 2*y, I.get(x,y));
      res.set(2*x+1, 2*y, I.get(x,y));
      res.set(2*x, 2*y+1, I.get(x,y));
      res.set(2*x+1, 2*y+1, I.get(x,y));
    }
  }
  return res;
}

float MSE(PImage I1, PImage I2){
  float res = 0;
  I1.loadPixels();
  I2.loadPixels();
  for(int i = 0; i < I1.pixels.length; i++){
    res += pow(red(I1.pixels[i])-red(I2.pixels[i]), 2);
  }
  res /= I1.pixels.length;
  return res;
}

float PSNR(PImage I1, PImage I2){
  float res = 0;
  float mse = MSE(I1, I2);
  res = 10*log(255*255/mse)/log(10);
  return res;
}


// Contrast stretching && Equalization

PImage Im, ImCS, ImE;
float[] H1, H2;
void setup(){
  Im = loadImage("lena.png");
  Im.filter(GRAY);
  size(1536, 512);
  ImCS = stretching(Im);
  H1 = istogramma(Im);
  H2 = istogramma(ImCS);
  ImE = equalizza(Im);
  image(Im, 0, 0);
  image(ImCS, 512, 0);
  image(ImE, 1024, 0);
  println(H1[0]);
  println(H2[0]); 
}

void draw(){}

PImage stretching(PImage I){
  PImage res = I.copy();
  float Max, Min;
  res.loadPixels();
  Max = green(res.pixels[0]);
  Min = green(res.pixels[0]);
  for(int i = 1; i < res.pixels.length; i++){
    if(green(res.pixels[i]) < Min){
      Min = green(res.pixels[i]);
    }
    if(green(res.pixels[i]) > Max){
      Max = green(res.pixels[i]);
    }
  }
  for(int i = 0; i < res.pixels.length; i++){
    res.pixels[i] = color(255*(green(res.pixels[i])-Min)/(Max-Min));
  }
  res.updatePixels();
  return res;
}

float[] istogramma(PImage I){
  float[] H = new float[256];
  for(int i = 0; i < 256; i++){
    H[i] = 0;
  }
  I.loadPixels();
  for(int i = 0; i < I.pixels.length; i++){
    H[int(green(I.pixels[i]))]++;
  }
  for(int i = 0; i < 256; i++){
    H[i] /= I.pixels.length;
  }
  return H;
}

PImage equalizza(PImage I){
  PImage res = I.copy();
  float[] H = istogramma(I);
  for(int i = 1; i < 256; i++){
    H[i] += H[i-1];
  }
  res.loadPixels();
  for(int i = 0; i < res.pixels.length; i++){
    res.pixels[i] = color(255*H[int(green(res.pixels[i]))]);
  }
  res.updatePixels();
  return res;
}


// Scaling with forward mapping && Scaling with inverse mapping

PImage Im, ImF, ImI;
float scale = 1;
void setup(){
  Im = loadImage("lena.png");
  size(1024, 512);
  ImF = scaleF(Im, scale, scale);
  ImI = scaleI(Im, scale, scale);
  image(ImF, 0, 0);
  image(ImI, 512, 0);
}

void draw(){}

PImage scaleF(PImage I, float sx, float sy){
  PImage res = createImage(I.width, I.height, RGB);
  res.loadPixels();
  for(int i = 0; i < res.pixels.length; i++){
    res.pixels[i] = color(0);
  }
  float x, y;
  float u1, v1;
  for(int u = 0; u < I.width; u++){
    for(int v = 0; v < I.height; v++){
      u1 = u-I.width/2;
      v1 = v-I.height/2;
      x = u1*sx;
      y = v1*sy;
      x += I.width/2;
      y += I.height/2;
      res.set(round(x), round(y), I.get(u,v));
    }
  }
  return res;
}

PImage scaleI(PImage I, float sx, float sy){
  PImage res = createImage(I.width, I.height, RGB);
  res.loadPixels();
  for(int i = 0; i < res.pixels.length; i++){
    res.pixels[i] = color(0);
  }
  float u, v;
  float x1, y1;
  for(int x = 0; x < I.width; x++){
    for(int y = 0; y < I.height; y++){
      x1 = x-I.width/2;
      y1 = y-I.height/2;
      u = x1*1/sx;
      v = y1*1/sy;
      u += I.width/2;
      v += I.height/2;
      res.set(x,y, I.get(round(u), round(v)));
    }
  }
  return res;
}

void keyPressed(){
  if(key == '+'){
    scale += .1;
  }
  if(key == '-' && scale > 1){
    scale -= .1;
  }
  println(scale);
  ImF = scaleF(Im, scale, scale);
  ImI = scaleI(Im, scale, scale);
  image(ImF, 0, 0);
  image(ImI, 512, 0);
}


// Rotaion

PImage Im, ImRF, ImRI;
int ang = 0;
void setup(){
  Im = loadImage("lena.png");
  size(1024, 512);
  ImRF = rotateF(Im, radians(ang));
  ImRI = rotateI(Im, radians(ang));
  image(ImRF, 0, 0);
  image(ImRI, 512, 0);
}

void draw(){}

PImage rotateF(PImage I, float theta){
  PImage res = createImage(I.width, I.height, RGB);
  res.loadPixels();
  for(int i = 0; i < res.pixels.length; i++){
    res.pixels[i] = color(0);
  }
  float x, y;
  float u1, v1;
  for(int u = 0; u < I.width; u++){
    for(int v = 0; v < I.height; v++){
      // Questa traslazione serve ad effettuare l'operazione rispetto al centro dell'immagine
      u1 = u-I.width/2;
      v1 = v-I.height/2;
      x = u1*cos(theta) - v1*sin(theta);
      y = u1*sin(theta) + v1*cos(theta);
      x += I.width/2;
      y += I.height/2;
      res.set(round(x), round(y), I.get(u,v));
    }
  }
  return res;
}

PImage rotateI(PImage I, float theta){
  PImage res = createImage(I.width, I.height, RGB);
  res.loadPixels();
  for(int i = 0; i < res.pixels.length; i++){
    res.pixels[i] = color(0);
  }
  float u, v;
  float x1, y1;
  for(int x = 0; x < I.width; x++){
    for(int y = 0; y < I.height; y++){
      x1 = x-I.width/2;
      y1 = y-I.height/2;
      u = x1*cos(theta) + y1*sin(theta);
      v = -x1*sin(theta) + y1*cos(theta);
      u += I.width/2;
      v += I.height/2;
      res.set(x,y, I.get(round(u), round(v)));
    }
  }
  return res;
}

void keyPressed(){
  if(key == '+'){
    ang += 5;
  }
  if(key == '-'){
    ang -= 5;
  }
  ang = ang % 360;
  println(ang);
  ImRF = rotateF(Im, radians(ang));
  ImRI = rotateI(Im, radians(ang));
  image(ImRF, 0, 0);
  image(ImRI, 512, 0);
}


// Operatori locali

PImage Im, ImN3, ImN5, ImLP, ImSH, ImSOBx;
float n3 = 1/9.0;
float[][] nbox3 = {{n3, n3, n3},
                  {n3, n3, n3},
                  {n3, n3, n3}};
float n5 = 1.0/25;
float[][] nbox5 = {{n5, n5, n5, n5, n5},
                  {n5, n5, n5, n5, n5},
                  {n5, n5, n5, n5, n5},
                  {n5, n5, n5, n5, n5},
                  {n5, n5, n5, n5, n5}};

float[][] lapl = {{-1, 0, -1},
                 {0, 4, 0},
                 {-1, 0, -1}};

float[][] sobX = {{-1, -2, -1},
                 {0, 0 ,0},
                 {1, 2, 1}};

float[][] sharp = {{-1, 0, -1},
                  {0, 5, 0},
                  {-1, 0, -1}};

float[][] random = {{2, -2, -3},
                   {5, -1, 0.5},
                   {-1, 4, 2}};
                 
void setup(){
  size(1024, 1024);
  Im = loadImage("lena.png");
  Im.filter(GRAY);
  ImN3 = converti(convoluzione(Im, nbox3));
  ImN5 = converti(convoluzione(Im, nbox5));
  ImLP = converti(convoluzione(Im, lapl));
  ImSH = converti(convoluzione(Im, sharp));
  ImSOBx = converti(convoluzione(Im, sobX));
  image(Im, 0, 0);
  image(ImN5, 512, 0);
  image(ImSOBx, 0, 512);
  image(ImSH, 512, 512);
}

float[][] convoluzione(PImage I, float[][] kernel){
  float[][] res = new float[I.height][I.width];
  int n = kernel[0].length; // colonne
  int m = kernel.length; 
  PImage tmp;
  float result;
  for(int x = 0; x < I.width; x++){
    for(int y = 0; y < I.height; y++){
      tmp = I.get(x-n/2, y-m/2, n, m);
      result = 0;
      for(int p = 0; p < n; p++){
        for(int q = 0; q < m; q++){
          result += green(tmp.get(p,q))*kernel[q][p];
        }
      }
      res[y][x] = result;
    }
  }
  return res;
}

PImage converti(float[][] matrix){
  PImage res = createImage(matrix[0].length, matrix.length, RGB);
  float result = 0;
  for(int x = 0; x < res.width; x++){
    for(int y = 0; y < res.height; y++){
      result = constrain(abs(matrix[y][x]), 0, 255);
      res.set(x, y, color(result));
    }
  }
  return res;
}


// Massimo && Minimo && Mediano

PImage Im, ImMAX, ImMIN, ImMED;
void setup(){
  size(1024, 1024);
  Im = loadImage("lena.png");
  Im.filter(GRAY);
  ImMAX = massimo(Im, 11);
  ImMIN = minimo(Im, 11);
  ImMED = mediano(Im, 11);
  image(Im, 512, 0);
  image(ImMAX, 0, 0);
  image(ImMIN, 0, 512);
  image(ImMED, 512, 512);
}

PImage minimo(PImage I, int n){
  PImage res = createImage(I.width, I.height, RGB);
  PImage tmp;
  int off = n/2;
  float[] tmpF;
  int xs;
  int ys;
  for(int x = 0; x < I.width; x++){
    for(int y = 0; y < I.height; y++){
      xs = x - off;
      ys = y - off;
      tmp = I.get(max(0, xs), max(0, ys), min(n, min(n + xs, I.width-xs)), min(n, min(n + ys, I.height-ys)));
      tmp.loadPixels();
      tmpF = new float[tmp.pixels.length];
      for(int i = 0; i < tmp.pixels.length; i++){
        tmpF[i] = green(tmp.pixels[i]);
      }
      res.set(x, y, color(min(tmpF)));
    }
  }
  return res;
}

PImage massimo(PImage I, int n){
  PImage res = createImage(I.width, I.height, RGB);
  PImage tmp;
  int off = n/2;
  float[] tmpF;
  tmpF= new float[n*n];
  for(int x = 0; x < I.width; x++){
    for(int y = 0; y < I.height; y++){
      tmp = I.get(x-off, y-off, n, n);
      tmp.loadPixels();
      for(int i = 0; i < tmp.pixels.length; i++){
        tmpF[i] = green(tmp.pixels[i]);
      }
      res.set(x, y, color(max(tmpF)));
    }
  }
  return res;
}

PImage mediano(PImage I, int n){
  PImage res = createImage(I.width, I.height, RGB);
  PImage tmp;
  int off = n/2;
  float[] tmpF;
  tmpF= new float[n*n];
  float med;
  for(int x = 0; x < I.width; x++){
    for(int y = 0; y < I.height; y++){
      tmp = I.get(x-off, y-off, n, n);
      tmp.loadPixels();
      for(int i = 0; i < tmp.pixels.length; i++){
        tmpF[i] = green(tmp.pixels[i]);
      }
      tmpF = sort(tmpF);
      if((n*n) % 2 == 1){
        med = tmpF[(n*n)/2];
      }
      else{
        med = (tmpF[(n*n)/2] + tmpF[(n*n)/2-1])/2;
      }
      res.set(x, y, color(med));
    }
  }
  return res;
}


// Estrazione bitplane

PImage Im, ImB;
int K;
void setup(){
  Im = loadImage("lena.png");
  Im.filter(GRAY);
  size(1024, 512);
  image(Im, 0, 0);
  K = 7;
  ImB = bitplane(Im, K);
  image(ImB, 512, 0);
}

void draw(){}

PImage bitplane(PImage I, int nb){
  PImage res = I.copy();
  res.loadPixels();
  int x;
  int r;
  for(int i = 0; i < res.pixels.length; i++){
    x = int(blue(res.pixels[i]));
    r = (x >> nb)&1;
    res.pixels[i] = color(255*r);
  }
  res.updatePixels();
  return res;
}

void keyPressed(){
  if((key == '+') && (K < 7)){
    K++;
    ImB = bitplane(Im, K);
    image(ImB, 512, 0);
  }
  if((key == '-') && (K > 0)){
    K--;
    ImB = bitplane(Im, K);
    image(ImB, 512, 0);
  }
}
