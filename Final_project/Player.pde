class Player {
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
    }
  }
  void shoot() {
    //edit constructors later
    b.add(new Bullet(10, 255, 124, 123, 1, x, y);
  }
  void die() {
    lives--;
    if (lives < 0) {
      endScreen();
    }
  }
  void display() {
    
  }
}