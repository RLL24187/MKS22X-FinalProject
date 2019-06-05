import java.util.*;

class Bullet extends Collider {
  int power;
  int red;
  int green;
  int blue;
  int size;
  int hp;
  float xcor, ycor, xinc, yinc;
  String type; //player's bullet vs monster bullet

  Bullet(int dmg, int hp, int r, int g, int b, int rad, float x, float y, float xinc, float yinc, String type) {
    super(x, y, rad, hp, dmg, type);
    power = dmg;
    this.hp = hp;
    red = r;
    green = g;
    blue = b;
    size = rad;
    xcor = x;
    ycor = y;
    this.xinc = xinc;
    this.yinc = yinc;
    this.type = type;
  }
  void display() {
    fill(red, green, blue);
    ellipse(xcor, ycor, size, size);
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b) {
    xcor+=xinc;
    ycor+=yinc;
    if (super.move(k, c, m, b, xinc, yinc)) {
      //return die(k, c, m, b);
      b.remove(this);
      return true;
    }
    if (xcor > width + size) {
      b.remove(this);
      //println("Bullet xcor bound");
      return true;
    }
    return false;
  }
  boolean inContactB(ArrayList<Bullet> c) {
    //println("inContact: ");
    for (Bullet obj : c) {
      if (inRadius(obj)) {
        //println(true);
        return true;
      }
    }
    return false;
  }
}
