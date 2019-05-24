import java.util.*;

class Bullet extends Collider {
  int damage;
  int red;
  int green;
  int blue;
  int size;
  int x, y;

  Bullet(int dmg, int r, int g, int b, int rad, int x, int y) {
    damage = dmg;
    red = r;
    green = g;
    blue = b;
    size = rad;
    this.x = x;
    this.y = y;
  }

  void display() {
    fill(red, green, blue);
    ellipse(x, y, size, size);
  }
  void splitIt() {
  }
}
