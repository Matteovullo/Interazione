class BlueHeart extends Heart {
  BlueHeart(float _x, float _y, float _sx, float _sy) {
    super(_x, _y, _sx, _sy);
  }

  void display() {
    noStroke();
    if (check()) fill(128);
    else fill(0, 0, 255);

    pushMatrix();
    translate(posX, posY);
    rotate(radians(25));
    bezier(0, 0, -60, -70, 60, -70, 0, 0);
    popMatrix();

    pushMatrix();
    translate(posX, posY);
    rotate(radians(-25));
    bezier(0, 0, -60, -70, 60, -70, 0, 0);
    popMatrix();
  }

  boolean check() {
    if (dist(mouseX, mouseY, posX, posY-30) <30 ) return true;
    else return false;
  }

  void run() {
    if (!check()) super.move();
    display();
  }
}
