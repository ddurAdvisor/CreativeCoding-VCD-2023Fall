void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  surface.setTitle("frameRate: " + nfc(frameRate, 2));
  testCircle();
}

void testCircle() {
  loadPixels();
  float circle1;
  float circle2;

  PVector cent1 = new PVector(width/3, height*2/5);
  PVector cent2 = new PVector(mouseX, mouseY);
  
  for (int i = 0; i < pixels.length; i ++) {
    PVector pos = new PVector(i%width, i/width);

    //circle1 = signedDstToCircle(cent1, pos, 100);
    circle2 = signedDstToCircle(cent2, pos, 200);
    circle1 = signedDstToBox(cent1, pos, new PVector(100, 200));
    
    float dstToScene = smoothMin(circle1, circle2, 70.0);
    //float dstToScene = min(circle1, circle2);
    
    int section = 20;
    
    pixels[i] = color(255%section * floor(dstToScene/section)*2, 
                      255%section/2 * -floor(dstToScene/section)*2, 
                      255%section/3 * -floor(dstToScene/section)*2);
  }
  updatePixels();
}

//Distance Functions
float lengthCalculate(PVector v) {
  return sqrt(v.x * v.x + v.y * v.y);
}

//Smoothing Function
float smoothMin(float dstA, float dstB, float k) {
  float h = max(k-abs(dstA-dstB), 0)/k;
  return min(dstA, dstB)- h*h*h*k*1/6.0;
}

//p is start, center is end, radius is radius. returns Negative values inside circle.
float signedDstToCircle(PVector p, PVector centre, float diameter) {
  float rad = diameter / 2;
  PVector v = new PVector(centre.x - p.x, centre.y - p.y); //breaking out (centre-p)
  return lengthCalculate(v) - rad;
}

float signedDstToBox(PVector p, PVector centre, PVector size) { //p = point to measure from
  PVector offset = new PVector(abs(p.x - centre.x) - size.x/2, abs(p.y - centre.y) - size.y/2);
  //dst from point outside box to edge (0 if inside box)
  float unsignedDst = lengthCalculate(new PVector(max(offset.x, 0), max(offset.y, 0)));
  //-dst from point inside box to edge (0 if outside bbox)
  float dstInsideBox = max(min(offset.x, 0), min(offset.y, 0));
  return unsignedDst + dstInsideBox;
}
