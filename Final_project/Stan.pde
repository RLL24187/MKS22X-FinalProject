class Stan extends Monster {
  Stan(int hp, int level, int xp, int power, int size, float x, float y, float xinc, float yinc) {
    super(hp, level, xp, power, size, x, y, xinc, yinc);
  }
  float distanceTo(Collider c) {
    return distance(c.xcor, this.xcor + this.size/2, c.ycor, this.ycor + this.size/2) - (c.size/2) - (this.size/2);
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
    mon.add(this);
    for (int i = 1; i < 3; i++) { 
      mon.add(new Stan(hp, level, xp, power, size, xcor+size*i, ycor+size*i, xinc, yinc));
      mon.add(new Stan(hp, level, xp, power, size, xcor+size*i, ycor-size*i, xinc, yinc));
    }
  }
}
