class Spaceship {
  //Member Variables
  int x, y, w, laserCount, turretCount, health;


  // Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount= 100;
    turretCount = 1;
    health = 100;
  }

  //Member Methods
  void display() {
    strokeWeight(3);
    fill(50);
    //thruster
    stroke(40);
    rect(x+10, y+20, 15, 20);
    rect(x-25, y+20, 15, 20);
    fill(127);
    //wing
    triangle(x, y-30, x+45, y+30, x-45, y+30);
    fill(99);
    //center
    ellipse(x, y, 20, 80);
    //blaster
    line(x+30, y-20, x+30, y+20);
    line(x-30, y-20, x-30, y+20);
    
    fill(255, 255, 0);
    triangle(x+15, y+45, x+35, y+50, x+35, y+60);
    triangle(x-10, y+47, x-35, y+46, x-20, y+40);
    triangle(x-10, y+60, x, y+50, x+10, y+76);
  }






  void move(int tempX, int tempY) {
    x=tempX;
    y=tempY;
  }

  boolean fire() {

    if (laserCount > 0) {
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
