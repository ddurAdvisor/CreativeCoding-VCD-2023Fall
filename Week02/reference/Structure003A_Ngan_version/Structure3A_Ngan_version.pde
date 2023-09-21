/*
 
 A surface filled with one hundred medium to small sized circles.
 Each circle has a different size and direction, but moves at the same slow rate.
 Display:
     >>> A. The instantaneous intersections of the circles
         B. The aggregate intersections of the circles

 
 */

Circle[] cc;

void setup(){
  size( 600, 600 );
  frameRate( 30 );
  cc = new Circle[100];
  for (int i=0; i<cc.length; i++) {
    cc[i] = new Circle( random(width), random(height), 15+random(20), i );
  }
  ellipseMode(CENTER);
  rectMode(CENTER);
  noFill();
}

void draw()
{
  background(255);

  noStroke();
  fill(0);

  for (int i=0; i<cc.length; i++) {
    cc[i].draw();
  }

  noFill();
  stroke(255);

  for (int i=0; i<cc.length; i++) {
    cc[i].drawHair();
  }
}
