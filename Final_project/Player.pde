class Player implements Killable {
  int lives, x, y, speed, size;
  String name;
  Player(int numLives, String name, int startingX, int startingY, int quick, int size) {
    lives = numLives;
    x = startingX;
    y = startingY;
    speed = quick;
    this.size = size;
    this.name = name;
  }
  void move() {
    if (key == CODED && keyPressed == true) {
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

  void shoot(ArrayList<Bullet> b) {
    if (key == ' ') {
      b.add(new Bullet(50, 255, 123, 45, 10, x, y));
    }
  }
  
  void die(ArrayList<Killable> k) {
    lives--;
    x = 0;
    y = height / 2;
    if (lives < 0) {
      g.endScreen();
    }
  }
  
  void display() {
    //temp display
    fill(123, 244, 23);
    ellipse(x, y, size, size);
  }
}