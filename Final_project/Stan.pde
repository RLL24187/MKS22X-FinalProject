class Stan extends Monster {
  Stan(int hp, int level, int xp, String species, int power, int size, float x, float y, float xinc, float yinc) {
    super(hp, level, xp, species, power, size, x, y, xinc, yinc);
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b) {
    if (super.move(k, c, m, b)){
      m.remove(this);
      return true;
    }
    return false;
  }
  void shoot(ArrayList<Bullet> b) {
    b.add(new Bullet(power, 1, 231, 124, 43, 5, xcor, ycor, xinc, yinc));
  }
  void display() {
    fill(255, 0, 0);
    rect(xcor, ycor, size, size);
  }
  void formation(ArrayList<Monster> mon) {
    for(int i = 0; i < 5; i++) {
    }
  }
}
