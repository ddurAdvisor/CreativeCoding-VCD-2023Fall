float scaleIndex = 1;
float scaleStep;
boolean mouseOver;

void keyPressed() {
  if (key == 'r') {
    initiateData();
  }
  if (key == 'a') {
    scaleIndex += 0.01;
    for (int i = 0; i < poly.length; i ++) {
      poly[i].mult(scaleIndex);
    }
    scaleIndex = 1;
  }
  if (key == 'z') {
    scaleIndex -= 0.01;
    for (int i = 0; i < poly.length; i ++) {
      poly[i].mult(scaleIndex);
    }
    scaleIndex = 1;
  }
}

void mouseWheel(MouseEvent event) {
  if (mouseOver) {
    scaleStep = event.getCount();
    scaleIndex += scaleStep*0.01;
    for (int i = 0; i < poly.length; i ++) {
      //p[i].mult(scaleIndex);
      poly[i].sub(new PVector(mouseX, mouseY)).mult(scaleIndex).add(new PVector(mouseX, mouseY));
    }
    scaleIndex = 1;
  }
}

void mouseDragged() {
  if (mouseOver) {
    for (int i = 0; i < poly.length; i ++) {
      PVector move = PVector.sub(new PVector(mouseX, mouseY), new PVector(pmouseX, pmouseY));
      poly[i].add(move);
    }
  }
}

void mouseOverPolygon() {
  if (InsidePolygon(poly, new PVector(mouseX, mouseY))) {
    mouseOver = true;
  } else {
    mouseOver = false;
  }
}

boolean InsidePolygon(PVector[] polyPoint, PVector p) {
  double angle=0;
  PVector point1 = new PVector();
  PVector point2 = new PVector();

  for (int i=0; i<polyPoint.length; i++) {
    point1.x = polyPoint[i].x - p.x;
    point1.y = polyPoint[i].y - p.y;
    point2.x = polyPoint[(i+1)%polyPoint.length].x - p.x;
    point2.y = polyPoint[(i+1)%polyPoint.length].y - p.y;
    angle += Angle2D(point1.x, point1.y, point2.x, point2.y);
  }

  if (Math.abs(angle) < PI)  return false;
  else  return true;
}

double Angle2D(double x1, double y1, double x2, double y2) {
  double dtheta, theta1, theta2;

  theta1 = Math.atan2(y1, x1);
  theta2 = Math.atan2(y2, x2);
  dtheta = theta2 - theta1;
  while (dtheta > PI)  dtheta -= TWO_PI;
  while (dtheta < -PI)  dtheta += TWO_PI;

  return dtheta;
}
