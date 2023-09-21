float alpha;

void setup(){
  size(400, 400);
  background(255);
}
//sin();
//cos();
void draw(){
  //background(255);
  alpha += 0.01;
  fill(255,10);
  rect(0, 0, width, height);
  //fill(102);
  float die = abs(255*sin(alpha));
  fill(die);
  float ellipseSizeX = map(mouseX, 0, width, 5, 50);
  float ellipseSizeY = map(mouseY, 0, height, 5, 50);
  ellipse(mouseX,mouseY, ellipseSizeX, ellipseSizeY);
}
