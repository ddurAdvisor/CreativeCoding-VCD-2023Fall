PVector[] poly;

void setup() {
  size(800, 800);
  initiateData();
}

void initiateData() {
  float ang = TWO_PI/8;
  float l = 200;
  poly = new PVector[8];
  for (int i = 0; i < 8; i ++) {
    float ll = random(l/2, l);
    poly[i] = new PVector(ll*cos(ang*i), ll*sin(ang*i));
    poly[i].add(new PVector(width/2, height/2));
  }
}

void drawP() {
  beginShape();
  for (int i = 0; i < poly.length; i ++) {
    vertex(poly[i].x, poly[i].y);
  }
  endShape(CLOSE);
}

void draw() {
  background(0);

  mouseOverPolygon();

  if (mouseOver) {
    stroke(255, 0, 255);
    fill(255, 255, 0, 51);
  } else {
    stroke(255);
    noFill();
  }

  drawP();
}
