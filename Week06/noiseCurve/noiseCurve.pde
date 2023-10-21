import processing.pdf.*;
int num = 800;
//int i,
int t=0;
//float[] x=new float[400];
Curve[] curves;

boolean savePDF;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  curves = new Curve[num];

  for (int i=0; i<curves.length; i++) {
    PVector fP = new PVector(i, 0);
    curves[i] = new Curve(fP);
    float ph = noise(i*0.01)*TWO_PI;
    curves[i].phase = ph;
  }
  //stroke(0, 32);
  //for (i=0; i<800; i++) {
  //  x[i]=i;
  //}
}

void draw() {
  background(0, 0, 100);
  //for (int i=0; i<curves.length; i++) {
  //  PVector fP = new PVector(i, 0);
  //  curves[i] = new Curve(fP);
  //}

  for (int i=1; i<curves.length; i++) {
    float xPre = curves[i].cvt.get(curves[i].cvt.size()-1).x;
    float xNow = xPre += noise(i*.05, t*.01)-0.48;
    PVector cv = new PVector(xNow, t);
    curves[i].cvt.add(cv);
  }
  //point(xx, t);
  //PVector tp = new PVector(xx, t);

  //curves[i].cvt.add(tp);
  t++;

  if (savePDF) {
    beginRecord(PDF, "curves.pdf");
  }

  for (Curve c : curves) {
    c.drawCurve();
  }

  if (savePDF) {
    endRecord();
    savePDF = false;
  }
}

void keyPressed() {
  if (key == 'p') savePDF=true;
}
