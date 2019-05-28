abstract class Monster extends Collider {
  int hp, level, xp, power, speed, size;
  float xcor, ycor, xinc, yinc;
  String species;
  Monster(int hp, int level, int xp, String species, int power, int size, float x, float y, float xinc, float yinc) {
    super(x, y, size, hp, power);
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
  /*
  boolean die(ArrayList<Killable> k, ArrayList<Collider> c) {
   if (super.die(k, c)) {
   m.remove(this);
   return true; //true when removed
   }
   return false;
   }*/
  /*
  void changeHp(int newHp) {
   hp = newHp;
   }*/
  abstract void display();
  abstract void shoot(ArrayList<Bullet> b);
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b) {
    xcor-=xinc;
    ycor-=yinc;
    return super.move(k, c, m, b, -1 * xinc, -1 * yinc); //true when removed
  }
}
