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
    //println(keyCode);
    if (key == CODED) {
      if (keyCode == UP) {
        println(y);
        y -= speed;
        println(y);
      } else if (keyCode == DOWN) {
        y += speed;
      } else if (keyCode == LEFT) {
        x -= speed;
      } else if (keyCode == RIGHT) {
        x += speed;
      }
      println(y);
      println(y);
    }
  }
  void keyPressed(ArrayList<Bullet> b) {
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
        b.add(new Bullet(10, 255, 124, 123, 1, x, y));
      }
    }
  }

  void die(ArrayList<Killable> k) {
    lives--;
    if (lives < 0) {
      endScreen();
    }
  }
  void display() {
    //temp display
    ellipse(x, y, size, size);
  }
}