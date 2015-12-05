// This class creates cloud-shaped patterns.

class Cloud {
  float x, y;
  float size;
  int red = 255;
  int green = 255;
  int blue = 255;

  Cloud() {
  }

  Cloud(float x, float y) {
    this.x = x;
    this.y = y;
    size = 1;
  }

  Cloud(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    noStroke();
    fill(0);
    ellipse(x, y, 11*size, 11*size);
    ellipse(x-11*size, y, 11*size, 11*size);
    ellipse(x+11*size, y, 11*size, 11*size);
    ellipse(x-6*size, y-6*size, 11*size, 11*size);
    ellipse(x+6*size, y-6*size, 11*size, 11*size);
    ellipse(x-6*size, y+6*size, 11*size, 11*size);
    ellipse(x+6*size, y+6*size, 11*size, 11*size);
    fill(red, green, blue);
    ellipse(x, y, 10*size, 10*size);
    ellipse(x-10*size, y, 10*size, 10*size);
    ellipse(x+10*size, y, 10*size, 10*size);
    ellipse(x-5*size, y-5*size, 10*size, 10*size);
    ellipse(x+5*size, y-5*size, 10*size, 10*size);
    ellipse(x-5*size, y+5*size, 10*size, 10*size);
    ellipse(x+5*size, y+5*size, 10*size, 10*size);
  }

  void move(float speed) {
    x = (x+speed) % (width+20*size);
  }
  
  void setColor(int red, int green, int blue){
    this.red = red;
    this.green = green;
    this.blue = blue;
  }
}

