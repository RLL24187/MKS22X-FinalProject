class Tanky extends Monster {
  String type = "monster";
  Tanky(int hp, int level, int xp, int power, int size, float xcor, float ycor, float xinc, float yinc, PImage img, int scoring) {
    super(hp, level, xp, power, size, xcor, ycor, xinc, yinc, img, scoring);
  }
  void display() {
    image(img, xcor, ycor, size, size);
  }
  //float distanceTo(Collider c) {
  //  return distance(c.xcor, this.xcor + this.size/2, c.ycor, this.ycor + this.size/2) - (c.size/2) - (this.size/2);
  //}
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b, ArrayList<Itemdrop> i) {
    if (super.move(k, c, m, b, i)) {
      m.remove(this);
      dropItem(g.itemdropList);
      return true;
    }
    return false;
  }
  void shoot(ArrayList<Bullet> b, ArrayList<Collider> c) {
    if (g.tankyCounter % 80 == 0) {
      Bullet bul = new Bullet(power, 1, 255, 124, 43, 10, xcor, ycor, -3*xinc, yinc, "monster");
      b.add(bul);
      c.add(bul);
    }
  }
  void formation(ArrayList<Monster> mon, ArrayList<Collider> c) {
    mon.add(this);
    c.add(this);
    for (int i = 1; i < 5; i++) {
      Tanky t;
      float chooseYcor;
      if (i % 2 == 1) {
        chooseYcor = height - ycor + size * i;
      } else {
        chooseYcor = ycor + size * i;
      }
      if (chooseYcor < 0) {
        chooseYcor += height;
      } else if (chooseYcor > height - size) {
        chooseYcor -= height - size;
      }
      t = new Tanky(hp, level, xp, power, size, xcor + 2 * size*i, chooseYcor, xinc, yinc, img, scoring);
      mon.add(t);
      c.add(t);
    }
  }
}
