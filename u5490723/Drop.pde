// This class creates drop-shaped patterns.

class Drop {
  float x, y;
  float size;

  Drop() {
  }

  Drop(float x, float y) {
    this.x = x;
    this.y = y;
    size = 1;
  }

  Drop(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    noStroke();
    fill(0, 0, 255);
    triangle(x - 10*size, y, x + 10*size, y, x, y - 20*size);
    ellipse(x, y, 20*size, 20*size);
  }

  void move() {
    strokeWeight(size/2);
    stroke(255);  
    y = (y + random(0.5, 1)) % (height + 300);
    line(x, 0, x, y);
  }
}

