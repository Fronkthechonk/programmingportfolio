// Franklin Chia | 6 Nov 2024 | SpaceGame
Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, level, rockRate;
boolean play;
Timer rTime, puTime;
//background
PImage bg;
PImage st;
PImage gm;
PImage stp;
int y;
//sounds
import processing.sound.*;

SoundFile soundFile;

AudioSample hitSound;
AudioSample hithey;
SoundFile hello;
SoundFile gamestart;
SoundFile gameover;


void setup() {
  size(800, 700);
  bg = loadImage("yes.jpg");
  bg.resize(width, height);
  st = loadImage("starts.jpg");
  st.resize(width, height);
  gm = loadImage("game.jpeg");
  gm.resize(width, height);
 
  
  hitSound = new SoundFile(this,"sus.wav");
  hithey= new SoundFile(this,"HEY.mp3");
  hello = new SoundFile(this,"hello.mp3");
  gamestart = new SoundFile(this,"gamestart.mp3");
  gameover = new SoundFile(this, "gameover.mp3");
hello.loop();
hitSound.amp(0.5);
hithey.amp(5);



  s1 = new Spaceship();

  score = 0;
  level = 1;
  play = false;
  rockRate = 1000;
  rTime = new Timer(rockRate);
  rTime.start();
  puTime = new Timer(5000);
  puTime.start();
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(bg);
    if(frameCount % 2000 == 0) {
    level++;
    rockRate -=  200;
    }
    
    
    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }
    //Render powerups
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      if (pu.intersect(s1) && pu.type =='h') {
        //1. remove powerup
        powups.remove(pu);
        //2. health bennefit
        s1.health += 100;
      } else if (pu.intersect(s1) && pu.type == 'a') {
        s1.laserCount += 100;
        powups.remove(pu);
      } else if (pu.intersect(s1) && pu.type == 't') {
        s1.turretCount += 1;
        powups.remove(pu);
        //3. Laser strength
        //4. ammo increase
        //5. turret count
        //6. heat seeking ammo
        //7. time credit
        //8. remove all enemy objects on screen
        //9. score multiplyer
        //10. alter speed of enemy objects
        //11. rotating rock for melee damage
      }
      pu.display();
      pu.move();
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }


    //Render lasers and detect rock collide

    for (int i = 0; i < lasers.size(); i++) {


      Laser laser = lasers.get(i);

      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          hitSound.play();

          lasers.remove(laser);
          rock.diam -= 35;
          score += 10;
        }
        if (rock.diam <1) {
          rocks.remove(rock);
          score += 100;
        }
      }
      laser.display();

      laser.move();

      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    // }

    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        hitSound.play();
        // deduct 10 points
        score -= 10;
        // deduct 10 health
        s1.health -= 10;
        // delete rock
        rocks.remove(rock);
      }

      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health<1) {
      gameOver();
      noLoop();
    }
  }
}
void keyPressed() {
  if (keyCode == 32 && play == true) {
    mousePressed();
    //if (s1.fire()) {
    //  Laser laser = new Laser(s1.x, s1.y);

    //  lasers.add(laser);
    //  s1.laserCount--;
    //  hithey.trigger();
    //  hithey.trigger();
    //}
  }
}

void infoPanel() {
  noStroke();
  rectMode(CENTER);
  fill(255);
  rect(width/2, 20, width, 40);
  textSize(25);
  fill(0);
  text("Score:" + score, 20, 36);
  text("Health:" + s1.health, 200, 36);
  text("Level:" + level, 400, 36);
  text("Ammo:" + s1.laserCount, 500, 35);
  text("Turret:" + s1.turretCount, 650, 35);
}

void startScreen () {
  background(st);


  fill(0);
  textSize(60);
  text("Annoying orange kitchen fight", 30, 200);
  textSize(40);
  text("Made By: Franklin Chia", 230, 300);
  textSize(40);
  text("Click to start", 250, 400);
  if (mousePressed) {
    play = true;
hello.stop();
gamestart.loop();
gamestart.amp(0.3);
  }
}
void gameOver() {
  background(gm);
  textSize(40);
  fill(255);
  text("Womp womp", 200, 200);
  text("Score:" + score, 320, 300);
  text("Level"+ level, 320, 400);
  play=false;
  gamestart.stop();
  gameover.loop();
}

void ticker() {
}

void mousePressed() {
  if (s1.fire() && s1.turretCount == 1 && play == true)
  {
    Laser laser = new Laser(s1.x, s1.y);
    lasers.add(laser);
    s1.laserCount--;
    hithey.play();
  } else if (s1.fire() && s1.turretCount == 2 && play == true) {
    lasers. add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    s1.laserCount--;
    hithey.play();
    hithey.play();
  } else if (s1.fire() && s1.turretCount > 2 && play == true) {
    lasers. add(new Laser(s1.x-13, s1.y));
    lasers.add(new Laser(s1.x+0, s1.y));
    lasers.add(new Laser(s1.x+13, s1.y));
    s1.laserCount--;
    hithey.play();
    hithey.play();
    hithey.play();
  }
}


void stop() {

  
  hello.stop();

}
