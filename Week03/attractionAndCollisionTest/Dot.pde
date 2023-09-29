class Dot {
  //成员属性变量
  //float dotX, dotY;
  PVector pos;
  //float xS, yS;
  PVector speed;
  float dotD;
  color filledColor;
  
  //构造函数
  Dot(float dx, float dy, float dd) {
    pos = new PVector();
    speed = new PVector();
    pos.x = dx;
    pos.y = dy;
    dotD = dd;
    //为每个对象元素赋予颜色
    filledColor = color(random(255), random(255), random(255));
    //speed.x = random(-1, 1);
    //speed.y = random(-1, 1);
    
    //为每个对象初始化speed
    speed = PVector.random2D();
  }

  //成员行为
  void move() {
    //dotX = dotX + xS;
    //dotY = dotY + yS;
    speed.add(gravity);//向量求和：把gravity加给speed
    pos.add(speed);
    speed.limit(5);//将speed的速度限制在一个范围内
  }

  //mouseAttraction
  void mouseAttraction() {
    for (Dot dt : dots) {
      //计算鼠标向量与目标对象之间的距离
      float d = dist(mouseVec.x, mouseVec.y, this.pos.x, this.pos.y);
      //创建吸引力向量ma
      PVector ma = PVector.sub(mouseVec, pos);
      //对ma进行归一化
      ma.normalize();
      //控制ma的长度，使得ma与对象的dotD值成正比，与鼠标向量与目标对象之间的距离成反比
      ma.mult(dotD/(d*100));//*100用于控制吸引力向量ma的作用强度
      //将ma加给speed
      speed.add(ma);
    }
  }
  
  //对象间的碰撞检测
  void collision() {
    for (Dot dt : dots) {
      if (dt != this) {
        //计算两个对象间的距离
        float d = dist(dt.pos.x, dt.pos.y, this.pos.x, this.pos.y);
        //当两个对象间的距离小于两个对象的半径值和时，两个对象处于碰撞状态中
        if (d < dt.dotD/2 + this.dotD/2) {
          //创建碰撞反弹向量
          PVector force = PVector.sub(this.pos, dt.pos);
          //计算两个对象处于碰撞状态中对象的穿透程度，即两对象圆心距离之和与半径值和的差值
          float cd = dt.dotD/2 + this.dotD/2 - d;
          //对force进行归一化
          force.normalize();
          //控制force的长度，使得force与穿透程度成正比，与对象的dotD值成反比
          force.mult(cd*10/dotD);//*10用于控制反弹向量的作用强度
          //把force加给speed
          speed.add(force);
        }
      }
    }
  }

  //边缘检测
  void edge() {
    if (pos.x-dotD/2 < 0) {//对象与左边框碰撞
      pos.x = dotD/2;
      speed.x = speed.x*-1;
    }
    if (pos.y-dotD/2 < 0) {//对象与上边框碰撞
      pos.y = dotD/2;
      speed.y *= -1;
    }
    if (pos.x+dotD/2 > width) {//对象与右边框碰撞
      pos.x = width - dotD/2;
      speed.x *= -1;
    }
    if (pos.y+dotD/2 > height) {//对象与下边框碰撞
      pos.y = height - dotD/2;
      speed.y *= -1;
    }
  }

  //绘制对象的基本形状
  void show() {
    fill(filledColor);
    //stroke(?);
    //strokeWeight(?);
    ellipse(pos.x, pos.y, dotD, dotD);
  }

  //在距离小于最大距离阈值的两个对象间绘制连线
  void connection() {
    for (Dot dt : dots) {
      if (dt != this) {
        //计算两个对象间的距离
        float d = dist(dt.pos.x, dt.pos.y, this.pos.x, this.pos.y);
        //如果两个对象间的距离在最大距离阈值之内，两个对象间即绘制连线
        if (d <= connectedDist) {
          //连线的颜色根据两个对象间距离大小映射到0-255之间
          stroke(map(d, 0, connectedDist, 0, 255));
          //strokeWeight(map(d, 0, connectedDist, 3, 1));
          line(dt.pos.x, dt.pos.y, this.pos.x, this.pos.y);
        }
      }
    }
  }
  
}
