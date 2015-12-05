// This class creates flower-shaped patterns.

class Flower {

  float x, y;
  float size;
  int speed;

  Flower() {
  }

  Flower(float x, float y) {
    this.x = x;
    this.y = y;
    size = 1;
  }

  Flower(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    strokeWeight(1);
    stroke(255);
    
    fill(206, 167, 23);
    ellipse(x, y, 5*size, 5*size);
    
    fill(236, 255, 36);
    ellipse(x, y-5*size, 5*size, 5*size);
    ellipse(x, y+5*size, 5*size, 5*size);
    ellipse(x-5*size, y, 5*size, 5*size);
    ellipse(x+5*size, y, 5*size, 5*size);

    fill(255, 157, 36);
    ellipse(x+5*size, y-5*size, 3*size, 3*size);
    ellipse(x-5*size, y-5*size, 3*size, 3*size);
    ellipse(x+5*size, y+5*size, 3*size, 3*size);
    ellipse(x-5*size, y+5*size, 3*size, 3*size);

    fill(9, 173, 10);
    pushMatrix();
    translate(x+10*size, y-10*size);
    rotate(radians(45));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();

    pushMatrix();
    translate(x-10*size, y-10*size);
    rotate(radians(315));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();

    pushMatrix();
    translate(x+10*size, y+10*size);
    rotate(radians(315));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();

    pushMatrix();
    translate(x-10*size, y+10*size);
    rotate(radians(45));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();
  }

  void move(float speed) {
    strokeWeight(1);
    stroke(255);
    
    pushMatrix();
    translate(x, y);

    fill(206, 167, 23);
    ellipse(0, 0, 5*size, 5*size);

    // move inner ring
    rotate(radians(-speed));

    fill(236, 255, 36);
    ellipse(0, -5*size, 5*size, 5*size);
    ellipse(0, 5*size, 5*size, 5*size);
    ellipse(-5*size, 0, 5*size, 5*size);
    ellipse(5*size, 0, 5*size, 5*size);

    fill(255, 157, 36);
    ellipse(5*size, -5*size, 3*size, 3*size);
    ellipse(-5*size, -5*size, 3*size, 3*size);
    ellipse(5*size, 5*size, 3*size, 3*size);
    ellipse(-5*size, 5*size, 3*size, 3*size);

    // move outer ring
    fill(9, 173, 10);
    rotate(radians(2*speed));

    pushMatrix();
    translate(10*size, -10*size);
    rotate(radians(45));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();

    pushMatrix();
    translate(-10*size, -10*size);
    rotate(radians(315));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();

    pushMatrix();
    translate(10*size, 10*size);
    rotate(radians(315));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();

    pushMatrix();
    translate(-10*size, 10*size);
    rotate(radians(45));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();

    pushMatrix();
    translate(-10*size, 10*size);
    rotate(radians(45));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();

    popMatrix();
  }
  
  void dead() {
    strokeWeight(1);
    stroke(255);
    
    fill(0);
    ellipse(x, y, 5*size, 5*size);
    
    ellipse(x, y-5*size, 5*size, 5*size);
    ellipse(x, y+5*size, 5*size, 5*size);
    ellipse(x-5*size, y, 5*size, 5*size);
    ellipse(x+5*size, y, 5*size, 5*size);

    ellipse(x+5*size, y-5*size, 3*size, 3*size);
    ellipse(x-5*size, y-5*size, 3*size, 3*size);
    ellipse(x+5*size, y+5*size, 3*size, 3*size);
    ellipse(x-5*size, y+5*size, 3*size, 3*size);

    pushMatrix();
    translate(x+10*size, y-10*size);
    rotate(radians(45));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();

    pushMatrix();
    translate(x-10*size, y-10*size);
    rotate(radians(315));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();

    pushMatrix();
    translate(x+10*size, y+10*size);
    rotate(radians(315));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();

    pushMatrix();
    translate(x-10*size, y+10*size);
    rotate(radians(45));
    ellipse(0, 0, 3*size, 7*size);
    popMatrix();
  }
}

