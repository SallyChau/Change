// This class creates star-shaped patterns.

class Star {

  float x, y;
  float size;

  Star() {
  }
  
  Star(float x, float y) {
    this.x = x;
    this.y = y;
    size = 1;
  }

  Star(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    noStroke();
    fill(0);
    triangle(x-13*size, y+1*size, x+13*size, y+1*size, x, y-25*size);
    triangle(x-13*size, y-18*size, x+13*size, y-18*size, x, y+8*size);
    fill(255, 255, 0);
    triangle(x-12*size, y, x+12*size, y, x, y-24*size);
    triangle(x-12*size, y-17*size, x+12*size, y-17*size, x, y+7*size);
  }
  
  void move(float size){
    noStroke();
    fill(0);
    triangle(x-13*size, y+1*size, x+13*size, y+1*size, x, y-25*size);
    triangle(x-13*size, y-18*size, x+13*size, y-18*size, x, y+8*size);
    fill(255, 255, 0);
    triangle(x-12*size, y, x+12*size, y, x, y-24*size);
    triangle(x-12*size, y-17*size, x+12*size, y-17*size, x, y+7*size);
  }
}

