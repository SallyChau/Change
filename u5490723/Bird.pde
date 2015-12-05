// This class creates bird-shaped patterns.

class Bird {
  float x, y;
  float size;
  int mode = 1;

  Bird() {
  }

  Bird(float x, float y) {
    this.x = x;
    this.y = y;
    size = 1;
  }

  Bird(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    if (mode == 1) {
      noStroke();
      fill(0);
      rect(x, y, 20, 20);
      fill(255);
      triangle(x, y, x+20*size, y, x+10*size, y+20*size);
      fill(0);
      triangle(x, y, x+20*size, y, x+10*size, y+10*size);
    } 
    if (mode == -1) {
      noStroke();
      fill(0);
      rect(x, y, 20, 20);
      fill(255);
      triangle(x+10*size, y, x, y+20*size, x+20*size, y+20*size);
      fill(0);
      triangle(x+10*size, y+10*size, x, y+20*size, x+20*size, y+20*size);
    }
  }

  void move() {
    mode = -mode;
  }
}

