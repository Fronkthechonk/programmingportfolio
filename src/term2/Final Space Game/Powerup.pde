class Powerup {
  // Member Variables
  int x, y, diam, speed;
  char type;
PImage h,t,a;



  // Constructor
  Powerup() {
   
    x = int(random(width));
    y = -300;
    diam = int(random(60, 80));
    speed = int(random(1, 5));
    //r1 = loadImage("apple.png");
    int rand = int(random(3));
    if (rand == 0) {
      type = 'h';
      h = loadImage("health.png");
      h.resize(diam, diam);
    } else if (rand == 1) {
      type = 'a';
      a = loadImage("ammo.png");
      a.resize(diam,diam);
    } else if (rand == 2) {
      type = 't';
        t = loadImage("turrets.png"); 
        t.resize(diam, diam);
    }
  }



  // Member Methods
  void display() {
    textMode(CENTER);
    textSize(30);
    if (type == 'h') {
      
          image(h,x,y);
          text("Health",x-20,y+10);
    } else if (type== 'a') {
      
        image(a,x,y);
        text("Ammo",x-20,y+10);
    } else if (type== 't') {
     
     image(t,x,y);
      text("Turret", x-20,y+10);
    }
 
    //imageMode(CENTER);
    // r1.resize(diam, diam);
    //image(r1, x, y);
  }

  void move() {
    y += speed;
  }
  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
