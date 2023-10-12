class Point {
  PVector pos;
  PVector speed;

  Point(PVector p, PVector s) {//构造函数
    pos = p;
    speed = s;
  }
  
  void run(){
    move();
    eleRemove();
    //show();
  }

  void show() {
    strokeWeight(5);
    point(pos.x, pos.y);
  }

  void move() {
    //speed.add(gravity);
    pos.add(speed);
  }

  void eleRemove() {
    if (pos.x > width+50 && pos.x < -50 &&
        pos.y > height+50 && pos.x < -50) {
          myPoints.remove(this);
    }
  }
}
