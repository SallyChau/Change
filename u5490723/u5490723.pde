/*=============================================================== 
 Sally Chau - u5490723
 =================================================================
 
 27th October 2014
 
 COMP1720 Standard Project to the Topic of "Change".
 
 Acknowledgements:
 ----------------------------------------------------------------
 The following code is written by myself except for passages 
 introduced by a comment *....* .
 The included images are manipulated by me and taken from
 - earth:   http://imgarcade.com/1/earth-paintings/
 - sun:     http://www.gosunstove.com/true-power-of-sun/
 - moon:    http://www.publicdomainpictures.net/view-image.php?image=1957
 */

/*===============================================================
 Define variables
 ==============================================================*/

/* variable to control phases of program:
 - phase 1: User can play with Kaleidoscope
 - phase 2: " Time and Tide wait for No Man... "
 - phase 3.0: growing flowers: the cycle of life
 - phase 3.1: flowers die, clouds appear
 - phase 3.2: " Every Teardrop is a Waterfall... "
 */

float phase;

/*===============================================================
 Variables for Phase 1.0
 ==============================================================*/

// Toolbar: Buttons
Button buttonClicked;
Button dropButton, flowerButton, heartButton;
Button pointButton, cloudButton, spiralButton;
Button starButton, birdButton;

Button goButton, deleteButton;

Drop drop, dropSymbol;
Flower flower, flowerSymbol;
Heart heart, heartSymbol;
Point point, pointSymbol;
Cloud cloud, cloudSymbol;
Spiral spiral, spiralSymbol;
Star star, starSymbol;
Bird bird, birdSymbol;

PFont buttonFont;

int sizeSpiral;

// Main Kaleidoscope Tiles
ArrayList<Tile> tiles;
Tile currentTile;

boolean runOnce; // controlvariable to set timer only once
int timeWhenAnimated; // timer variable 

int lineX, lineY; 

/*===============================================================
 Variables for Phase 2.0
 ==============================================================*/

// Variables to control images
PImage earth;
PImage moon, sun;
float earthX, earthY;
int earthSize;
float moonX, moonY;
float moonSpeed;
int moonSize;
int moonCounter;
float sunX, sunY;

float opacity;

PFont font;
float sizeText;

/*===============================================================
 Variables for Phase 3.0
 ==============================================================*/

ArrayList<Flower> flowers;
ArrayList<Cloud> clouds;
ArrayList<Drop> drops;
float textY; // Controls Vertical Movement of Text

//===============================================================
//===============================================================

void setup() {

  size(600, 700);
  phase = 1.0;

  /*=============================================================
   Setup for Phase 1.0
   ============================================================*/

  // Toolbar-Buttons
  pointButton = new Button(160, 610, 35, 35);
  cloudButton = new Button(215, 610, 35, 35);
  birdButton = new Button(270, 610, 35, 35);
  spiralButton = new Button(325, 610, 35, 35);
  starButton = new Button(160, 655, 35, 35);
  dropButton = new Button(215, 655, 35, 35); 
  flowerButton = new Button(270, 655, 35, 35); 
  heartButton = new Button(325, 655, 35, 35);

  goButton = new Button(400, 655, 35, 35);
  deleteButton = new Button(400, 610, 35, 35);

  pointSymbol = new Point(177.5, 627.5, 20);
  cloudSymbol = new Cloud(233, 627);
  birdSymbol = new Bird(278, 618);
  spiralSymbol = new Spiral(343, 617);
  starSymbol = new Star(177.5, 682);
  dropSymbol = new Drop(233, 679);
  flowerSymbol = new Flower(287, 672.5);
  heartSymbol = new Heart(336, 666);

  buttonFont = loadFont("Calibri-12.vlw");

  runOnce = true;
  timeWhenAnimated = 0;

  lineX = 0; 
  lineY = 0;

  sizeSpiral = 0;

  tiles = new ArrayList<Tile>();
  tiles.add(new Tile(0, 0, width/2, height/2-50));
  tiles.add(new Tile(width/2, 0, width/2, height/2-50));
  tiles.add(new Tile(0, height/2-50, width/2, height/2-50));
  tiles.add(new Tile(width/2, height/2-50, width/2, height/2-50));
  currentTile = new Tile();

  /*=============================================================
   Setup for Phase 2.0
   ============================================================*/

  // Load images
  imageMode(CENTER);
  earth = loadImage("earth.gif");
  earthX = -(width/2);
  earthY = height;
  earthSize = 250;

  sun = loadImage("sun.gif");
  sunX = -(width/2);
  sunY = height;

  moon = loadImage("moon.gif");
  moonX = width/2;
  moonY = height/2;
  moonSpeed = 1;
  moonSize = 100;
  moonCounter = 0;

  opacity = 0;

  // Setup for Texts
  textAlign(CENTER);
  font = loadFont("ColonnaMT-48.vlw");
  sizeText = 0;

  /*=============================================================
   Setup for Phase 3.0
   ============================================================*/

  flowers = new ArrayList<Flower>();
  flowers.add(new Flower(width/2, height/2, 1));
  flowers.add(new Flower(width/2, height/2-150, 3));
  flowers.add(new Flower(width/2, height/2+150, 3));
  flowers.add(new Flower(width/2-150, height/2, 3));
  flowers.add(new Flower(width/2+150, height/2, 3));

  clouds = new ArrayList<Cloud>();
  clouds.add(new Cloud(-300, 100, 9));
  clouds.add(new Cloud(-400, 150, 8));
  clouds.add(new Cloud(-600, 200, 7));
  clouds.add(new Cloud(-400, 300, 8));
  clouds.add(new Cloud(-100, 500, 6));
  clouds.add(new Cloud(-100, 600, 4));
  clouds.add(new Cloud(-200, 660, 5));
  clouds.add(new Cloud(-600, 700, 5));

  drops = new ArrayList<Drop>();
  for (int i = 0; i < 20; i++) {
    drops.add(new Drop(random(width), random(-300, 0), random(2)));
  }
}

//===============================================================
//===============================================================

void draw() {

  // Draw same background for all phases
  background(0);
  strokeWeight(1);
  stroke(255);
  fill(255);
  if ((frameCount % 20) == 0) {
    ellipse(random(0, width), random(0, height), 3, 3);
    ellipse(random(0, width), random(0, height), 4, 4);
    ellipse(random(0, width), random(0, height), 5, 5);
  }

  /*=============================================================
   Phase 1.0
   ============================================================*/
  // User specified kaleidosope design

  if (phase == 1.0) {
    if (mouseX < width/2 && mouseX > 0 
      && mouseY > 0 && mouseY < height/2-50) currentTile = tiles.get(0);
    if (mouseX > width/2 && mouseX < width 
      && mouseY > 0 && mouseY < height/2-50) currentTile = tiles.get(1);
    if (mouseX < width/2 && mouseX > 0 
      && mouseY > height/2-50 && mouseY < height-50) currentTile = tiles.get(2);
    if (mouseX > width/2 && mouseX < width 
      && mouseY > height/2-50 && mouseY < height-50) currentTile = tiles.get(3);

    // Static display of all user set patterns
    for (int i = 0; i < tiles.size (); i++) {
      tiles.get(i).display();
    }

    //check whether canvas is empty
    for (int i = 0; i < tiles.size (); i++) {
      if (tiles.get (i).points.size () > 0 ||
        tiles.get (i).drops.size() > 0 ||
        tiles.get (i).flowers.size () > 0 ||
        tiles.get (i).hearts.size () > 0 ||
        tiles.get (i).clouds.size () > 0 ||
        tiles.get (i).spirals.size () >0 ||
        tiles.get (i).stars.size () > 0 ||
        tiles.get (i).birds.size () > 0) {
        goButton.clickable = true;
        deleteButton.clickable = true;
      } else {
        goButton.clickable = false;
        goButton.isClicked =  false;
        goButton.numberOfClicks = 0;
        deleteButton.clickable = false;
        deleteButton.isClicked =  false;
      }
    }

    // Toolbar functions

    // Control Delete Button: clear current screen
    if (deleteButton.clickable) {
      if (deleteButton.isOnButton) cursor(HAND);
      else cursor(ARROW);
      // on click
      if (deleteButton.isClicked) {
        for (int i = 0; i < tiles.size (); i++) {
          tiles.get(i).delete();
        }
      }
    }

    // Control Animation Button
    if (goButton.clickable) {
      if (goButton.isOnButton) cursor(HAND);
      else cursor(ARROW);
      // on click
      if (goButton.isClicked) {
        buttonClicked = goButton;
        if ((goButton.numberOfClicks%2) == 1) {
          // get the time when play button is clicked 
          // for the first time
          if (runOnce) {
            timeWhenAnimated = millis();
            runOnce = false;
          }
          // Start animation
          noStroke();
          fill(0);
          rect(0, 0, width, 600);
          for (int i = 0; i < tiles.size (); i++) {
            tiles.get(i).animate();
          }
        }
      }
    }
    if (buttonClicked != goButton) goButton.numberOfClicks = 0;

    // If time passed since the "play" button was clicked
    // the first time is larger than 25 seconds, then change  
    // to the next scene.
    if (abs(millis() - timeWhenAnimated) > 25000) {
      for (int i = 0; i < tiles.size (); i++) {
        tiles.get(i).animate();
        tiles.get(i).animate();
      }
      stroke(255);
      strokeWeight(2);
      line(0, height/2-50, lineX, height/2-50);
      line(width/2, 0, width/2, lineY);
      line(width, height/2-50, width-lineX, height/2-50);
      line(width/2, height-100, width/2, height-100-lineY);
      lineX += 3;
      lineY += 3;
      if (lineX > width/2 && lineY > height/2-50) {
        phase = 2.0;
      }
    }

    // Control Buttons

    // Button to create points on canvas
    pointButton.checkOnButton();
    if (pointButton.isOnButton) cursor(HAND);
    else cursor(ARROW);
    // on click
    if (pointButton.isClicked) {
      buttonClicked = pointButton;
      if (mouseY < 600) {
        point = new Point(mouseX, mouseY, 5);
        point.display();
      }
    } 

    // Button to create clouds on canvas
    cloudButton.checkOnButton();
    if (cloudButton.isOnButton) cursor(HAND);
    else cursor(ARROW);
    // on click
    if (cloudButton.isClicked) {
      buttonClicked = cloudButton;
      if (mouseY < 600) {
        cloud = new Cloud(mouseX, mouseY, 0.5);
        cloud.display();
      }
    } 

    // Button to create birds on canvas
    birdButton.checkOnButton();
    if (birdButton.isOnButton) cursor(HAND);
    else cursor(ARROW);
    // on click
    if (birdButton.isClicked) {
      buttonClicked = birdButton;
      if (mouseY < 600) {
        bird = new Bird(mouseX, mouseY);
        bird.display();
      }
    } 

    // Button to create spirals on canvas
    spiralButton.checkOnButton();
    if (spiralButton.isOnButton) cursor(HAND);
    else cursor(ARROW);
    // on click
    if (spiralButton.isClicked) {
      buttonClicked = spiralButton;
      if (mouseY < 600) {
        spiral = new Spiral(mouseX, mouseY, 0.5);
        spiral.display();
      }
    } 

    // Button to create stars on canvas
    starButton.checkOnButton();
    if (starButton.isOnButton) cursor(HAND);
    else cursor(ARROW);
    // on click
    if (starButton.isClicked) {
      buttonClicked = starButton;
      if (mouseY < 600) {
        star = new Star(mouseX, mouseY, 0.5);
        star.display();
      }
    } 

    // Button to create drops on canvas
    dropButton.checkOnButton();
    if (dropButton.isOnButton) cursor(HAND);
    else cursor(ARROW);
    // on click
    if (dropButton.isClicked) {
      buttonClicked = dropButton;
      if (mouseY < 600) {
        drop = new Drop(mouseX, mouseY, 0.5);
        drop.display();
      }
    } 

    // Button to create flowers on canvas
    flowerButton.checkOnButton();
    if (flowerButton.isOnButton) cursor(HAND);
    else cursor(ARROW);
    // on click
    if (flowerButton.isClicked) {
      buttonClicked = flowerButton;
      if (mouseY < 600) {
        flower = new Flower(mouseX, mouseY);
        flower.display();
      }
    } 

    // Button to create hearts on canvas
    heartButton.checkOnButton();
    if (heartButton.isOnButton) cursor(HAND);
    else cursor(ARROW);
    // on click
    if (heartButton.isClicked) {
      buttonClicked = heartButton;
      if (mouseY < 600) {
        heart = new Heart(mouseX, mouseY, 0.5);
        heart.display();
      }
    }

    // Toolbar display
    noStroke();
    fill(0);
    rect(0, height-100, width, 100);
    fill(255);
    ellipse(random(0, 600), random(600, 700), 2, 2);
    ellipse(random(0, 600), random(600, 700), 3, 3);
    ellipse(random(0, 600), random(600, 700), 4, 4);

    // Display Buttons
    deleteButton.display();
    strokeWeight(3);
    stroke(247, 16, 7);
    line(405, 615, 430, 640);
    line(430, 615, 405, 640);
    deleteButton.checkOnButton();
    if (deleteButton.isOnButton) {
      noStroke();
      fill(255, 200);
      rect(deleteButton.x, deleteButton.y, 80, 15);
      fill(0);
      textFont(buttonFont);
      textSize(12);
      text("Clear Screen", deleteButton.x+40, deleteButton.y+12);
    }

    goButton.display();
    triangle(goButton.x+5, goButton.y+5, 
    goButton.x+goButton.buttonWidth-5, 
    goButton.y+goButton.buttonHeight/2, 
    goButton.x+5, goButton.y+goButton.buttonHeight-5);
    goButton.checkOnButton();

    if (goButton.isOnButton) {
      noStroke();
      fill(255, 200);
      rect(goButton.x, goButton.y, 80, 15);
      fill(0);
      textFont(buttonFont);
      textSize(12);
      text("Animate", goButton.x+40, goButton.y+12);
    }
    if (goButton.clickable) {
      if (goButton.isClicked) {
        if ((goButton.numberOfClicks%2) == 1) {

          // Change "play" symbol
          fill(0);
          rect(goButton.x, goButton.y, 35, 35);
          goButton.display();
          rect(goButton.x+7.5, goButton.y+5, 5, 25);
          rect(goButton.x+22.5, goButton.y+5, 5, 25);

          if (goButton.isOnButton) {
            fill(0);
            strokeWeight(1);
            stroke(0);
            rect(goButton.x+7.5, goButton.y+5, 5, 25);
            rect(goButton.x+22.5, goButton.y+5, 5, 25);
            noStroke();
            fill(255, 200);
            rect(goButton.x, goButton.y, 80, 15);
            textSize(12);
            textFont(buttonFont);
            fill(0);
            text("Stop", goButton.x+40, goButton.y+12);
          }
        } else if (goButton.numberOfClicks > 0 
          && (goButton.numberOfClicks%2) == 0) {

          // Stop animation
          triangle(goButton.x+5, goButton.y+5, 
          goButton.x+goButton.buttonWidth-5, 
          goButton.y+goButton.buttonHeight/2, 
          goButton.x+5, goButton.y+goButton.buttonHeight-5);
          if (goButton.isOnButton) {
            noStroke();
            fill(255, 200);
            rect(goButton.x, goButton.y, 80, 15);
            fill(0);
            textFont(buttonFont);
            textSize(12);
            text("Animate", goButton.x+40, goButton.y+12);
          }
        }
      }
    }

    pointButton.display();
    pointSymbol.display();

    cloudButton.display();
    cloudSymbol.display();

    birdButton.display();
    birdSymbol.display();

    spiralButton.display();
    spiralSymbol.display();

    starButton.display();
    starSymbol.display();

    dropButton.display(); 
    dropSymbol.display();

    flowerButton.display(); 
    flowerSymbol.display();

    heartButton.display();
    heartSymbol.display();
  }

  /*=============================================================
   Phase 2.0
   ============================================================*/

  if (phase == 2.0) {

    // Moving Sun
    image(sun, sunX, sunY);
    sunX += 3; 
    sunY -= 4;
    if (sunY < -height/2 && earthX < width/2 && earthY > height/2) {
      image(earth, earthX, earthY);
      earthX += 2; 
      earthY -= 1;
    }

    // Zooming in on earth
    if (earthX >= width/2) {
      if (earthSize < width) {
        earth = loadImage("earth.gif");
        earth.resize(earthSize, earthSize);
        image(earth, earthX, earthY);
        earthSize++;
        moonSize++;
      }

      // Moon animation
      if (moonSpeed > 0) {
        image(earth, earthX, earthY);
        moon.resize(moonSize, moonSize);
        image(moon, moonX, moonY);
        moonX += moonSpeed; 
        moonY -= moonSpeed;
      } else if (moonSpeed < 0) {
        moon.resize(moonSize, moonSize);
        image(moon, moonX, moonY);
        image(earth, earthX, earthY);
        moonX += moonSpeed; 
        moonY -= moonSpeed;
      }
      if (abs(moonY - moonX) > 0.75*earthSize) {
        moonSpeed = -moonSpeed;
        moonCounter++;
      }
      if (moonCounter > 1) {
        fill(255, opacity);
        rect(0, 0, width, height);
        textFont(font);
        fill(255);
        textSize(sizeText);
        text("Time and Tide wait for No Man...", width/2, height/2);
        sizeText += 0.2;
        opacity += 0.8;
        if (sizeText > 70) {
          fill(255);
          rect(0, 0, width, height);
          phase = 3.0;
        }
      }
    }

    // Move tiles apart so that new scene becomes visible
    for (int i = 0; i < tiles.size (); i++) {
      tiles.get(0).changePos(tiles.get(0).xPos--, tiles.get(0).yPos--);
      tiles.get(1).changePos(tiles.get(1).xPos++, tiles.get(1).yPos--);
      tiles.get(2).changePos(tiles.get(2).xPos--, tiles.get(2).yPos++);
      tiles.get(3).changePos(tiles.get(3).xPos++, tiles.get(3).yPos++);
      tiles.get(i).strokeColor = 255;
      tiles.get(i).display();
    }
  }

  /*=============================================================
   Phase 3.0
   ============================================================*/

  if (phase == 3.0) {

    // Flowers grow
    if (flowers.get(0).size < 5) {
      flowers.get(0).display();
      flowers.get(0).size += 0.01;
      if (opacity > 0) {
        opacity--;
        fill(255, opacity);
        rect(0, 0, width, height);
      }
    } else {
      // Watering the flowers let them grow and produce more flowers
      Drop water = new Drop(mouseX, mouseY);
      for (int i = 0; i < flowers.size (); i++) {
        if (flowers.get(i).size >= 5) {
          stroke(9, 173, 10);
          strokeWeight(3);
          fill(9, 173, 10, 50);
          ellipse(flowers.get(i).x, flowers.get(i).y, 150, 150);
        }
        if (mouseX > flowers.get(i).x-5*flowers.get(i).size 
          && mouseX < flowers.get(i).x+5*flowers.get(i).size 
          && mouseY > flowers.get(i).y-5*flowers.get(i).size 
          && mouseY < flowers.get(i).y+5*flowers.get(i).size) {
          flowers.get(i).move(millis()/10);
          water.display();
        } else {
          flowers.get(i).move(millis()/100);
        }
      }
      if (flowers.size() > 20) {
        phase = 3.1;
      }
    }
  }

  /*=============================================================
   Phase 3.1
   ============================================================*/

  if (phase == 3.1) {

    // Flowers die at some point, as every life will end:
    for (int i = 0; i < flowers.size (); i++) {
      flowers.get(i).dead();
    }
    for (int i = 0; i < clouds.size (); i++) {
      // Clouds appear
      Cloud c = clouds.get(i);
      c.display();
      c.move(2);
      // Clouds jiggle when mouse over cloud
      // *CODE INSPIRED BY SHIFFMAN EXAMPLES*
      if (mouseX > (c.x-30*c.size) && mouseX < (c.x+30*c.size)
        && mouseY > (c.y-30*c.size) && mouseY < (c.y+30*c.size)) {
        c.x += random(-1, 1)*((mouseX-200)*0.1);
        c.y += random(-1, 1)*((mouseX-200)*0.1);
        c.x = constrain(c.x, 0, width);
        c.y = constrain(c.y, 0, height);
      }
      // *END*
      if (c.red < 0) {
        phase = 3.2;
      }
      Cloud cloud = new Cloud(mouseX, mouseY);
      cloud.display();
    }
  }

  /*=============================================================
   Phase 3.2
   ============================================================*/

  if (phase == 3.2) {
    for (int i = 0; i < clouds.size (); i++) {
      clouds.get(i).display();
    }
    // It starts to rain.
    for (int i = 0; i < drops.size (); i++) {
      drops.get(i).move();
      drops.get(i).display();
    }
    if (textY > 0) {
      noStroke();
      fill(0, opacity);
      rect(0, 0, width, height);
      opacity += 0.3;
    }
    textFont(font);
    fill(255);
    textSize(40);
    text("Every Teardrop is a Waterfall...", width/2, textY);
    if (textY < height/2) textY += 0.4;
  }
}

//===============================================================
//===============================================================

void mouseClicked() {

  /*=============================================================
   Phase 1.0
   ============================================================*/

  if (phase == 1.0) {
    if (mouseY < height-100) {

      // Pattern-Creator
      if (buttonClicked == pointButton) { 
        float size = 5;
        currentTile.points.add(new Point(mouseX, mouseY, size));

        // add objects to all tiles to keep symmetry
        if (currentTile == tiles.get(0)) {
          tiles.get(1).points.add(new Point(width/2+abs(width/2-mouseX), mouseY, size));
          tiles.get(2).points.add(new Point(mouseX, (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).points.add(new Point(width-mouseX, height-100-mouseY, size));
        }
        if (currentTile == tiles.get(1)) {
          tiles.get(0).points.add(new Point(abs(width-mouseX), mouseY, size));
          tiles.get(2).points.add(new Point(abs(width-mouseX), (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).points.add(new Point(width-abs(width-mouseX), abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(2)) {
          tiles.get(0).points.add(new Point(mouseX, abs(height-100-mouseY), 5));
          tiles.get(1).points.add(new Point(width/2+abs(width/2-mouseX), abs(height-100-mouseY), size));
          tiles.get(3).points.add(new Point(width-mouseX, height-100-abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(3)) {
          tiles.get(0).points.add(new Point(width-mouseX, height-100-mouseY, size));
          tiles.get(1).points.add(new Point(mouseX, abs(height-100-mouseY), size));
          tiles.get(2).points.add(new Point(width-mouseX, mouseY, size));
        }
      }
      if (buttonClicked == cloudButton) {
        float size = 0.5;
        currentTile.clouds.add(new Cloud(mouseX, mouseY, size));

        // add objects to all tiles to keep symmetry
        if (currentTile == tiles.get(0)) {
          tiles.get(1).clouds.add(new Cloud(width/2+abs(width/2-mouseX), mouseY, size));
          tiles.get(2).clouds.add(new Cloud(mouseX, (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).clouds.add(new Cloud(width-mouseX, height-100-mouseY));
        }
        if (currentTile == tiles.get(1)) {
          tiles.get(0).clouds.add(new Cloud(abs(width-mouseX), mouseY, size));
          tiles.get(2).clouds.add(new Cloud(abs(width-mouseX), (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).clouds.add(new Cloud(width-abs(width-mouseX), abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(2)) {
          tiles.get(0).clouds.add(new Cloud(mouseX, abs(height-100-mouseY), size));
          tiles.get(1).clouds.add(new Cloud(width/2+abs(width/2-mouseX), abs(height-100-mouseY), size));
          tiles.get(3).clouds.add(new Cloud(width-mouseX, height-100-abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(3)) {
          tiles.get(0).clouds.add(new Cloud(width-mouseX, height-100-mouseY, size));
          tiles.get(1).clouds.add(new Cloud(mouseX, abs(height-100-mouseY), size));
          tiles.get(2).clouds.add(new Cloud(width-mouseX, mouseY, size));
        }
      }
      if (buttonClicked == birdButton) {
        float size = 1;
        currentTile.birds.add(new Bird(mouseX, mouseY, size));

        // add objects to all tiles to keep symmetry
        if (currentTile == tiles.get(0)) {
          tiles.get(1).birds.add(new Bird(width/2+abs(width/2-mouseX), mouseY, size));
          tiles.get(2).birds.add(new Bird(mouseX, (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).birds.add(new Bird(width-mouseX, height-100-mouseY, size));
        }
        if (currentTile == tiles.get(1)) {
          tiles.get(0).birds.add(new Bird(abs(width-mouseX), mouseY, size));
          tiles.get(2).birds.add(new Bird(abs(width-mouseX), (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).birds.add(new Bird(width-abs(width-mouseX), abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(2)) {
          tiles.get(0).birds.add(new Bird(mouseX, abs(height-100-mouseY), size));
          tiles.get(1).birds.add(new Bird(width/2+abs(width/2-mouseX), abs(height-100-mouseY), size));
          tiles.get(3).birds.add(new Bird(width-mouseX, height-100-abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(3)) {
          tiles.get(0).birds.add(new Bird(width-mouseX, height-100-mouseY, size));
          tiles.get(1).birds.add(new Bird(mouseX, abs(height-100-mouseY), size));
          tiles.get(2).birds.add(new Bird(width-mouseX, mouseY, size));
        }
      }
      if (buttonClicked == dropButton) {
        float size = 0.5;
        currentTile.drops.add(new Drop(mouseX, mouseY, size));

        // add objects to all tiles to keep symmetry
        if (currentTile == tiles.get(0)) {
          tiles.get(1).drops.add(new Drop(width/2+abs(width/2-mouseX), mouseY, size));
          tiles.get(2).drops.add(new Drop(mouseX, (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).drops.add(new Drop(width-mouseX, height-100-mouseY, size));
        }
        if (currentTile == tiles.get(1)) {
          tiles.get(0).drops.add(new Drop(abs(width-mouseX), mouseY, size));
          tiles.get(2).drops.add(new Drop(abs(width-mouseX), (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).drops.add(new Drop(width-abs(width-mouseX), abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(2)) {
          tiles.get(0).drops.add(new Drop(mouseX, abs(height-100-mouseY), size));
          tiles.get(1).drops.add(new Drop(width/2+abs(width/2-mouseX), abs(height-100-mouseY), size));
          tiles.get(3).drops.add(new Drop(width-mouseX, height-100-abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(3)) {
          tiles.get(0).drops.add(new Drop(width-mouseX, height-100-mouseY, size));
          tiles.get(1).drops.add(new Drop(mouseX, abs(height-100-mouseY), size));
          tiles.get(2).drops.add(new Drop(width-mouseX, mouseY, size));
        }
      }
      if (buttonClicked == starButton) {
        float size = 0.5;
        currentTile.stars.add(new Star(mouseX, mouseY, size));

        // add objects to all tiles to keep symmetry
        if (currentTile == tiles.get(0)) {
          tiles.get(1).stars.add(new Star(width/2+abs(width/2-mouseX), mouseY, size));
          tiles.get(2).stars.add(new Star(mouseX, (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).stars.add(new Star(width-mouseX, height-100-mouseY, size));
        }
        if (currentTile == tiles.get(1)) {
          tiles.get(0).stars.add(new Star(abs(width-mouseX), mouseY, size));
          tiles.get(2).stars.add(new Star(abs(width-mouseX), (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).stars.add(new Star(width-abs(width-mouseX), abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(2)) {
          tiles.get(0).stars.add(new Star(mouseX, abs(height-100-mouseY), size));
          tiles.get(1).stars.add(new Star(width/2+abs(width/2-mouseX), abs(height-100-mouseY), size));
          tiles.get(3).stars.add(new Star(width-mouseX, height-100-abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(3)) {
          tiles.get(0).stars.add(new Star(width-mouseX, height-100-mouseY, size));
          tiles.get(1).stars.add(new Star(mouseX, abs(height-100-mouseY), size));
          tiles.get(2).stars.add(new Star(width-mouseX, mouseY, size));
        }
      }
      if (buttonClicked == spiralButton) {
        float size = 0.5;
        currentTile.spirals.add(new Spiral(mouseX, mouseY, size));

        // add objects to all tiles to keep symmetry
        if (currentTile == tiles.get(0)) {
          tiles.get(1).spirals.add(new Spiral(width/2+abs(width/2-mouseX), mouseY, size));
          tiles.get(2).spirals.add(new Spiral(mouseX, (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).spirals.add(new Spiral(width-mouseX, height-100-mouseY, size));
        }
        if (currentTile == tiles.get(1)) {
          tiles.get(0).spirals.add(new Spiral(abs(width-mouseX), mouseY, size));
          tiles.get(2).spirals.add(new Spiral(abs(width-mouseX), (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).spirals.add(new Spiral(width-abs(width-mouseX), abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(2)) {
          tiles.get(0).spirals.add(new Spiral(mouseX, abs(height-100-mouseY), size));
          tiles.get(1).spirals.add(new Spiral(width/2+abs(width/2-mouseX), abs(height-100-mouseY), size));
          tiles.get(3).spirals.add(new Spiral(width-mouseX, height-100-abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(3)) {
          tiles.get(0).spirals.add(new Spiral(width-mouseX, height-100-mouseY, size));
          tiles.get(1).spirals.add(new Spiral(mouseX, abs(height-100-mouseY), size));
          tiles.get(2).spirals.add(new Spiral(width-mouseX, mouseY, size));
        }
      }
      if (buttonClicked == flowerButton) {
        float size = 1;
        currentTile.flowers.add(new Flower(mouseX, mouseY, size));

        // add objects to all tiles to keep symmetry
        if (currentTile == tiles.get(0)) {
          tiles.get(1).flowers.add(new Flower(width/2+abs(width/2-mouseX), mouseY, size));
          tiles.get(2).flowers.add(new Flower(mouseX, (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).flowers.add(new Flower(width-mouseX, height-100-mouseY));
        }
        if (currentTile == tiles.get(1)) {
          tiles.get(0).flowers.add(new Flower(abs(width-mouseX), mouseY, size));
          tiles.get(2).flowers.add(new Flower(abs(width-mouseX), (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).flowers.add(new Flower(width-abs(width-mouseX), abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(2)) {
          tiles.get(0).flowers.add(new Flower(mouseX, abs(height-100-mouseY), size));
          tiles.get(1).flowers.add(new Flower(width/2+abs(width/2-mouseX), abs(height-100-mouseY), size));
          tiles.get(3).flowers.add(new Flower(width-mouseX, height-100-abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(3)) {
          tiles.get(0).flowers.add(new Flower(width-mouseX, height-100-mouseY, size));
          tiles.get(1).flowers.add(new Flower(mouseX, abs(height-100-mouseY), size));
          tiles.get(2).flowers.add(new Flower(width-mouseX, mouseY, size));
        }
      }
      if (buttonClicked == heartButton) {
        float size = 0.5;
        currentTile.hearts.add(new Heart(mouseX, mouseY, size));

        // add objects to all tiles to keep symmetry
        if (currentTile == tiles.get(0)) {
          tiles.get(1).hearts.add(new Heart(width/2+abs(width/2-mouseX), mouseY, size));
          tiles.get(2).hearts.add(new Heart(mouseX, (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).hearts.add(new Heart(width-mouseX, height-100-mouseY, size));
        }
        if (currentTile == tiles.get(1)) {
          tiles.get(0).hearts.add(new Heart(abs(width-mouseX), mouseY, size));
          tiles.get(2).hearts.add(new Heart(abs(width-mouseX), (height-100)/2+abs((height-100)/2-mouseY), size));
          tiles.get(3).hearts.add(new Heart(width-abs(width-mouseX), abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(2)) {
          tiles.get(0).hearts.add(new Heart(mouseX, abs(height-100-mouseY), size));
          tiles.get(1).hearts.add(new Heart(width/2+abs(width/2-mouseX), abs(height-100-mouseY), size));
          tiles.get(3).hearts.add(new Heart(width-mouseX, height-100-abs(height-100-mouseY), size));
        }
        if (currentTile == tiles.get(3)) {
          tiles.get(0).hearts.add(new Heart(width-mouseX, height-100-mouseY, size));
          tiles.get(1).hearts.add(new Heart(mouseX, abs(height-100-mouseY), size));
          tiles.get(2).hearts.add(new Heart(width-mouseX, mouseY, size));
        }
      }
    }

    //Toolbarcontrol
    else {
      pointButton.checkClick();
      cloudButton.checkClick();
      birdButton.checkClick();
      spiralButton.checkClick();
      starButton.checkClick();
      dropButton.checkClick(); 
      flowerButton.checkClick();
      heartButton.checkClick();
      if (deleteButton.clickable) deleteButton.checkClick();
      if (goButton.clickable) goButton.checkClick();
      if (goButton.isClicked) goButton.numberOfClicks++;

      if (buttonClicked != null && !pointButton.isClicked && !cloudButton.isClicked && !birdButton.isClicked
        && !spiralButton.isClicked && !starButton.isClicked && !heartButton.isClicked 
        && !dropButton.isClicked && !flowerButton.isClicked && !goButton.isClicked) {
        buttonClicked.isClicked = true;
      }
    }
  }

  /*=============================================================
   Phase 3.0
   ============================================================*/

  if (phase == 3.0) {
    for (int i = 0; i < flowers.size (); i++) {
      Flower f = flowers.get(i);
      if (mouseX > f.x-5*f.size && mouseX < f.x+5*f.size 
        && mouseY > f.y-5*f.size && mouseY < f.y+5*f.size) {
        if (f.size < 5) f.size++;
        else flowers.add(new Flower(random(width), random(height), 3));
      }
    }
  }

  /*=============================================================
   Phase 3.1
   ============================================================*/

  if (phase == 3.1) {
    for (int i = 0; i < clouds.size (); i++) {
      Cloud c = clouds.get(i);
      // Increase size and turn more and more blue when clicked
      if (mouseX > (c.x-30*c.size) && mouseX < (c.x+30*c.size)
        && mouseY > (c.y-30*c.size) && mouseY < (c.y+30*c.size)) {
        c.size++;
        c.setColor(c.red-20, c.green-10, c.blue);
      }
    }
  }
}

//===============================================================
//===============================================================

