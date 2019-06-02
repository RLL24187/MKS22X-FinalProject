import java.util.*;
class Player extends Collider {
  int lives, size, power;
  float speed, xcor, ycor;
  String name;
  float yinc = 0;
  float xinc = 0;
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

  void reset() {
    movement.clear();
    xinc = 0;
    yinc = 0;
  }

  void move() {
    boolean up = movement.contains(0);
    boolean down = movement.contains(1);
    boolean left = movement.contains(2);
    boolean right = movement.contains(3);
    if (up) {
      yinc = -speed;
      //println("UP");
    }
    if (down) {
      yinc = speed;
    }
    if (left) {
      xinc = -speed;
    }
    if (right) {
      xinc = speed;
    }
  }
  //move will be based on velocity
  //buttons set velocity
  //no buttons pressed set velocity 0


  void simpleMove() {  
    ycor += yinc;
    xcor += xinc;
  }

  void shoot(ArrayList<Bullet> b, ArrayList<Collider> c) {
    if (key == ' ' && keyPressed == true) {
      Bullet temp = new Bullet(power, 1, 255, 123, 45, 10, xcor, ycor, 3, 0);
      b.add(temp);
      c.add(temp);
      keyPressed = false;
    }
  }

  boolean die(ArrayList<Collider> enemy) {
    if (inContact(enemy)!= null) {
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
