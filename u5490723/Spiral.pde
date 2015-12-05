// This class creates spiral-shaped patterns.

class Spiral {

  float x, y;
  float size;

  Spiral() {
  }

  Spiral(float x, float y) {
    this.x = x;
    this.y = y;
    size = 1;
  }

  Spiral(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    strokeWeight(1);
    stroke(0);
    fill(254, 255, 3);
    ellipse(x, y+10*size, 7, 7);
    fill(255);
    ellipse(x, y, 5*size, 10*size);
    ellipse(x, y+10*size, 5*size, 5*size);
    ellipse(x, y+20*size, 5*size, 10*size);
    pushMatrix();
    translate(x+10*size, y+5*size);
    rotate(radians(45));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
    pushMatrix();
    translate(x-10*size, y+5*size);
    rotate(radians(315));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
    pushMatrix();
    translate(x+10*size, y+20*size);
    rotate(radians(315));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
    pushMatrix();
    translate(x-10*size, y+20*size);
    rotate(radians(45));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
    pushMatrix();
    translate(x+10*size, y+12*size);
    rotate(radians(90));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
    pushMatrix();
    translate(x-10*size, y+12*size);
    rotate(radians(90));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
  }

  void move(float size) {
    strokeWeight(1);
    stroke(0);
    fill(254, 255, 3);
    ellipse(x, y+10*size, 7, 7);
    fill(255);
    ellipse(x, y, 5*size, 10*size);
    ellipse(x, y+10*size, 5*size, 5*size);
    ellipse(x, y+20*size, 5*size, 10*size);
    pushMatrix();
    translate(x+10*size, y+5*size);
    rotate(radians(45));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
    pushMatrix();
    translate(x-10*size, y+5*size);
    rotate(radians(315));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
    pushMatrix();
    translate(x+10*size, y+20*size);
    rotate(radians(315));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
    pushMatrix();
    translate(x-10*size, y+20*size);
    rotate(radians(45));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
    pushMatrix();
    translate(x+10*size, y+12*size);
    rotate(radians(90));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
    pushMatrix();
    translate(x-10*size, y+12*size);
    rotate(radians(90));
    ellipse(0, 0, 5*size, 10*size);
    popMatrix();
  }
}

