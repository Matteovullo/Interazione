PImage Im;

void setup()
{
  size(512, 256);
  Im = loadImage("lena.png");
  Im.resize(256, 256);
  image(Im, 0, 0);
  image(horizontal(Im), 256,0);
}

void draw()
{}

//ORIZZONTALE
PImage horizontal(PImage I)
{
  PImage tmp1 = I.get(0, 0, I.width, I.height/2);
  PImage tmp2 = I.get(0, I.height/2, I.width, I.height/2);
  PImage R = createImage(I.width, I.height, RGB);
  R.set(0, 0, tmp2);
  R.set(0, I.height/2, tmp1);
  return R;
}

//VERTICALE
PImage vertical(PImage I)
{
  PImage tmp1 = I.get(I.width/2, 0, I.width/2, I.height);
  PImage tmp2 = I.get(0, 0, I.width/2, I.height);
  PImage R = createImage(I.width, I.height, RGB);
  R.set(0, 0, tmp1);
  R.set(I.width/2, 0, tmp2);
  return R;
}

//SPECCHIA DIAGONALE PRINCIPALE
PImage mirror_diagonal(PImage I){
  for (int i = 0; i < I.width; i++) {
    for (int j = 0; j < I.height; j++) {
      color c = I.get(i, j);
      I.set(j, i, c);
    }
  }
  return I;
}

//INVERTE SOTTO LA DIAGONALE PRINCIPALE
PImage flip_under_diagonal(PImage I) 
{
  PImage result = createImage(I.width, I.height, RGB);
  for (int x = 0; x < I.width; x++) 
  {
    for (int y = 0; y < I.height; y++) 
    {
      if (y >= x) 
        result.pixels[x + y * I.width] = I.pixels[(I.width - x - 1) + (I.height - y - 1) * I.width];
      else 
        result.pixels[x + y * I.width] = I.pixels[(I.width - x - 1) + y * I.width];
    }
  }
  return result;
}

//INVERTE SOPRA LA DIAGONALE PRINCIPALE
PImage flip_on_diagonal(PImage I) 
{
  PImage result = createImage(I.width, I.height, RGB);
  for (int x = 0; x < I.width; x++) 
  {
    for (int y = 0; y < I.height; y++) 
    {
      if (x >= y) 
        result.pixels[x + y * I.width] = I.pixels[(I.width - x - 1) + (I.height - y - 1) * I.width];
      else 
        result.pixels[x + y * I.width] = I.pixels[(I.width - x - 1) + y * I.width];
    }
  }
  return result;
}

//INVERTE DIAGONALE SECONDARIA
PImage flip_diagonal_2(PImage I) 
{
  PImage result = createImage(I.width, I.height, RGB);
  for (int x = 0; x < I.width; x++) 
  {
    for (int y = 0; y < I.height; y++) 
    {
      if (x + y >= I.width)
        result.pixels[x + y * I.width] = I.pixels[(I.width - x - 1) + (I.height - y - 1) * I.width];
      else 
        result.pixels[x + y * I.width] = I.pixels[(I.width - x - 1) + y * I.width];
    }
  }
  return result;
}
