// Emily Dustin | TimeLine Project | 8-28-24

void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(127);
  drawRef();
  histEvent(150, 200, "Z2 - 1940", "German, the earliest examples of an electric operated digital computer built with electromechanical relays during 1940",true);
  histEvent(250, 300, "Z3 - 1941", "This was the world's first working electromechanical programmable, fully automatic digital computer.",false); 
  histEvent(325, 200, "Harvard Mark - 1944", "In 1944, the Harvard Mark was consturcted at IBM's Endicott laboratories", true);
  histEvent(425, 300, "Test 4", "Detail 4", false);
  histEvent(525, 200, "Test 5", "Detail 5", true);
  histEvent(625, 300, "Test 6", "Detail 6", false);
  histEvent(725, 200, "Test 7", "Detail 7", true);
  histEvent(750, 300, "Test 8", "Detail 8", false);
}

void drawRef() {
  strokeWeight(3);
  stroke(50);
  line(100, 250, 800, 250);
  textSize(18);
  fill(0);
  text("1940", 80, 270);
  text("1960", 810, 270);

  // Title Text
  textAlign(CENTER);
  textSize(30);
  text("Historic Computer System", width/2, 60);
  textSize(22);
  text("By Emily Dustin", width/2, 90);
}

void histEvent(int x, int y, String val, String detail, Boolean top) {
  if (top) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  fill(200);
  rectMode(CENTER);
  rect(x, y, 80, 20);
  fill(0);
  textSize(12);
  text(val, x, y+5);

  if (mouseX>x-40 && mouseX<x+40 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
