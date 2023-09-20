Heart obj;
float s;
void setup()
{
  size(800, 500);
  s = 5;
  obj = new Heart(width/2, 70, 70, s);
}

void draw()
{
  background(#140579);
  obj.display();
}

void keyPressed()
{   
  if(key == 'r' || key == 'R')
    setup();
    
  if(key == 'f' || key == 'F')
    obj = new Heart(width/2, 70, 70, s*=2, "");
    
  if(key == 's' || key == 'S')
    obj = new Heart(width/2, 70, 70, s/=2, "");
    
  if(key == 'v' || key == 'V')
    obj = new Heart(width/2, 70, 70, s, "vertical");
      
  if(key == 'h' || key == 'h')
    obj = new Heart(width/2, 70, 70, s, "horizontal");
      
  if(key == 'g' || key == 'G')
    obj = new Heart(width/2, 70, 70, s, "gravity");
    
  if(key == 'e' || key == 'E')
    obj = new Heart(width/2, 70, 70, s, "exit");
}
