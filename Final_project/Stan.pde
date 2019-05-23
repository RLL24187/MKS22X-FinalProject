class Stan extends Monster {
  Stan(int x, int y, int hp, int level, int xp, String species, int power, int speed, int size) {
    super(x, y, hp, level, xp, species, power, speed, size);
  }
  void move() {
    x -= speed;
  }
  void shoot() {
  }
  void display() {
  }
}