//main

//声明类Dot的对象（数列）dots
Dot[] dots;

//总的对象数量
int num = 100;

//建立连线的最大距离阈值
float connectedDist = 50;

//是否绘制dots对象的圆形
boolean showDot = true;

//声明全局的重力加速度
PVector gravity = new PVector(0, 0.1);

//声明一个鼠标向量
PVector mouseVec;

void setup() {
  size(800, 800);
  background(0);
  initiateData();
}

//初始化dots，并为dots中的每个元素进行赋值
void initiateData() {
  dots = new Dot[num];//初始化dots
  for (int idx = 0; idx < dots.length; idx ++) {
    float nd= random(10, 50);
    float nx = random(0, width);
    float ny = random(0, height);
    dots[idx] = new Dot(nx, ny, nd);//为dots中的每个元素进行赋值
  }
}

void draw() {
  background(51);
  for (int idx = 0; idx < dots.length; idx ++) {
    if (showDot==true) {
      dots[idx].show();
    }
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    text(idx, dots[idx].pos.x, dots[idx].pos.y);//显示每个元素在数列中的序列号
  }

  mouseVec = new PVector(mouseX, mouseY);//对mouseVec赋值

  for (Dot n : dots) {
    n.move();
    n.connection();
    n.edge();
    n.collision();
    if (mousePressed) {
      n.mouseAttraction();
    }
  }
}

void keyPressed() {
  if (key == 'r') {
    initiateData();
  }
  if (key == 's') {
    showDot = !showDot;
  }
}
