void setup() {
  size(800, 800, P2D);
  background(255);
  smooth();
  stroke(20);
  strokeWeight(2);
  noFill();
}

float scale = 50;
float resolution = 0.002;
int numPoints = 500;

float radius = 350;
int numRings = 40;

void draw() {
  for (float r = 0; r < radius; r += radius / numRings) {
    beginShape();
    for (float a = -TAU/numPoints; a < TAU+TAU/numPoints; a += TAU / numPoints) {
      var x = width/2 + r * cos(a);
      var y = height/2 + r * sin(a);

      var n = map(noise(x * resolution, y * resolution), 0, 1, -scale, scale);

      curveVertex(x + n, y + n);

      if (random(1)>0.75-0.25*sin(r)) {
        endShape();
        beginShape();
      }
    }
    endShape();
  }
  noLoop();
}
