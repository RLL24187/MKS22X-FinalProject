abstract class Monster extends Collider {
  int hp, level, xp, power, speed, size, drop;
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
    int chooseDrop = (int)(Math.random() * 101);
    if (chooseDrop <= 75){
      drop = 0; //new Coin();
    } else if (chooseDrop <= 90){
      drop = 1; //new Shield();
    } else {
      drop = 2; //new doubleBullet();
    }
  }
  abstract void display();
  abstract void shoot(ArrayList<Bullet> b);
  void dropItem(ArrayList<Itemdrop> i){
    if (drop == 0){
      //Coin(float x, float y, int size, float xinc, float yinc, int value)
      Coin c = new Coin(xcor, ycor, 5, 1, 0, 1);
      i.add(c);
    } else if (drop == 1){
      Shield s = new Shield(xcor, ycor, 7, 1, 0);
      i.add(s);
    } else if (drop == 2){
      DoubleBullet db = new DoubleBullet(xcor, ycor, 6, 1, 0);
      i.add(db);
    }
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b) {
    xcor-=xinc;
    ycor-=yinc;
    return super.move(k, c, m, b, -1 * xinc, -1 * yinc); //true when removed
  }
}
