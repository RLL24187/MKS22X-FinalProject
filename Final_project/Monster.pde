abstract class Monster extends Collider {
  int hp, level, xp, power, speed, size, drop;
  float xcor, ycor, xinc, yinc;
  PImage img;
  Monster(int hp, int level, int xp, int power, int size, float x, float y, float xinc, float yinc, PImage img) {
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
    this.img = img;
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
      //Coin(float x, float y, int size, float xinc, float yinc, int value, float lifeSpan)
      Coin c = new Coin(xcor, ycor, 15, -2, 0, 1, 5000, coinImg);
      i.add(c);
    } else if (drop == 1){
      Shield s = new Shield(xcor, ycor, 15, -2, 0, 5000, 5000, shieldImg);
      i.add(s);
    } else if (drop == 2){
      DoubleBullet db = new DoubleBullet(xcor, ycor, 15, -2, 0, 5000, 5000, bulImg);
      i.add(db);
    }
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b, ArrayList<Itemdrop> i) {//true when removed
    xcor-=xinc;
    ycor-=yinc;
    if (super.move(k, c, m, b, -1 * xinc, -1 * yinc)){
      dropItem(i);
      return true;
    }
    return false;
  }
}
