import bit2atomNoise4p5.*;

Bit2atomNoise baNoise;
PImage targetImage, sourceImage;

float increment = 0.1;

Agent[] myAgent;
ArrayList<Agent> agentWeb;

int gridSize = 5;
PVector[] fieldForce;
int colNum;
int rowNum;
float arrowLength = gridSize/4;
float arrowHead = gridSize/8;

boolean showFlow = false;

void settings() {
  sourceImage = loadImage("cat.png");//("jobs_800800.png"); //
  size(sourceImage.width, sourceImage.height);
}

void setup() {
  background(255);
  targetImage = createImage(width, height, RGB);
  for (int i = 0; i < targetImage.pixels.length; i ++) {
    targetImage.pixels[i] = color(255, 255, 255);
  }
  colNum = width/gridSize;
  rowNum = height/gridSize;
  initiateFlowField();
  initiateAgent();

  targetImage.loadPixels();
}

void initiateAgent() {
  myAgent = new Agent[200];
  for (int i = 0; i < myAgent.length; i ++) {
    PVector agentloc = new PVector(random(width), random(height));
    myAgent[i] = new Agent(agentloc);
  }
}

void draw() {
  //background(255);
  agentWeb = new ArrayList<Agent>();
  //noStroke();
  //fill(0, 10);
  //rect(0, 0, width, height);

  targetImage.updatePixels();

  //image(targetImage, 0, 0);

  if (showFlow) {
    showFlowFiled();
  }

  for (int i = 0; i < myAgent.length; i ++) {
    int ii = floor(myAgent[i].agentLocation.y/gridSize);
    if (ii>(height/gridSize-1)) {
      ii = height/gridSize-1;
    }
    int jj = floor(myAgent[i].agentLocation.x/gridSize);
    if (jj>(width/gridSize-1)) {
      jj = width/gridSize-1;
    }
    int p = ii* colNum + jj;
    myAgent[i].move(fieldForce[p]);
    println(ii+"|"+jj+":"+p);
  }

  if (agentWeb.size() > 0) {
    for (int i = 0; i < agentWeb.size()-1; i ++) {
      for (int j = i+1; j < agentWeb.size(); j ++) {
        PVector dt = PVector.sub(agentWeb.get(i).agentLocation, agentWeb.get(j).agentLocation);
        if (dt.mag() < 51) {
          stroke((agentWeb.get(i).agentColor + agentWeb.get(j).agentColor)/2, 5);
          strokeWeight(0.5);
          line(agentWeb.get(i).agentLocation.x, agentWeb.get(i).agentLocation.y,
            agentWeb.get(j).agentLocation.x, agentWeb.get(j).agentLocation.y);
        }
      }
    }
  }

  if (frameCount%120 == 0) {
    initiateFlowField();
  }
}

void initiateFlowField() {
  baNoise = new Bit2atomNoise(this);
  fieldForce = new PVector[colNum * rowNum];

  float yoff = 0;
  for (int i = 0; i < rowNum; i ++) {
    yoff += increment;
    float xoff = 0;
    for (int j = 0; j < colNum; j ++) {
      xoff += increment;
      float ang = baNoise.noise(xoff, yoff)*TWO_PI;

      int loc = j * colNum + i;
      fieldForce[loc] = new PVector(cos(ang), sin(ang));
      fieldForce[loc].mult(5);
    }
  }
}

void showFlowFiled() {
  for (int i = 0; i < rowNum; i ++) {
    for (int j = 0; j < colNum; j ++) {
      int loc = i * colNum + j;
      PVector arrow = fieldForce[loc];
      arrow.normalize();
      arrow.mult(arrowLength);
      pushMatrix();
      translate(j * gridSize + gridSize/2, i * gridSize + gridSize/2);
      stroke(100);
      strokeWeight(1);
      line(-arrow.x, -arrow.y, arrow.x, arrow.y);
      line(arrow.x, arrow.y, arrow.x - arrowHead * cos(arrow.heading()+PI/4), arrow.y - arrowHead * sin(arrow.heading()+PI/4));
      line(arrow.x, arrow.y, arrow.x - arrowHead * cos(arrow.heading()-PI/4), arrow.y - arrowHead * sin(arrow.heading()-PI/4));
      //textAlign(CENTER);
      //text(i+"|"+j, 0, 0);
      popMatrix();
    }
  }
}

class Agent{
  PVector agentLocation;
  //PVector flowForce;
  PVector speed = new PVector(0, 0);
  color agentColor;
  
  Agent(PVector loc){
    agentLocation = loc;
    //flowForce = force;
    //speed.mult(1);
  }
  
  void move(PVector f){
    speed.add(f);
    agentLocation.add(speed);
    speed.limit(5);
    f = new PVector(0, 0);
    
    //strokeWeight(2);
    //stroke(random(255), random(255), random(255));
    //point(agentLocation.x, agentLocation.y);
    
    if(agentLocation.x > width){
      agentLocation.x = 0;
    }
    if(agentLocation.x < 0){
      agentLocation.x = width-1;
    }
    if(agentLocation.y > height){
      agentLocation.y = 0;
    }
    if(agentLocation.y < 0){
      agentLocation.y = height-1;
    }
    
    setPixelValue();
  }
  
  void setPixelValue(){
    int location = floor(agentLocation.x) + floor(agentLocation.y)*width;
    float b = brightness(sourceImage.pixels[location]);
    if(b < 50){
      agentColor = color(b, b, b);
      agentWeb.add(this);
      //targetImage.pixels[location] = sourceImage.pixels[location];//color(0, 0, 0);
    }
  }
}

void keyPressed() {
  if (key == 'r') {
    initiateFlowField();
  }
  if (key == 'a') {
    initiateAgent();
  }
  if (key == 'f') {
    if (showFlow) {
      showFlow = false;
    } else {
      showFlow = true;
    }
  }
}
