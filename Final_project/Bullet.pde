import java.util.*;

class Bullet implements Killable {
  int damage;
  int red;
  int green;
  int blue;
  int radius;
  int x, y;

  Bullet(int dmg, int r, int g, int b, int rad, int x, int y) {
    damage = dmg;
    red = r;
    green = g;
    blue = b;
    radius = rad;
    this.x = x;
    this.y = y;
  }
  
  boolean inRadius (Killable k){
  }
  boolean inContact(ArrayList<Killable> k) {
    for (Killable obj : k){
      if (x + radius >= obj.x){
        return true;
      }
    return false;
  }

  void die(ArrayList<Killable> k) {
    k.remove(this);
  }

  void display() {
    fill(red, green, blue);
    ellipse(x, y, radius, radius);
  }
  void splitIt() {
  }
}
