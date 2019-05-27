abstract class Monster extends Collider {
  int hp, level, xp, power, speed, size;
  float xcor, ycor, xinc, yinc;
  String species;
  Monster(int hp, int level, int xp, String species, int power, int size, float x, float y, float xinc, float yinc) {
    super(x, y, size);
    this.hp = hp;
    this.level = level;
    this.xp = xp;
    this.species = species;
    this.power = power;
    this.xinc = xinc;
    this.yinc = yinc;
    this.size = size;
    this.xcor = x;
    this.ycor = y;
  }
  //boolean die(ArrayList<Killable> k, ArrayList<Collider> c) {
  //return super.die(k, c);
  //}
  boolean die(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m) {
    if (super.die(k, c)) {
      m.remove(this);
      return true; //true when removed
    }
    return false;
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
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m) {
    xcor-=xinc;
    ycor-=yinc;
    return super.move(k, c, -1 * xinc, -1 * yinc); //true when removed
  }
}
