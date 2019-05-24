abstract class Monster extends Collider {
  int hp, level, xp, species, power, speed, size, x, y;
  Monster(int hp, int level, int xp, int species, int power, int speed, int size, int x, int y) {
    this.hp = hp;
    this.level = level;
    this.xp = xp;
    this.species = species;
    this.power = power;
    this.speed = speed;
    this.size = size;
    this.x = x;
    this.y = y;
  }
  void die(ArrayList<Killable> k) {
    k.add(this);
  }
  void changeHp(int newHp) {
    hp = newHp;
  }
  abstract void display();
  abstract void shoot();
  abstract void move();
}
