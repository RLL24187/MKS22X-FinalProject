class Tanky extends Monster{
  Tanky(int hp, int level, int xp, int power, int size, float xcor, float ycor, float xinc, float yinc) {
    super(hp, level, xp, power, size, xcor, ycor, xinc, yinc);
  }
  void display() {
    fill(123, 35, 58);
    rect(xcor, ycor, size, size);
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b){
    /*
    xcor-=xinc;
    ycor-=yinc;
    return super.die(k, c, m, b);
    */
    if (super.move(k, c, m, b)){
      m.remove(this);
      return true;
    }
    return false;
  }
  void shoot(ArrayList<Bullet> b) {
    b.add(new Bullet(power, 1, 231, 124, 43, 5, xcor, ycor, xinc, yinc));
  }
  void formation(ArrayList<Monster> mon) {
    mon.add(this);
    for(int i = 1; i < 5; i++) {
      Tanky t;
      if (i % 2 == 1) {
        t = new Tanky(hp, level, xp, power, size, xcor+size*i, 0., xinc, yinc);
        //mon.add(new Tanky(hp, level, xp, power, size, xcor+size*i, 0., xinc, yinc));
      } else {
        t = new Tanky(hp, level, xp, power, size, xcor + size*i, height - size, xinc, yinc);
        //mon.add(new Tanky(hp, level, xp, power, size, xcor+size*i, height-size, xinc, yinc));
      }
      mon.add(t);
      /*
      println("added to mon");
      c.add(t);
      println("added to c");*/
    }
  }
}
  
