import java.util.*;
class Player extends Collider {
  int lives, size, power;
  float speed, xcor, ycor;
  String name;
  float yinc = 0;
  float xinc = 0;
  PImage img;
  String type = "player";
  //UP=0
  //DOWN=1
  //LEFT=2
  //RIGHT=3
  ArrayList<Integer> movement = new ArrayList<Integer>();
  Player(int power, int numLives, float startingX, float startingY, float speed, int size, PImage img) {
    super(startingX, startingY, size, numLives, power, "player");
    this.power = power;
    lives = numLives;
    xcor = startingX;
    ycor = startingY;
    this.speed = speed;
    this.size = size;
    this.img = img;
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
  String toString(ArrayList ary) {
    String output = "[";
    for (int i = 0; i < ary.size(); i++) {
      output += ary.get(i);
      if (i != ary.size() - 1) {
        output += ", ";
      }
    }
    return output + "]";
  }
  void reset() {
    //println("xinc, yinc: ("+xinc+", "+yinc+")");
    ArrayList<Integer> i = new ArrayList<Integer>(4);
    if (keyCode == UP) {
      i.add((Integer)0);
      if (yinc == -speed) {
        yinc += speed;
      }
    } else if (keyCode == DOWN) {
      i.add((Integer)1);
      if (yinc == speed) {
        yinc -= speed;
      }
    } else if (keyCode == LEFT) {
      i.add((Integer)2);
      if (xinc == -speed) {
        xinc += speed;
      }
    } else if (keyCode == RIGHT) {
      i.add((Integer)3);
      if (xinc == speed) {
        xinc -= speed;
      }
    }
    movement.removeAll(i);
  }

  void move() {
    boolean up = movement.contains(0);
    boolean down = movement.contains(1);
    boolean left = movement.contains(2);
    boolean right = movement.contains(3);
    int upIndex = movement.lastIndexOf(0);
    int downIndex = movement.lastIndexOf(1);
    int leftIndex = movement.lastIndexOf(2);
    int rightIndex = movement.lastIndexOf(3);
    if (up&&down) {
      if (upIndex > downIndex) {
        yinc = -speed;
      } else yinc = speed;
    } else if (left&&right) {
      if (leftIndex > rightIndex) {
        xinc = -speed;
      } else xinc = speed;
    } else {
      if (up) {
        yinc = -speed;
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
  }
  //move will be based on velocity
  //buttons set velocity
  //no buttons pressed set velocity 0


  void simpleMove() {
    if ((ycor + yinc < height && ycor + yinc > 0) & xcor + xinc < width && xcor + xinc > 0) {
      ycor += yinc;
      xcor += xinc;
    }
  }

  boolean shoot(ArrayList<Bullet> b, ArrayList<Collider> c, int numBullets) {
    if (numBullets == 1) {
      if (key == ' ' && keyPressed == true) {
        //int dmg, int hp, int r, int g, int b, int rad, float x, float y, float xinc, float yinc, String type
        Bullet temp = new Bullet(power, 1, 255, 123, 45, 10, xcor+4, ycor, 3, 0, "player");
        if (temp.inContactB(b)) {
          return false;
        } else {
          b.add(temp);
          c.add(temp);
          keyPressed = false;
        }
      }
    } else if (numBullets == 2) {
      if (key == ' ' && keyPressed == true) {
        Bullet temp = new Bullet(power, 1, 255, 123, 45, 10, xcor, ycor + size/2, 3, 0, "player");
        Bullet temp2 = new Bullet(power, 1, 255, 123, 45, 10, xcor, ycor - size/2, 3, 0, "player");
        b.add(temp);
        b.add(temp2);
        c.add(temp);
        c.add(temp2);
        keyPressed = false;
        return true;
      }
    }
    return false;
  }

  float distanceTo(Collider c) {
    return distance(c.xcor, this.xcor, c.ycor, this.ycor) - (c.size/2) - (this.size/2);
  }

  boolean die(Game g, ArrayList<Collider> enemy) {
    Collider c = inContact(enemy);
    //println(c);
    if (c!= null && c.type != "player") {
      //println("inContact player");
      lives--;
      xcor = 0;
      ycor = height / 2;
      if (lives <= 0) {
        g.mode = 3;
        return true;
      }
    }
    return false;
  }

  void display() {
    //temp display
    image(img, xcor, ycor, size, size);
  }
}
