Week03 resource

# 课堂示范代码

![img](https://github.com/ddurAdvisor/CreativeCoding-VCD-2023Fall/blob/main/Week03/sourceImages/attractionAndCollisionTest.png)

``` java
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
```
- [完整的源程序：attractionAndCollisionTest](https://github.com/ddurAdvisor/CreativeCoding-VCD-2023Fall/tree/main/Week03/attractionAndCollisionTest)

# Basic Shape Operation

## tutorials_array_01

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/tutorials_array_01.png)

``` java

```
- [完整的源程序：tutorials_array_01](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/tutorials_array_01)




## tutorials_array_02

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/tutorials_array_02.png)

``` java

```
- [完整的源程序：tutorials_array_02](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/tutorials_array_02)




## bit2atom_190626_01_class

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/bit2atom_190626_01_class.png)

``` java

```
- [完整的源程序：bit2atom_190626_01_class](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/bit2atom_190626_01_class)


## bit2atom_190626_02_class

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/bit2atom_190626_02_class.png)

``` java

```
- [完整的源程序：bit2atom_190626_02_class](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/bit2atom_190626_02_class)



## bit2atom_190626_03_class_repellence

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/bit2atom_190626_03_class_repellence.png)

``` java

```
- [完整的源程序：bit2atom_190626_03_class_repellence](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/bit2atom_190626_03_class_repellence)


## bit2atom_190626_04_class_repellence
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/bit2atom_190626_04_class_repellence.png)

``` java

```
- [完整的源程序：bit2atom_190626_04_class_repellence](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/bit2atom_190626_04_class_repellence)



## bit2atom_190626_05_ArrayList
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/bit2atom_190626_05_ArrayList.png)

``` java

```
- [完整的源程序：bit2atom_190626_05_ArrayList](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/bit2atom_190626_05_ArrayList)



## bit2atom_190626_06_ArrayList
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/bit2atom_190626_06_ArrayList.png)

``` java

```
- [完整的源程序：bit2atom_190626_06_ArrayList](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/bit2atom_190626_06_ArrayList)





## shapeOperation1
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/shapeOperation1.png)

``` java

```
- [完整的源程序：shapeOperation1](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation1)



## shapeOperation2
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/shapeOperation2.png)

``` java

```
- [完整的源程序：shapeOperation2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation2)



## shapeOperation3
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/shapeOperation3.png)

``` java

```
- [完整的源程序：shapeOperation3](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation3)



## shapeOperation4
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/shapeOperation4.png)

``` java

```
- [完整的源程序：shapeOperation4](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation4)



## shapeOperation5
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/shapeOperation5.png)

``` java

```
- [完整的源程序：shapeOperation5](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation5)



## bit2atom20220927a_particleConnections
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/bit2atom20220927a_particleConnections.png)

``` java

```
- [完整的源程序：bit2atom20220927a_particleConnections](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_001)



## bit2atom_20220325b_seamlessPatterns_new
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/sourceImages/bit2atom_20220325b_seamlessPatterns_new.png)

``` java

```
- [完整的源程序：bit2atom_20220325b_seamlessPatterns_new](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/bit2atom_20220325b_seamlessPatterns_new)





# shape Operation: Other Examples

## theme_shape_001

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_001/theme_shape_001.png)

``` java

```
- [完整的源程序：theme_shape_001](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_001)


## theme_shape_002

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_002/theme_shape_002.png)

``` java

```
- [完整的源程序：theme_shape_002](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_002)


## theme_shape_003

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_003/theme_shape_003.png)

``` java

```
- [完整的源程序：theme_shape_003](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_003)


## theme_shape_004

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_004/theme_shape_004.png)

``` java

```
- [完整的源程序：theme_shape_004](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_004)


## theme_shape_005

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_005/theme_shape_005.png)

``` java

```
- [完整的源程序：theme_shape_005](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_005)


## theme_shape_006

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_006/theme_shape_006.png)

``` java

```
- [完整的源程序：theme_shape_006](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_006)



## theme_shape_007

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_007/theme_shape_007.png)

``` java

```
- [完整的源程序：theme_shape_007](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_007)



## theme_shape_008

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_008/theme_shape_008.png)

``` java

```
- [完整的源程序：theme_shape_008](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_008)



## theme_shape_009

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_009/theme_shape_009.png)

``` java

```
- [完整的源程序：theme_shape_009](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_009)



## theme_shape_010

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_010/theme_shape_010.png)

``` java

```
- [完整的源程序：theme_shape_010](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_010)



## theme_shape_011

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_011/theme_shape_011.png)

``` java

```
- [完整的源程序：theme_shape_011](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_011)



## theme_shape_012

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_012/theme_shape_012.png)

``` java

```
- [完整的源程序：theme_shape_012](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_012)


## theme_shape_013

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_013/theme_shape_013.png)

``` java

```
- [完整的源程序：theme_shape_013](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_013)


## theme_shape_014

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_014/theme_shape_014.png)

``` java

```
- [完整的源程序：theme_shape_014](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_014)


## theme_shape_015

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_015/theme_shape_015.png)

``` java

```
- [完整的源程序：theme_shape_015](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_015)


## theme_shape_016

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_016/theme_shape_016.png)

``` java

```
- [完整的源程序：theme_shape_016](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_016)


## theme_shape_017

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_017/theme_shape_017.png)

``` java

```
- [完整的源程序：theme_shape_017](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_017)


## theme_shape_018

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_018/theme_shape_018.png)

``` java

```
- [完整的源程序：theme_shape_018](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_018)


## theme_shape_019

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_019/theme_shape_019.png)

``` java

```
- [完整的源程序：theme_shape_019](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_019)


## theme_shape_020

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_020/theme_shape_020.png)

``` java

```
- [完整的源程序：theme_shape_020](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_020)



## theme_shape_021

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_021/theme_shape_021.png)

``` java

```
- [完整的源程序：theme_shape_021](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_021)



## theme_shape_022

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_022/theme_shape_022.png)

``` java

```
- [完整的源程序：theme_shape_022](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_022)



## theme_shape_023

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_023/theme_shape_023.png)

``` java

```
- [完整的源程序：theme_shape_023](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_023)



## theme_shape_024

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_024/theme_shape_024.png)

``` java

```
- [完整的源程序：theme_shape_024](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_024)



## theme_shape_025

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_025/theme_shape_025.png)

``` java

```
- [完整的源程序：theme_shape_025](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_025)



## theme_shape_026

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_026/theme_shape_026.png)

``` java

```
- [完整的源程序：theme_shape_026](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_026)



## theme_shape_027

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_027/theme_shape_027.png)

``` java

```
- [完整的源程序：theme_shape_027](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_027)



## theme_shape_028

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_028/theme_shape_028.png)

``` java

```
- [完整的源程序：theme_shape_028](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_028)



## theme_shape_029

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_029/theme_shape_029.png)

``` java

```
- [完整的源程序：theme_shape_029](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_029)



## theme_shape_030

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_030/theme_shape_030.png)

``` java

```
- [完整的源程序：theme_shape_030](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_030)



## theme_shape_032

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_031/theme_shape_031.png)

``` java

```
- [完整的源程序：theme_shape_031](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_031)



## theme_shape_032

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_032/theme_shape_032.png)

``` java

```
- [完整的源程序：theme_shape_032](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_032)



## theme_shape_033

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week03/shapeOperation_OtherExamples/theme_shape_033/theme_shape_033.png)

``` java

```
- [完整的源程序：theme_shape_033](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week03/shapeOperation_OtherExamples/theme_shape_033)
