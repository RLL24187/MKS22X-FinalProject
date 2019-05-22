abstract class Monster implements Killable{
  int hp, level, xp, species, power, speed, size;
  Monster(int hp, int level, int xp, int species, int power, int speed, int size) {
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
  abstract void display();
  abstract void attack();
  abstract void move();
}