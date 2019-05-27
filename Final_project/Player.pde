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
      } 
      if (keyCode == DOWN) {
        ycor += speed;
      }
      if (keyCode == LEFT) {
        xcor -= speed;
      } 
      if (keyCode == RIGHT) {
        xcor += speed;
      }
    }
  }
  void shoot(ArrayList<Bullet> b) {
    if (key == ' ' && keyPressed == true) {
      b.add(new Bullet(50, 255, 123, 45, 10, xcor, ycor, 2, 0));
      key = 'D';
    }
  }

  boolean die(ArrayList<Collider> monster) {
    if (inContact(monster)) {
      lives--;
      xcor = 0;
      ycor = height / 2;
      if (lives < 0) {
        g.endScreen();
        return true;
      }
    }
    return false;
  }

  void display() {
    //temp display
    fill(123, 244, 23);
    ellipse(xcor, ycor, size, size);
  }
}
