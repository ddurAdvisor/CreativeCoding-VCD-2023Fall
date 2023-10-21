class CurveString {
  ArrayList<PVector> curvePoints;

  CurveString(ArrayList<PVector> cp) {
    curvePoints = cp;
  }

  void draw() {
    stroke(#000000);
    strokeWeight(1);
    noFill();
    if (curvePoints.size() > 0) {
      beginShape();
      curveVertex(curvePoints.get(0).x, curvePoints.get(0).y);
      for (PVector p : curvePoints) {
        curveVertex(p.x, p.y);
      }
      curveVertex(curvePoints.get(curvePoints.size() - 1).x, curvePoints.get(curvePoints.size() - 1).y);
      endShape();
    }

    if (showPoints) {
      stroke(#000000);
      strokeWeight(3);
      noFill();
      for (PVector p : curvePoints) {
        point(p.x, p.y);
      }
    }
  }
}
