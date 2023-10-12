class Point {
  PVector pos;
  color filledColor;
  float size;

  Point(PVector p) {
    pos = p;
    filledColor = color(random(255), random(255), random(255));
    size = random(10,40);
  }

  void move() {
    int xIndex = floor(pos.x/unitX);
    int yIndex = floor(pos.y/unitY);
    pos.add(arrows[xIndex][yIndex]);
  }

  void edge() {
    if (pos.x-unitX/2<0) pos.x =width-unitX/2;
    if (pos.x+unitX/2>width) pos.x = unitX/2;
    if (pos.y-unitX/2<0) pos.y =height-unitX/2;
    if (pos.y+unitX/2>height) pos.y = unitX/2;
  }

  void show() {
    fill(filledColor,102);
    noStroke();
    ellipse(pos.x, pos.y, size, size);//unitX/2, unitY/2);
  }
}
