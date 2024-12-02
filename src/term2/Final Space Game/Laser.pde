class Laser {
  //Member Variables
  int x, y, w, h, speed;
  PImage l1;

  // Constructor
  Laser(int x, int y) {
    this.x=x;
    this.y=y;
    w = 5;
    h = 10;
    speed = 6;
    l1 = loadImage("laser.png");
  }

  //Member Methods
  void display() {
    image(l1, x, y, 60, 60);
  }

  void move() {
    y -= speed;
  }
  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
