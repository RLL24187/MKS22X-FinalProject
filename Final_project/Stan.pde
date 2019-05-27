class Stan extends Monster {
  Stan(int hp, int level, int xp, String species, int power, int size, float x, float y, float xinc, float yinc) {
    super(hp, level, xp, species, power, size, x, y, xinc, yinc);
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m) {
    if (super.move(k, c, m)){
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
    rect(xcor, ycor, 20, 20);
  }
}
