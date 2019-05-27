class Player extends Collider {
  int lives, speed, size;
  float xcor, ycor;
  String name;
  Player(int numLives, String name, int startingX, int startingY, int speed, int size) {
    super(startingX, startingY, size);
    lives = numLives;
    xcor = startingX;
    ycor = startingY;
    this.speed = speed;
    this.size = size;
    this.name = name;
  }
  void move() {
    if (key == CODED && keyPressed == true) {
      if (keyCode == UP) {
        ycor -= speed;
      } else if (keyCode == DOWN) {
        ycor += speed;
      } else if (keyCode == LEFT) {
        xcor -= speed;
      } else if (keyCode == RIGHT) {
        xcor += speed;
      }
    }
  }

  void shoot(ArrayList<Bullet> b) {
    if (key == ' ') {
      b.add(new Bullet(50, 255, 123, 45, 10, xcor, ycor, 2, 0));
    }
  }

  boolean die(ArrayList<Killable> k) {
    lives--;
    xcor = 0;
    ycor = height / 2;
    if (lives < 0) {
      g.endScreen();
      return true;
    }
    return false;
  }

  void display() {
    //temp display
    fill(123, 244, 23);
    ellipse(xcor, ycor, size, size);
  }
}
