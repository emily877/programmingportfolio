class Spaceship {
  // Member Variables
  int x, y, w, health, laserCount, turretCount;
  PImage ship;
  
  // Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    health = 100;
    laserCount = 100;
    
  }
  
  void display() {
  fill(127);
  rect(x+10,y+20,10,30);
  rect(x-20,y+20,10,30);
  triangle(x, y-40, x+35,y+40,x-35,y+40);
  fill(80);
  triangle(x,y-35, x+15, y-25,x-15, y-25);
  ellipse(x, y, 20, 40);
  stroke(220);
  line(x+20,y-20,x+20,y+20);
  line(x-20,y+20,x-20,y-20);
}

  
  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }
  
  boolean fire() {
    if(laserCount > 0) {
    return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(Rock r) {
    float d = dist(r.x,r.y,x,y);
    if(d<50) {
    return true;
    } else { 
      return false;
    }
  }
}
