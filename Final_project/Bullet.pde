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

  float distanceTo(Monster k) {
    return pow((k.x * k.x) + (k.y * k.y), .5) - pow((this.x * this.x) + (this.y + this.y), .5) - k.size;
  }
  
  float distanceTo(Player k) {
    return pow((k.x * k.x) + (k.y * k.y), .5) - pow((this.x * this.x) + (this.y + this.y), .5) - k.size;
  }

  boolean inRadius (Monster k) {
    return (distanceTo(k) <= 0);
  }
  boolean inRadius (Player k) {
    return (distanceTo(k) <= 0);
  }
  boolean inContact(ArrayList<Monster> k) {
    for (Monster obj : k) {
      if (inRadius(obj)){
        return true;
      }
    }
    return false;
  }
  boolean inContact(Player p){
    return inRadius(p);
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
