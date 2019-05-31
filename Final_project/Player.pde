import java.util.*;
class Player extends Collider {
  int lives, size, power;
  float speed, xcor, ycor;
  String name;
  //UP=0
  //DOWN=1
  //LEFT=2
  //RIGHT=3
  ArrayList<Integer> movement = new ArrayList<Integer>();
  Player(int power, int numLives, float startingX, float startingY, float speed, int size) {
    super(startingX, startingY, size, numLives, power);
    this.power = power;
    lives = numLives;
    xcor = startingX;
    ycor = startingY;
    this.speed = speed;
    this.size = size;
  }
  void buttons() {
    if (keyCode == UP) {
      movement.add(0);
    } 
    if (keyCode == DOWN) {
      movement.add(1);
    } 
    if (keyCode == LEFT) {
      movement.add(2);
    }
    if (keyCode == RIGHT) {
      movement.add(3);
    }
  }
  void move() {
    boolean up = movement.contains(0);
    boolean down = movement.contains(1);
    boolean left = movement.contains(2);
    boolean right = movement.contains(3);
    if (up) {
      ycor -= speed;
      fill(0, 255, 0);
      rect(10, 0, 10, 10);
    } 
    if (down) {
      ycor += speed;
      fill(0, 255, 0);
      rect(10, 10, 10, 10);
    }
    if (left) {
      xcor -= speed;
      fill(0, 255, 0);
      rect(0, 10, 10, 10);
    }
    if (right) {
      xcor += speed;
      rect(20, 10, 10, 10);
    }
  }

  void shoot(ArrayList<Bullet> b, ArrayList<Collider> c) {
    if (key == ' ' && keyPressed == true) {
      Bullet temp = new Bullet(power, 1, 255, 123, 45, 10, xcor, ycor, 3, 0);
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