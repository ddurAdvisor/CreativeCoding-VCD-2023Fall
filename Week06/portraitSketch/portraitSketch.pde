// outline: takes an image (image.jpg) and creates a sketch version

import processing.pdf.*;

String iName = "Q-Tip.jpg";//"memorialTree.png";//"einstain1280.png";
ArrayList<CurveString> cps;
ArrayList<PVector> cp;

boolean savePDF = false;
boolean processFinished;
boolean showPoints;

int maxiumDistance = 25;

// parameters
// NO real control, so be careful

int NP = 10000; // 1000 for line art, 10000 for complex images, O(N^2) so be patient!!!
int B = 3; // try 2 or 3
float THR = 5; // range 5-50 threhold of standard deviation of (2B+1)*(2B+1) neighbor pixels
float MD = 6; // range 0-10 minium distance between two valid points
int NMP = 6; // range 1-15

float[][] punts;
color[] cpunts;
int[] usat;
int[] NmP = new int[NMP];
float[] NdmP = new float[NMP];

int inici = 0;

int fase=0;

PImage img;

//int cpCount = 0;
//int cpsCount = 0;

void settings() {
  loadImageFile("./"+iName);
  size(img.width, img.height);
}

void setup() {
  //llegeixImatge("./"+iName);
  //size(img.width, img.height);
  cps = new ArrayList<CurveString>();
  cp = new ArrayList<PVector>();

  processData();
}


void loadImageFile(String s) {
  img = loadImage(s);
  img.loadPixels();
}

float fVar(int x, int y) {
  // number of neighborhood: (2B+1)*(2B+1) pixels
  float meanNeighboroodBrightness = 0;
  for (int row = -B; row <= B; row ++) {
    for (int col = -B; col <= B; col ++) {
      int currentLocation = (y + row) * img.width + (x + col);
      color c = img.pixels[currentLocation];
      meanNeighboroodBrightness += brightness(c); //get brightness of each pixel
    }
  }
  meanNeighboroodBrightness /= float((2 * B + 1) * (2 * B + 1));

  float sd = 0; //standard deviation
  for (int row = -B; row < B; row ++) {
    for (int col = -B; col < B; col ++) {
      int currentLocation = (y + row) * img.width + (x + col);
      color c = img.pixels[currentLocation];
      sd += (brightness(c) - meanNeighboroodBrightness)*(brightness(c) - meanNeighboroodBrightness);
    }
  }
  sd = sqrt(sd) / (float)((2 * B + 1) * (2 * B + 1));    
  return sd;
}

void arrangePoints() {
  punts = new float[NP][2];
  cpunts = new color[NP];
  usat = new int[NP];

  int nint1 = 0;
  int nint2 = 0;

  for (int i = 0; i < NP; ) {
    //scatter random points around the safe (B < x < width-B and B < y < height-B) area
    int x = B + int(random(width - 2 * B));
    int y = B + int(random(height - 2 * B));

    //println(i+" = "+x+", "+y+": "+THR+", "+MD);

    // points need to be at least MD far from each other
    int flag = 0;

    if (MD > 0.0) {  
      for (int j = 0; flag == 0 && j < i; j ++) {
        if (dist(x, y, punts[j][0], punts[j][1]) < MD) {
          flag = 1;
        }
      }
    }

    if (flag == 0) { 
      nint1 = 0;
      float f = fVar(x, y);

      // use only "valid" points      
      if (f >= THR) {
        nint2 = 0;
        punts[i][0] = x;
        punts[i][1] = y;
        cpunts[i] = img.pixels[y * img.width + x];
        usat[i] = 0;
        i ++;
      } else {
        nint2++;
        if (nint2 >= 10) {
          THR /= (1 + 1.0 / float(NP - i));
          MD /= (1 + 1.0 / float(NP - i));
          nint2 = 0;
        }
      }
    } else {
      nint1 ++;
      if (nint1 >= 10) {
        MD /= 2.0;
        THR *= 1.618;
        nint1 = 0;
      }
    }
  }
}

int NessimMesProper(int i) {
  if (NMP <= 1) {
    int mP = -1;//set a index to mark current point
    float dmP = dist(0, 0, width, height);
    for (int j = 0; j < NP; j ++) {
      if (usat[j] == 0) {
        float jmP = dist(punts[i][0], punts[i][1], punts[j][0], punts[j][1]);
        if (jmP < dmP) {
          dmP = jmP;
          mP = j;
        }
      }
    }
    return mP;
  } else {
    for (int j = 0; j < NMP; j ++) {
      NmP[j] = -1;    
      NdmP[j] = dist(0, 0, width, height);
    }
    for (int j = 0; j < NP; j ++) {
      if (usat[j] == 0) {
        float jmP = dist(punts[i][0], punts[i][1], punts[j][0], punts[j][1]);
        int k = NMP;
        while (k > 0 && NdmP[k-1] > jmP) {
          k--;
        }
        if (k < NMP) {
          for (int l = 0; l < (NMP - k) - 1; l ++) {
            NmP[(NMP - 1) - l] = NmP[(NMP - 1) - (l + 1)];
            NdmP[(NMP - 1) - l] = NdmP[(NMP - 1) - (l + 1)];
          }
          NmP[k] = j;
          NdmP[k] = jmP;
        }
      }
    }
    return NmP[NMP - 1];
  }
}

void processData() {
  if (fase == 0) {
    arrangePoints();
    background(#FFFFFF);
    fase = 1;
  } else {
    if (inici != -1) {
      stroke(#000000);
      usat[inici] = 1;

      int seguent = NessimMesProper(inici);
      if (seguent != -1) {
        float dd = (punts[inici][0] - punts[seguent][0])*(punts[inici][0] - punts[seguent][0]) + 
          (punts[inici][1] - punts[seguent][1])*(punts[inici][1] - punts[seguent][1]);
        if (dd < (maxiumDistance * maxiumDistance)) {
          //line(punts[inici][0], punts[inici][1], punts[seguent][0], punts[seguent][1]);
          PVector p = new PVector(punts[inici][0], punts[inici][1]);
          cp.add(p);
          //cpCount ++;
          //println("cp:" + cpCount);

          strokeWeight(2);
          point(p.x, p.y);
        } else {
          cps.add(new CurveString(cp));

          cp = new ArrayList<PVector>();
          //cpCount = 0;
          //println("cps.size:" + cps.size() + "||" + cps.get(cps.size()-1).curvePoints.size());
        }
      }
      //cps.add(new CurveString(cp));
      inici = seguent;
      //cp = new ArrayList<PVector>();
    } else {
      //cps.add(new CurveString(cp));
      processFinished = true;
      println("processFinished!");
      //println("cps.size:" + cps.size() + "||" + "cp.get(1).size:" + cps.get(1).curvePoints.size());
    }
  }
}

void draw() {
  if (!processFinished) {
    processData();
  }

  if (processFinished) {

    background(#FFFFFF);

    String timeStamp = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second();

    if (savePDF == true) {
      beginRecord(PDF, "output/outline_"+timeStamp+"_"+iName + ".pdf");
    }

    for (CurveString c : cps) {
      c.draw();
    }

    if (savePDF == true) {
      endRecord();
      save("output/outline_"+timeStamp+"_"+iName);
      savePDF = false;
    }
  }
}

void keyPressed() {
  if (key == 'p') {
    savePDF = true;
  }
  if (key == 'd') {
    if (!showPoints) {
      showPoints = true;
    } else {
      showPoints = false;
    }
  }
}
