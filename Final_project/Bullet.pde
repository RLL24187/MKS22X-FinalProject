import java.util.*;

class Bullet extends Collider {
  int damage;
  int red;
  int green;
  int blue;
  int size;
  int xcor, ycor;

  Bullet(int dmg, int r, int g, int b, int rad, int x, int y) {
    damage = dmg;
    red = r;
    green = g;
    blue = b;
    size = rad;
    xcor = x;
    ycor = y;
  }

  void display() {
    fill(red, green, blue);
    ellipse(xcor, ycor, size, size);
  }
  
  void move(ArrayList<Killable> k, ArrayList<Collider> c){
    xcor+= 2;
    super.die(k, c);
  }
  void splitIt() {
  }
}
