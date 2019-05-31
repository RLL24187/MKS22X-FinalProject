class Tiny extends Monster{
  boolean neg;
  Tiny(int hp, int level, int xp, int power, int size, float xcor, float ycor, float xinc, float yinc) {
    super(hp, level, xp, power, size, xcor, ycor, xinc, yinc);
    neg = (int)(Math.random() * 2 % 2) == 0;
  }
  void display() {
    fill(30, 160, 0);
    rect(xcor, ycor, size, size);
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b){
    /*
    xcor-=xinc;
    ycor-=yinc;
    return super.die(k, c, m, b);
    */
    //x = sin^-1(2 * f(x)/ height);
    //f(x) = height/2 * sin(x) + someYint
    //f(x-1) = height/2 * sin(x-1) + someYint
    //difference = height/2 * (sin(x-1) - sin(x))
    yinc = height/15 * (sin(xcor - xinc) - sin(xcor)) * ((width - xcor) / 200);
    if (neg){
      yinc *= -1;
    }
    //println("yinc: "+yinc);
    //println("ycor: "+ycor);
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
      Tiny t;
      if (i % 2 == 1) {
        t = new Tiny(hp, level, xp, power, size, xcor+size*i, 0., xinc, yinc);
        //mon.add(new Tanky(hp, level, xp, power, size, xcor+size*i, 0., xinc, yinc));
      } else {
        t = new Tiny(hp, level, xp, power, size, xcor + size*i, height - size, xinc, yinc);
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
