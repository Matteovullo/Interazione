ArrayList<Spike> spks;
ArrayList<Blob> blb;

void setup(){
  size(512, 512);
  spks=new ArrayList<Spike>();
  blb=new ArrayList<Blob>();
}

void draw(){
  background(255, 255, 255);
  if(random(0, 1)<0.05)
    blb.add(new Blob(random(12, 500), 550, random(0, 360); random(5, 10)));
    
  for(Spike k: spks) k.run();
  for(Blob b: blb){
    for(Spike k: spks){
      if(b.check(k))
        b.down;
    }
    b.run();
  }
}

void keyPressed(){
  if(key=='S'){
      spks.add(new Spike(-50, random(12, 500), random(5, 10), random(5, 10)));
  }
}
