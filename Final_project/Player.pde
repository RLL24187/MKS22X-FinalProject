import java.util.*;
class Player extends Collider {
  int lives, speed, size;
  float xcor, ycor;
  String name;
  LinkedList<String> movement;
  Player(int numLives, String name, int startingX, int startingY, int speed, int size) {
    super(startingX, startingY, size);
    lives = numLives;
    xcor = startingX;
    ycor = startingY;
    this.speed = speed;
    this.size = size;
    this.name = name;
  }
  //  void move() {
  //  if (key == CODED && keyPressed == true) {
  //    if (keyCode == UP) {
  //      ycor -= speed;
  //    } else if (keyCode == DOWN) {
  //      ycor += speed;
  //    } else if (keyCode == LEFT) {
  //      xcor -= speed;
  //    } else if (keyCode == RIGHT) {
  //      xcor += speed;
  //    }
  //  }
  //}

  void move() {
    if (key == CODED && keyPressed == true) {
      if (keyCode == UP) {
        movement.add("UP");
      } 
      if (keyCode == DOWN) {
        movement.add("DOWN");
      }
      if (keyCode == LEFT) {
        movement.add("LEFT");
      } 
      if (keyCode == RIGHT) {
        movement.add("RIGHT");
      }
    }
    if (movement.getLast() != null) {
      if (movement.contains("UP")) {
        ycor -= speed;
      }
      if (movement.contains("DOWN")) {
        ycor += speed;
      }
      if (movement.contains("RIGHT")) {
        xcor += speed;
      }
      if (movement.contains("LEFT")) {
        xcor -= speed;
      }
    }
  }
  void shoot(ArrayList<Bullet> b) {
    if (key == ' ' && keyPressed == true) {
      b.add(new Bullet(50, 255, 123, 45, 10, xcor, ycor, 2, 0));
      keyPressed = false;
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
