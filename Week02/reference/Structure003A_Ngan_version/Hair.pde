class Hair {

  float repel_speed;

  float radius, origRadius;
  float angle, origAngle;
  float x, y, regX, regY, nextX, nextY, lastx, lasty;

  float speedFactor = 5;

  Circle parent;

  Hair( float rx, float ry, float r, float a, Circle parent ) {
    radius = r;
    origRadius = r;

    angle = a;
    origAngle = a;

    this.parent = parent;

    regX = rx;
    regY = ry;

    nextX = parent.x+regX+cos(angle)*radius;
    nextY = parent.y+regY+sin(angle)*radius;

    x = nextX;
    y = nextY;
  }

  void updatePos() {

    nextX = parent.x+regX+cos(angle)*radius;
    nextY = parent.y+regY+sin(angle)*radius;

    float dx = nextX - x;
    float dy = nextY - y;
    if (abs(dx)>1) {
      x += dx/speedFactor;
      y += dy/speedFactor;
    }

    if (abs(dx)>200 || abs(dy)>200) {
      x = nextX;
      y = nextY;
    }
  }

  void draw() {
    line( parent.x+regX, parent.y+regY, x, y );
  }

  void focus( float px, float py ) {
    float dx = px-(parent.x+regX);
    float dy = py-(parent.y+regY);

    angle = atan2( dy, dx );
    radius = dist( px, py, parent.x+regX, parent.y+regY );
  }

  void revertFocus() {
    angle = origAngle;
    radius = origRadius;
  }
}
