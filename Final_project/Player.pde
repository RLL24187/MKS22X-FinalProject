class Player implements Killable {
  int lives, x, y, speed;
  String name;
  Player(int numLives, String name, int startingX, int startingY, int quick) {
    lives = numLives;
    x = startingX;
    y = startingY;
    speed = quick;
    this.name = name;
  }
  void keyPressed() {
    //move
    if (key == CODED) {
      if (keyCode == UP) {
        y -= speed;
      } else if (keyCode == DOWN) {
        y += speed;
      } else if (keyCode == LEFT) {
        x -= speed;
      } else if (keyCode == RIGHT) {
        x += speed;
      }
    } else {
      //shoot
      if (key == ' ') {
        //edit bullet constructors later
        b.add(new Bullet(10, 255, 124, 123, 1, x, y);
      }
    }
  }

  void die() {
    lives--;
    if (lives < 0) {
      endScreen();
    }
  }
  void display() {
    //temp display
    ellipse(x,y,10,10);
  }
}
