// This class creates buttons in order to control the interaction and the design of the mandalas
// in phase 4 of the main program.

class Button {

  float x, y, buttonWidth, buttonHeight;
  boolean isOnButton = false;
  boolean isClicked = false;
  int numberOfClicks = 0;
  boolean clickable = false;

  Button() {
  }

  Button(float x, float y, float buttonWidth, float buttonHeight) {
    this.x = x;
    this.y = y;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
  }

  void display() {
    strokeWeight(1);
    stroke(255);
    if (isClicked) fill(150, 80);
    else fill(0);
    rect(x, y, buttonWidth, buttonHeight);
  }

  //*INSPIRED BY SHIFFMAN*
  void checkOnButton() {
    isOnButton = false;
    if (mouseX > x & mouseX < x+buttonWidth & mouseY > y & mouseY < y + buttonHeight) {
      isOnButton = true;
    }
  }

  void checkClick() {
    isClicked = false;
    if (mouseX > x & mouseX < x + buttonWidth & mouseY > y & mouseY < y + buttonHeight) {
      isClicked = true;
    }
  }
  //*END*
}

