abstract class Monster implements Killable{
  int hp, level, xp, power, speed, size, x, y;
  String species;
  Monster(int x, int y, int hp, int level, int xp, String species, int power, int speed, int size) {
    this.x = x;
    this.y = y;
    this.hp = hp;
    this.level = level;
    this.xp = xp;
    this.species = species;
    this.power = power;
    this.speed = speed;
    this.size = size;
  }
  void die(ArrayList<Killable> k){
    k.add(this);
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
  abstract void move();
}