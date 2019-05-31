import java.util.*;

class Bullet extends Collider {
  int power;
  int red;
  int green;
  int blue;
  int size;
  int hp;
  float xcor, ycor, xinc, yinc;

  Bullet(int dmg, int hp, int r, int g, int b, int rad, float x, float y, float xinc, float yinc) {
    super(x, y, rad, hp, dmg);
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
  }
  void display() {
    fill(red, green, blue);
    ellipse(xcor, ycor, size, size);
  }
  /*
  boolean die(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Bullet> b) {
   if (super.die(k, c)) {
   b.remove(this);
   return true;
   }
   return false;
   }*/
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b) {
    xcor+=xinc;
    ycor+=yinc;
    if (super.move(k, c, m, b, xinc, yinc)) {
      //return die(k, c, m, b);
      b.remove(this);
      return true;
    }
    if (xcor > width){
      b.remove(this);
      println("Bullet xcor bound");
      return true;
    }
    return false;
  }
  void splitIt() {
  }
}
