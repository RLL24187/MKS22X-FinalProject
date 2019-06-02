abstract class Monster extends Collider {
  int hp, level, xp, power, speed, size;
  float xcor, ycor, xinc, yinc;
  Monster(int hp, int level, int xp, int power, int size, float x, float y, float xinc, float yinc) {
    super(x, y, size, hp, power);
    this.hp = hp;
    this.level = level;
    this.xp = xp;
    this.power = power;
    this.xinc = xinc;
    this.yinc = yinc;
    this.size = size;
    this.xcor = x;
    this.ycor = y;
  }
  abstract void display();
  abstract void shoot(ArrayList<Bullet> b);
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b) {
    xcor-=xinc;
    ycor-=yinc;
    //println("monster move");
    return super.move(k, c, m, b, -1 * xinc, -1 * yinc); //true when removed
  }
}
