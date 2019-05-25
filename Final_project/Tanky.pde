class Tanky extends Monster{
  Tanky(int hp, int level, int xp, String species, int power, int speed, int size, int x, int y) {
    super(hp, level, xp, species, power, speed, size, x, y);
  }
  void display() {
    fill(123, 35, 58);
    rect(x, y, 10, 10);
  }
  void move(ArrayList<Killable> k, ArrayList<Collider> c) {
    x-= speed;
    super.die(k, c);
  }
  void shoot(ArrayList<Bullet> b) {
    b.add(new Bullet(10, 231, 124, 43, 5, x, y));
  }
}
  
