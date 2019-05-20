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
  void move(keyCode movement) {
    if (movement == UP) {
      y -= speed;
    } else if (movement == DOWN) {
      y += speed;
    } else if (movement == LEFT) {
      x -= speed;
    } else if (movement == RIGHT) {
      x += speed;
    }
  }
  
}