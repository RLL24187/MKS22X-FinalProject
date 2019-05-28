class Stan extends Monster {
  Stan(int hp, int level, int xp, int power, int size, float x, float y, float xinc, float yinc) {
    super(hp, level, xp, power, size, x, y, xinc, yinc);
  }
  //Stan(int hp, int level, int xp, int power, int size, float x, float y, float xinc, float yinc, ArrayList<Monster> mon) {
  //  super(hp, level, xp, power, size, x, y, xinc, yinc);
  //  for (int i = 0; i < 3; i++) { 
  //    mon.add(new Stan(hp, level, xp, power, size, xcor+10*i, ycor+10*i, xinc, yinc));
  //    mon.add(new Stan(hp, level, xp, power, size, xcor-10*i, ycor-10*i, xinc, yinc));
  //  }
  //}
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m) {
    if (super.move(k, c, m)) {
      m.remove(this);
      return true;
    }
    return false;
  }
  void shoot(ArrayList<Bullet> b) {
    b.add(new Bullet(10, 231, 124, 43, 5, xcor, ycor, xinc, yinc));
  }
  void display() {
    fill(255, 0, 0);
    rect(xcor, ycor, size, size);
  }
  //void formation(int hp, int level, int xp, int power, int size, float x, float y, float xinc, float yinc, ArrayList<Monster> mon) {
  Stan formationRightWing(int i) {
    if (i == 0) {
      return new Stan(hp, level, xp, power, size, xcor, ycor, xinc, yinc);
    } else {
      i--;
      return new Stan(hp, level, xp, power, size, xcor+10*i, ycor+10*i, xinc, yinc);
    }
  }
  Stan formationLeftWing(int i) {
    if (i == 0) { 
      return new Stan(hp, level, xp, power, size, xcor-10*i, ycor-10*i, xinc, yinc);
    } else {
      i--;
      return new Stan(hp, level, xp, power, size, xcor-10*i, ycor-10*i, xinc, yinc);
    }
  }
}