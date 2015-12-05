// This class divides the canvas invisibly into 4 tiles, and keeps track of all drawn patterns so far.
// Drawn in one tile of the canvas, the pattern will be reflected in all other tiles.

class Tile {

  float xPos, yPos;
  float tWidth, tLength;
  ArrayList<Point> points = new ArrayList<Point>();
  ArrayList<Drop> drops = new ArrayList<Drop>();
  ArrayList<Flower> flowers = new ArrayList<Flower>();
  ArrayList<Heart> hearts = new ArrayList<Heart>();
  ArrayList<Cloud> clouds = new ArrayList<Cloud>();
  ArrayList<Spiral> spirals = new ArrayList<Spiral>();
  ArrayList<Star> stars = new ArrayList<Star>();
  ArrayList<Bird> birds = new ArrayList<Bird>();
  int strokeColor = 0;

  Tile() {
  }


  Tile(float xPos, float yPos, float tWidth, float tLength) {
    this.xPos = xPos; 
    this.yPos = yPos;
    this.tWidth = tWidth;
    this.tLength = tLength;
  }

  void display() {
    stroke(strokeColor);
    fill(0);
    rect(xPos, yPos, tWidth, tLength);

    // Display Points
    for (int i = 0; i < points.size (); i++) {
      Point point = points.get(i);
      point.display();
    }

    // Display Drops
    for (int i = 0; i < drops.size (); i++) {
      Drop drop = drops.get(i);
      drop.display();
    }

    // Display Flowers
    for (int i = 0; i < flowers.size (); i++) {
      Flower flower = flowers.get(i);
      flower.display();
    }

    // Display Hearts
    for (int i = 0; i < hearts.size (); i++) {
      Heart heart = hearts.get(i);
      heart.display();
    }

    // Display Clouds
    for (int i = 0; i < clouds.size (); i++) {
      Cloud cloud = clouds.get(i);
      cloud.display();
    }

    // Display Spirals
    for (int i = 0; i < spirals.size (); i++) {
      Spiral spiral = spirals.get(i);
      spiral.display();
    }

    // Display Stars
    for (int i = 0; i < stars.size (); i++) {
      Star star = stars.get(i);
      star.display();
    }

    // Display Birds
    for (int i = 0; i < birds.size (); i++) {
      Bird bird = birds.get(i);
      bird.display();
    }
  }

  void animate() {
    for (int j = 0; j < points.size (); j++) {
      points.get(j).spiralDisplayable = true;
      points.get(j).spiral(sizeSpiral, 0.1);
      sizeSpiral++;
      if (sizeSpiral > 200) sizeSpiral = 0;
    }
    for (int j = 0; j < drops.size (); j++) {
      drops.get(j).move();
      drops.get(j).display();
    }
    for (int j = 0; j < flowers.size (); j++) {
      flowers.get(j).move(millis()/100);
    }
    for (int j = 0; j < hearts.size (); j++) {
      hearts.get(j).spin(millis());
    }
    for (int j = 0; j < clouds.size (); j++) {
      clouds.get(j).move(1);
      clouds.get(j).display();
    }
    for (int j = 0; j < spirals.size (); j++) {
      spirals.get(j).move(random(-1, 1));
    }
    for (int j = 0; j < stars.size (); j++) {
      stars.get(j).display();
      stars.get(j).move(random(1));
    }
    for (int j = 0; j < birds.size (); j++) {
      birds.get(j).display();
      birds.get(j).move();
    }
  }

  void delete() {
    for (int j = 0; j < points.size (); j++) {
      points.remove(j);
    }
    for (int j = 0; j < drops.size (); j++) {
      drops.remove(j);
    }
    for (int j = 0; j < flowers.size (); j++) {
      flowers.remove(j);
    }
    for (int j = 0; j < hearts.size (); j++) {
      hearts.remove(j);
    }
    for (int j = 0; j < clouds.size (); j++) {
      clouds.remove(j);
    }
    for (int j = 0; j < spirals.size (); j++) {
      spirals.remove(j);
    }
    for (int j = 0; j < stars.size (); j++) {
      stars.remove(j);
    }
    for (int j = 0; j < birds.size (); j++) {
      birds.remove(j);
    }
  }

  void changePos(float xPos, float yPos) {
    float xDistance;
    float yDistance;
    xDistance = this.xPos - xPos;
    yDistance = this.yPos - yPos;

    this.xPos += xDistance;
    this.yPos += yDistance;

    for (int j = 0; j < points.size (); j++) {
      points.get(j).x += xDistance;
      points.get(j).y += yDistance;
    }
    for (int j = 0; j < drops.size (); j++) {
      drops.get(j).x += xDistance;
      drops.get(j).y += yDistance;
    }
    for (int j = 0; j < flowers.size (); j++) {
      flowers.get(j).x += xDistance;
      flowers.get(j).y += yDistance;
    }
    for (int j = 0; j < hearts.size (); j++) {
      hearts.get(j).x += xDistance;
      hearts.get(j).y += yDistance;
    }
    for (int j = 0; j < clouds.size (); j++) {
      clouds.get(j).x += xDistance;
      clouds.get(j).y += yDistance;
    }
    for (int j = 0; j < spirals.size (); j++) {
      spirals.get(j).x += xDistance;
      spirals.get(j).y += yDistance;
    }
    for (int j = 0; j < stars.size (); j++) {
      stars.get(j).x += xDistance;
      stars.get(j).y += yDistance;
    }
    for (int j = 0; j < birds.size (); j++) {
      birds.get(j).x += xDistance;
      birds.get(j).y += yDistance;
    }
  }
}

