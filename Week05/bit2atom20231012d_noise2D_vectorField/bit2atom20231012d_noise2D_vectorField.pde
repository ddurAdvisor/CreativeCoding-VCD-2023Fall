int count;
float x = 0;
float increment = 0.1;
float incrementX = 0.01;
float incrementY = 0.01;
float incrementC = 0.01;

int pointNum = 100;

PVector[][] arrows;

ArrayList<Point> points;

float scale = 60.0;
int col = 200;
int row = 200;
float unitX;
float unitY;

boolean showVectorField;

void setup() {
  size(600, 600);
  background(0);
  arrows = new PVector[col][row];
  unitX = width/col;
  unitY = height/row;

  points = new ArrayList<Point>();

  initiateData();
  vectorField();
}

void initiateData() {
  for (int i = 0; i < pointNum; i ++) {
    PVector p = new PVector(random(width), random(height));
    points.add(new Point(p));
  }
}

void vectorField() {
  for (int i = 0; i < col; i ++) {
    for (int j = 0; j < row; j ++) {
      //float nV = 255*noise(i*incrementX, j*incrementY, count*incrementC);
      float nValue = noise(i*incrementX, j*incrementY, count*incrementC);
      float angle = map(nValue, 0, 1, 0, TWO_PI);
      PVector pv = PVector.fromAngle(angle);

      arrows[i][j] = pv;
    }
  }
}

void draw() {
  //background(255);
  //vectorField();
  //float unitX = width/col;
  //float unitY = height/row;
  //for (int i = 0; i < col; i ++) {
  //  for (int j = 0; j < row; j ++) {
  //    //float nV = 255*noise(i*incrementX, j*incrementY, count*incrementC);
  //    float nValue = noise(i*incrementX, j*incrementY);//, count*incrementC);
  //    float angle = map(nValue, 0, 1, 0, TWO_PI);
  //    PVector pv = PVector.fromAngle(angle);

  //    arrows[i][j] = pv;

  //    float arrowSize = unitX/2;
  //    float apX = unitX*i - unitX/2 + arrowSize/2 *cos(angle);
  //    float apY = unitY*j - unitY/2 + arrowSize/2 *sin(angle);
  //    float bpX = unitX*i - unitX/2 + arrowSize/2 *cos(angle + PI);
  //    float bpY = unitY*j - unitY/2 + arrowSize/2 *sin(angle + PI);

  //    if (showVectorField) {
  //      strokeWeight(1);
  //      stroke(0);
  //      line(apX, apY, bpX, bpY);
  //    }
  //    //if (nV > 127) {
  //    //  nV = 255;
  //    //} else {
  //    //  nV = 0;
  //    //}
  //    //int nVI = floor(nV/20)*20;
  //    //fill(nVI);
  //    //noStroke();
  //    //strokeWeight(1);
  //    //fill(255);
  //    //rect(unitX*i, unitY*j, unitX, unitY);
  //  }
  //}

  for (Point p : points) {
    p.move();
    p.edge();
    p.show();
  }


  //strokeWeight(5);
  //stroke(255);
  //float yValue = noise(x)*scale;
  //point(count,height/2+yValue);
  //x += increment;

  //stroke(200, 255, 0);
  //point(count, height*3/4 + random(scale));
  count ++;
}

void mousePressed() {
  points.add(new Point(new PVector(mouseX, mouseY)));
}

void keyPressed() {
  if (key == 'f') {
    showVectorField = !showVectorField;
  }
  if (key == 'r') {
    initiateData();
    vectorField();
  }
}
