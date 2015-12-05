// This class creates heart-shaped patterns.

class Heart {
  float x, y, size;
  int red = 255;
  int green = 0;
  int blue = 0;

  float arclength = 0;

  Heart() {
  }

  Heart(float x, float y) {
    this.x = x;
    this.y = y;
    size = 1;
  }

  Heart(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    noStroke();
    fill(red, green, blue);
    ellipse(x, y, 16.5*size, 15*size);
    ellipse(x+15*size, y, 16.5*size, 15*size);
    ellipse(x+7.5*size, y+3.75*size, 5*size, 5*size);
    triangle(x-7.5*size, y+3.75*size, x+22.5*size, y+3.75*size, x+8.25*size, y+22.5*size);
  }

  void spin(float speed) {
    pushMatrix();
    translate(x, y);
    rotate(radians(speed));
    noStroke();
    fill(red, green, blue);
    ellipse(0, 0, 16.5*size, 15*size);
    ellipse(15*size, 0, 16.5*size, 15*size);
    ellipse(7.5*size, 3.75*size, 5*size, 5*size);
    triangle(-7.5*size, 3.75*size, 22.5*size, 3.75*size, 8.25*size, 22.5*size);
    popMatrix();
  }

  void circle(float centerX, float centerY, float speed) {
    pushMatrix();
    translate(centerX, centerY);
    rotate(radians(speed));
    noStroke();
    fill(red, green, blue);
    ellipse(centerX-x, centerY-y, 16.5*size, 15*size);
    ellipse(centerX-x+15*size, centerY-y, 16.5*size, 15*size);
    ellipse(centerX-x+7.5*size, centerY-y+3.75*size, 5*size, 5*size);
    triangle(centerX-x-7.5*size, centerY-y+3.75*size, centerX-x+22.5*size, centerY-y+3.75*size, centerX-x+ 8.25*size, centerY-y+22.5*size);
    popMatrix();
  }
}

