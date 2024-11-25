class Rock {
  // Member Variables
  int x, y, diam, speed;
  PImage r1;

  // Constructor
  Rock() {
    x = int(random(width));
    y = -1;
    diam = 45;
    speed = int (random(1, 5));
    r1 = loadImage("Rock1.png");
  }

  void display() {
    image(r1, x, y);
  }

  void move() {
    y = y + speed;
  }

  boolean reachedBotton() {
    if(y > height + 200) {
      return true;
    } else {
      return false;
    }
  }
}
