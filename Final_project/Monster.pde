abstract class Monster extends Collider {
  int hp, level, xp, power, speed, size;
  float xcor, ycor;
  String species;
  Monster(int hp, int level, int xp, String species, int power, int speed, int size, float x, float y) {
    super(x, y, size);
    this.hp = hp;
    this.level = level;
    this.xp = xp;
    this.species = species;
    this.power = power;
    this.speed = speed;
    this.size = size;
    this.xcor = x;
    this.ycor = y;
  }
  void die(ArrayList<Killable> k, ArrayList<Collider> c) {
    k.add(this);
    c.remove(this);
  }
  void changeHp(int newHp) {
    hp = newHp;
  }
  //int getX() {
  //  return x;
  //}
  //int getY() {
  //  return y;
  //}
  //int getHp() {
  //  return hp;
  //}
  //int getLevel() {
  //  return level;
  //}
  //String getSpecies() {
  //  return species;
  //}
  //int getPower() {
  //  return power;
  //}
  //int getSize() {
  //  return size;
  //}
  //int getSpeed() {
  //  return speed;
  //}
  abstract void display();
  abstract void shoot(ArrayList<Bullet> b);
  abstract void move(ArrayList<Killable> k, ArrayList<Collider> c);
}
