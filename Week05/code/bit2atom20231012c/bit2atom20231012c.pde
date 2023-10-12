import processing.pdf.*;

boolean savePDF = false;

//Point[] myPoints;
ArrayList<Point> myPoints;

ArrayList<Line> lines;

PVector gravity;

void initiateData() {
  //myPoints = new Point[100];
  myPoints = new ArrayList<Point>();
  lines = new ArrayList<Line>();

  gravity = new PVector(0, 0.05);

  //for (int i = 0; i < myPoints.length; i++) {
  //  myPoints[i] = new Point(random(width), random(height));
  //}
}

void setup() {
  size(1200, 600);
  background(0);
  initiateData();
}

void draw() {
  //background(0);
  //for (int i = 0; i < myPoints.length; i ++) {
  //  myPoints[i].show();
  //}

  if (mousePressed) {
    PVector mp = new PVector(mouseX, mouseY);
    Point newPoint = new Point(mp, PVector.random2D());
    //myPoints.add(newPoint);
    //Point newPoint = new Point(mouseX+random(-50, 50), mouseY+random(-50, 50));
    myPoints.add(newPoint);
  }

  for (int i = 0; i < myPoints.size(); i ++) {
    //myPoints.get(i).move();
    //myPoints.get(i).show();
    myPoints.get(i).run();
  }

  if (savePDF == true) {
    beginRecord(PDF, "lines.pdf");
  }

  for (Point a : myPoints) {
    for (Point b : myPoints) {
      if (a != b) {
        float d = dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
        if (d <= 50) {
          strokeWeight(1);
          stroke(200, 0, 200, 51);
          line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
          //lines.add(new Line(a.pos, b.pos));
        }
      }
    }
  }

  //for (Line l : lines) {
  //  strokeWeight(1);
  //  stroke(200, 0, 200, 51);
  //  line(l.a.x, l.a.y, l.b.x, l.b.y);
  //}

  if (savePDF == true) {
    endRecord();
    savePDF = false;
  }

  println("myPoints.size:" + myPoints.size());
  println("lines.size:" + lines.size());
}

void keyPressed() {
  if (key == 'r') {
    initiateData();
  }
  if (key == 'p') {
    savePDF = true;
  }
  if(key == 's'){
    save("lines.png");
  }
}

//void mousePressed() {
//  for (int i = 0; i < 6; i ++) {
//    Point newPoint = new Point(mouseX+random(-50, 50), mouseY+random(-50, 50));
//    myPoints.add(newPoint);
//  }
//}
