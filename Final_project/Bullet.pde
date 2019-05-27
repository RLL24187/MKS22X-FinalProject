import java.util.*;

class Bullet extends Collider {
  int damage;
  int red;
  int green;
  int blue;
  int size;
  float xcor, ycor, xinc, yinc;

  Bullet(int dmg, int r, int g, int b, int rad, float x, float y, float xinc, float yinc) {
    super(x, y, rad);
    damage = dmg;
    red = r;
    green = g;
    blue = b;
    size = rad;
    xcor = x;
    ycor = y;
    this.xinc = xinc;
    this.yinc = yinc;
  }

  void display() {
    fill(red, green, blue);
    ellipse(xcor, ycor, size, size);
  }

  boolean die(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Bullet> b) {
    if (super.die(k, c)) {
      b.remove(this);
      return true;
    }
    return false;
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Bullet> b) {
    xcor+=xinc;
    ycor+=yinc;
    if (super.move(k, c, xinc, yinc)) {
      return die(k, c, b);
    }
    return false;
  }
  void splitIt() {
  }
}
