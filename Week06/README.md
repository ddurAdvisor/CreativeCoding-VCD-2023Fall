Week06: Image, Pixel and vectorized output

## class tutorial

![img](https://github.com/ddurAdvisor/CreativeCoding-VCD-2023Fall/blob/main/Week06/noiseCurve/COLORFULCurves.png)

class Curve
``` java
class Curve {
  ArrayList<PVector> cvt;//curve
  float phase;

  Curve(PVector cv) {//构造函数
    cvt = new ArrayList<PVector>();
    //PVector tcv = new PVector(random(width), 0);
    cvt.add(cv);
    //phase = random(TWO_PI);
  }

  void drawCurve() {
    noFill();
    //stroke(0, 24);
    strokeWeight(1);
    beginShape();
    for (int i = 1; i < cvt.size(); i++) {
      float ang = TWO_PI/num;
      
      float h = 360/2 + 180 *sin(phase+ang*i);
      stroke(h, 100, 100, 24);
      //strokeWeight(map(i, 0, cvt.size()-1, 10, 0.2));
      //vertex(cvt.get(i).x, cvt.get(i).y);//curveVertex();
      line(cvt.get(i-1).x, cvt.get(i-1).y, cvt.get(i).x, cvt.get(i).y);
    }
    endShape();
  }
}
```
growth of curves
``` java
for (int i=1; i<curves.length; i++) {
    float xPre = curves[i].cvt.get(curves[i].cvt.size()-1).x;
    float xNow = xPre += noise(i*.05, t*.01)-0.48;
    PVector cv = new PVector(xNow, t);
    curves[i].cvt.add(cv);
  }
```
phase
``` java
for (int i=0; i<curves.length; i++) {
    PVector fP = new PVector(i, 0);
    curves[i] = new Curve(fP);
    float ph = noise(i*0.01)*TWO_PI;
    curves[i].phase = ph;
  }
```

- [完整的源程序：noiseCurve](https://github.com/ddurAdvisor/CreativeCoding-VCD-2023Fall/tree/main/Week06/COLORFULCurves.png)




![img](https://github.com/ddurAdvisor/CreativeCoding-VCD-2023Fall/blob/main/Week06/mitLogo/mitLogo0.png)

``` java
void generateLogo() {
  // calculate the size of the rectangles
  smallCubeSize = round(logoSize * smallCubeRatio);
  largeCubeSize = round(logoSize * largeCubeRatio);

  // make logo appear in the middle of the screen
  translate((width / 2) - (logoSize / 2), (height / 2) - (logoSize / 2));

  // draw outline of logo to help
  stroke(150);
  noFill();
  rect(0, 0, logoSize, logoSize);

  noStroke();
  // draw the cubes
  for (int i = 0; i < 3; i++) {
    // find small cube position
    int smallX = round(random(0, logoSize - smallCubeSize));
    int smallY = round(random(0, logoSize - smallCubeSize));

    // find large cube position
    int largeX = round(random(0, logoSize - largeCubeSize));
    int largeY = round(random(0, logoSize - largeCubeSize));

    // draw lines in between with simple check of where the lines should go
    fill(colors[i]);
    beginShape();

    // if large cube is in top left
    if (largeX < smallX && largeY < smallY) {
      vertex(largeX, largeY + largeCubeSize);
      vertex(largeX + largeCubeSize, largeY);
      vertex(smallX + smallCubeSize, smallY);
      vertex(smallX, smallY + smallCubeSize);
    }
    // if large cube is in top right
    if (largeX > smallX && largeY < smallY) {
      vertex(largeX, largeY);
      vertex(largeX + largeCubeSize, largeY + largeCubeSize);
      vertex(smallX + smallCubeSize, smallY + smallCubeSize);
      vertex(smallX, smallY);
    }
    // if large cube is in bottom right
    if (largeX > smallX && largeY > smallY) {
      vertex(smallX, smallY + smallCubeSize);
      vertex(smallX + smallCubeSize, smallY);
      vertex(largeX + largeCubeSize, largeY);
      vertex(largeX, largeY + largeCubeSize);
    }
    // if large cube is in bottom left
    if (largeX < smallX && largeY > smallY) {
      vertex(smallX, smallY);
      vertex(smallX + smallCubeSize, smallY + smallCubeSize);
      vertex(largeX + largeCubeSize, largeY + largeCubeSize);
      vertex(largeX, largeY);
    }

    endShape();

    // draw large cube
    fill(colors[i]);
    rect(largeX, largeY, largeCubeSize, largeCubeSize);

    // draw small cube
    fill(0);
    rect(smallX, smallY, smallCubeSize, smallCubeSize);
  }
}
```
- [完整的源程序：mitLogo](https://github.com/ddurAdvisor/CreativeCoding-VCD-2023Fall/tree/main/Week06/mitLogo)

## array of colors
- int[] colors = {#1770ac, #cd402e, #fbd033};


![img](https://github.com/ddurAdvisor/CreativeCoding-VCD-2023Fall/blob/main/Week06/mitLogo/mitLogo0.png)

FlowField
``` java
// Daniel Shiffman
// http://youtube.com/thecodingtrain
// http://codingtra.in
//
// Coding Challenge #24: Perlin Noise Flow  Field
// https://youtu.be/BjoM9oKOAKY

public class FlowField {
  PVector[] vectors;
  int cols, rows;
  float inc = 0.01;
  int scl;

  FlowField(int res) {
    scl = res;
    cols = floor(width / res) + 1;
    rows = floor(height / res) + 1;
    vectors = new PVector[cols * rows];
  }

  void update() {
    float yoff = 0;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        float angle = noise(xoff, yoff) * TWO_PI;
        //float  n = (float) noise.eval(xoff, yoff);
        //float  n = (float) noise.eval(xoff, yoff);
        //float angle = map(n, -1, 1, 0, TWO_PI);
        PVector v = PVector.fromAngle(angle);
        v.setMag(scl);
        int index = x + y * cols;
        vectors[index] = v;

        xoff += inc;
      }
      yoff += inc;
    }
  }

  void display() {
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        int index = x + y * cols;
        PVector v = vectors[index];

        stroke(178);
        strokeWeight(2);
        pushMatrix();
        translate(x * scl, y * scl);
        rotate(v.heading());
        line(0, 0, scl, 0);
        popMatrix();
      }
    }
  }
}
```
- [完整的源程序：mitLogo](https://github.com/ddurAdvisor/CreativeCoding-VCD-2023Fall/tree/main/Week06/FidenzaStyle)

Particle
``` java
// Daniel Shiffman
// http://youtube.com/thecodingtrain
// http://codingtra.in
//
// Coding Challenge #24: Perlin Noise Flow  Field
// https://youtu.be/BjoM9oKOAKY

public class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector previousPos;
  float maxSpeed;
  boolean finished = false;
  color col;
  int widthParticle;
  
  float margin = 0;//least distance between two neighbors

  int rand = (int) random(colors.length);
  int randCol1 = (int) random(colors.length);
  int randCol2 = (int) random(colors.length);

  ArrayList<PVector> history = new ArrayList<PVector>();

  Particle(PVector start, float maxspeed, color col, int widthParticle) {
    this.maxSpeed = maxspeed;
    this.pos = start;
    this.vel = new PVector(0, 0);
    this.acc = new PVector(0, 0);
    this.previousPos = pos.copy();
    this.col = col;
    this.widthParticle = widthParticle;
  }

  void update() {
    history.add(pos.copy());
    int rand = (int) random(10);

    pos.add(vel);

    //sizeList.add(widthParticle);
    //widthParticle += 1;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void check(ArrayList<Particle> others) {
    if (!finished) {
      for (Particle other : others) {
        if (other != this) {
          for (PVector v : other.history) {
            float d = PVector.dist(pos, v);
            if (d < widthParticle*0.5 + other.widthParticle*0.5 + margin) {
              this.finished = true;
              return;
            }
          }
        }
      }
    }
  }

  void follow(FlowField flowfield) {
    int x = floor(pos.x / flowfield.scl);
    int y = floor(pos.y / flowfield.scl);
    int index = x + y * flowfield.cols;
    this.vel = flowfield.vectors[index];
  }

  void edges() {
    if (pos.x < 0 || pos.x > width-1 || pos.y < 0 || pos.y > height-1) {
      this.finished = true;
    }
  }

  void show() {
    stroke(col);
    noFill();
    strokeCap(SQUARE);
    beginShape();
    strokeWeight(widthParticle);

    for (int i = 0; i < history.size()-1; ++i) {
      PVector v = history.get(i+1);
      PVector pv = history.get(i);
      //noStroke();
      //fill(col);
      //strokeWeight(sizeList.get(i));
      //ellipse(v.x, v.y, sizeList.get(i), sizeList.get(i));
      vertex(v.x, v.y);

      stroke(col);
    }
    endShape();

    // Draw start tips in different color
    showStartTip();
    showSecondTip();
  }

  void showStartTip() {
    beginShape();
    strokeWeight(widthParticle);
    if (history.size() > 4) {
      for (int i = 0; i < colors.length; ++i) {
        PVector v1 = history.get(i);
        if (rand < 4) {
          stroke(colors[randCol1]);
          vertex(v1.x, v1.y);
        }
      }
    }
    endShape();
  }

  void showSecondTip() {
    beginShape();
    strokeWeight(widthParticle);
    if (history.size() > 4) {
      for (int i = 2; i < 4; ++i) {
        PVector v1 = history.get(i);
        if (rand < 4) {
          stroke(colors[randCol2]);
          vertex(v1.x, v1.y);
        }
      }
    }
    endShape();
  }
}
```

## array of colors
i- nt colors[] = {#A83E36, #F54E42, #35F5F1, #A87214, #F5AA2A};
