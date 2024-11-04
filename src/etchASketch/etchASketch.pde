// Emily Dustin | Etch A Sketch | 18 Sept 2024
int x,y;
void setup() {
  size(500,500);
  background(127);
  x = width/2;
  y = height/2;
}

void draw() {
  if(keyPressed) {
    if(key == 'a' || key == 'A') {
    x = x - 1;
    }
    if(key == 'w' || key == 'W') {
    y = y - 1;
    }
    if(key == 'd' || key == 'D') {
    x = x + 1;
    }
    if(key == 's' || key == 'S') {
    y = y + 1;
    }
  }
  strokeWeight(3);
  point(x,y);
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == UP ) {
      y = y - 1;
    } else if(keyCode == DOWN){
      y = y + 1;
    } else if(keyCode == RIGHT) {
      x = x + 1;
    } else if(keyCode == LEFT) {
      x = x - 1;
    }
  }
}
