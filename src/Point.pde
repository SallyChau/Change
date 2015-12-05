// This class creates point-shaped patterns.

class Point {

  float x, y, size;
  int number = 0;
  int red = 255;
  int green = 255;
  int blue = 255;
  boolean spiralDisplayable = false;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
    size = 10;
  }

  Point(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    fill(red, green, blue);
    strokeWeight(2);
    stroke(0);
    ellipse(x, y, size, size);
  }

  void spiral(int number, float widthSpiral) {
    if (spiralDisplayable) {
      this.number = number;
      pushMatrix();
      translate(x, y);
      for (int i = 0; i < this.number; i++) {
        rotate(widthSpiral);
        fill(red, green, blue);
        strokeWeight(2);
        stroke(0);
        ellipse(i, 0, size, size);
      }
      popMatrix();
    }
  }
}

