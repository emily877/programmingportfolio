// Emily Dustin | 6 Nov 2024 | SpaceGame
import processing.sound.*;
SoundFile laser;
int score, level;
boolean play;
Spaceship s1;
Rock r1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rTime, puTime;



void setup() {
  size(500, 500);
  laser = new SoundFile(this,"laser.wav");
  s1 = new Spaceship();
  rTime = new Timer(1000);
  rTime.start();
  puTime = new Timer(5000);
  puTime.start();
  noCursor();
  level = 1;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    if(frameCount % 1000 == 0) {
      level = level + 1;
    }
    
    background(0);
    stars.add(new Star());
    for(int i = 0; i<stars.size(); i ++) {
      Star s = stars.get(i);
      s.Display();
      s.move();
      if(s.reachedBottom()) {
        stars.remove(s);
     }
  }
 }

 
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i= 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        // Decide what the user recives
        // 1. Possible health bennefit
        if (pu.type == 'h') {
          s1.health += 100;
        } else if (pu.type == 'a') {
          s1.laserCount += 100;
        }
        powups.remove(pu);
        // 2. Replenish Ammo
        // 3. Invincible mode
        // 4. Increase turret count
        // 5. visual change to the ship
        // 6. wave to take out all rocks and enemies
        // 7. slow down rock
        // 8. point bonus
      }
      if (pu.reachedBotton()) {
        powups.remove(pu);
      }
    }


    // if(keyPressed && key == ' ') {
    //lasers.add(new Laser(s1.x,s1.y));
    //}

    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          //
          score+=r.diam;
          lasers.remove(laser);
          r.diam-=10;
          if (r.diam<5) {
            rocks.remove(r);
          }
        }

        laser.display();
        laser.move();
        if (laser.reachedTop()) {
          lasers.remove(laser);
        }
      }
    }
    infoPanel();

    s1.display();
    s1.move(mouseX, mouseY);
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i= 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        s1.health -= rock.diam;
        rocks.remove(rock);
        score += rock.diam;
      }
      if (rock.reachedBotton()) {
        rocks.remove(rock);
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health < 1) {
      gameOver();
      noLoop();
    }
  }



void keyPressed() {
  if (key == ' ' && s1.fire()) {
    laser.play();
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  }
}


void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(25);
  text("score:" + score, 20, 35);
  text("Ammo:" + s1.laserCount, 230, 35);
  text("health" + s1.health, 120, 35);
  text("Level" + level, 400,35);
}

void startScreen() {
  background(0);
  fill(255);
  text("Welcome to SpaceGame", width/2, 300);
  text("Click to start...", width/2, 350);
}

void gameOver() {
  background(0);
  fill(255);
  text("Game Over", width/2, 300);
  text("Score:" + score, width/2, 350);
}

void ticker() {
}

void mousePressed() {
  play = true;
}
