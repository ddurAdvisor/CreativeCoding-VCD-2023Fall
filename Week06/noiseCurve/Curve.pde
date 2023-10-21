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
