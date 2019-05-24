class Stan extends Monster {
  Stan(int x, int y, int hp, int level, int xp, String species, int power, int speed, int size) {
    super(hp, level, xp, species, power, speed, size, x, y);
  }
  void move() {
    x -= speed;
    if (x <= 0) {
      super.die(g.killedList);
    }
  }
  void shoot(ArrayList<Bullet> b) {
    b.add(new Bullet(10, 231, 124, 43, 5, x, y));
  }
  void display() {
    fill(255, 0, 0);
    rect(x, y, 20, 20);
  }
}