import java.util.*;
class Player extends Collider {
  int lives, size, power;
  float speed, xcor, ycor;
  String name;
  ArrayList<String> movement;
  Player(int power, int numLives, String name, float startingX, float startingY, int speed, int size) {
    super(startingX, startingY, size, numLives, power);
    this.power = power;
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

  //void move() {
  //  if (key == CODED && keyPressed == true) {
  //    if (keyCode == UP) {
  //      movement.add("UP");
  //    } 
  //    if (keyCode == DOWN) {
  //      movement.add("DOWN");
  //    }
  //    if (keyCode == LEFT) {
  //      movement.add("LEFT");
  //    } 
  //    if (keyCode == RIGHT) {
  //      movement.add("RIGHT");
  //    }
  //  }
  //  if (movement.contains("UP")) {
  //    ycor -= speed;
  //  }
  //  if (movement.contains("DOWN")) {
  //    ycor += speed;
  //  }
  //  if (movement.contains("RIGHT")) {
  //    xcor += speed;
  //  }
  //  if (movement.contains("LEFT")) {
  //    xcor -= speed;
  //  }
  //}

  void shoot(ArrayList<Bullet> b, ArrayList<Collider> c) {
    if (key == ' ' && keyPressed == true) {
      Bullet temp = new Bullet(power, 1, 255, 123, 45, 10, xcor, ycor, 2, 0);
      b.add(temp);
      c.add(temp);
      keyPressed = false;
    }
  }

  boolean die(ArrayList<Collider> monster) {
    if (inContact(monster)!= null) {
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
