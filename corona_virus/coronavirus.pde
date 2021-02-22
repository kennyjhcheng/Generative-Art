
float defaultDiameter = 70;
float velocity = 2;


int totalViruses = 7;
int numViruses = 0;
float[] x = new float[totalViruses];  // 0 1 2 3 4 5 6
float[] y = new float[totalViruses];
float[] xVelocity = new float[totalViruses];
float[] yVelocity = new float[totalViruses];
float[] r = new float[totalViruses];
float[] g = new float[totalViruses];
float[] b = new float[totalViruses];


boolean addNewVirus = true;

void setup() {
  size(500, 500);
  background(210, 221, 233);
  fill(0);
  
}

void draw() {
  background(210, 221, 233);
  if (addNewVirus && (numViruses < totalViruses)) {
    addVirus();
    addNewVirus = false;
  }
  
  for (int j = 0; j < numViruses; j++) {
    drawVirus(j);
    update(j);
  }
  
  //saveFrame("virus.png");
  
  
}

void update(int virusNumber) {
  boolean collided = false;
  x[virusNumber] += xVelocity[virusNumber] * velocity;
  y[virusNumber] += yVelocity[virusNumber] * velocity;
  
  if (x[virusNumber] + defaultDiameter / 2 > width) {
    xVelocity[virusNumber] = -1;
    collided = true;
  } else if (x[virusNumber] - defaultDiameter / 2 < 0) {
    xVelocity[virusNumber] = 1;
    collided = true;
  }
  
  if (y[virusNumber] + defaultDiameter / 2 > height) {
    yVelocity[virusNumber] = -1;
    collided = true;
  } else if (y[virusNumber] - defaultDiameter / 2 < 0) {
    yVelocity[virusNumber] = 1;
    collided = true;
  }
  
  if (collided) {
    addNewVirus = true;
    r[virusNumber] = random(0, 255);
    g[virusNumber] = random(0, 255);
    b[virusNumber] = random(0, 255);
  }
}

void drawVirus(int virusNumber) {
  float thisVirusX = x[virusNumber];
  float thisVirusY = y[virusNumber];
  float red = r[virusNumber];
  float green = g[virusNumber];
  float blue = b[virusNumber];
  
  pushMatrix();
  translate(thisVirusX, thisVirusY);
  
  //noFill();
  //ellipse(0, 0, defaultDiameter, defaultDiameter);
  
  fill(red, green, blue);
  rectMode(CENTER); 
  for (int j = 0; j < 3; j++) {
    rect(0,0, defaultDiameter, defaultDiameter / 15);
    rotate(radians(60));
  }
  
  ellipse(0,0, defaultDiameter / 3, defaultDiameter / 3);
  
  for (int j = 0; j < 6; j++) {
    ellipse(defaultDiameter / 2 - defaultDiameter / 10, 0, defaultDiameter / 5, defaultDiameter / 5);
    rotate(radians(60));
  }
  
  
  popMatrix();
}

void addVirus() {
  x[numViruses] = random(100, width - 100);
  y[numViruses] = random(100, height - 100);
  
  int xvelocity_temp = round(random(1,2));
  int yvelocity_temp = round(random(1,2));
  
  if (xvelocity_temp == 1) {
    xVelocity[numViruses] = 1;
  } else {
    xVelocity[numViruses] = -1;
  }
  
  if (yvelocity_temp == 1) {
    yVelocity[numViruses] = 1;
  } else {
    yVelocity[numViruses] = -1;
  }
  
  r[numViruses] = 228;
  g[numViruses] = 236;
  b[numViruses] = 74;
  
  numViruses += 1;
}
