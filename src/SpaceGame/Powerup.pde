class Powerup {
  // Member Variables
  int x, y, diam, speed;
  char type;
  // PImage r1;

  // Constructor
  Powerup() {
    x = int(random(width));
    y = -1;
    diam = 45;
    diam = int(random(20, 75));
    speed = int (random(1, 5));
    // r1 = loadImage("Rock1.png");
    int rand = int(random(2));
    if (rand == 0) {
    type = 'h';
    }else if(rand == 1) {
      type = 'a';
  }
 }

  void display() {
    
    if(type == 'h') {
      fill(0,222,0);
    } else if(type == 'a') {
      fill (255,0,0);
    }
    ellipse(x, y, diam, diam);
   // image(r1, x, y);
  }

  void move() {
    y = y + speed;
  }

  boolean reachedBotton() {
    if (y > height + 200) {
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
