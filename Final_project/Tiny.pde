class Tiny extends Monster {
  boolean neg;
  float amp, angle;
  Tiny(int hp, int level, int xp, int power, int size, float xcor, float ycor, float xinc, float yinc, float amp, float angle, boolean neg) {
    super(hp, level, xp, power, size, xcor, ycor, xinc, yinc);
    this.neg = neg;
    this.amp = amp;
    this.angle = angle; //in rads
  }
  float distanceTo(Collider c) {
    return distance(c.xcor, this.xcor + this.size/2, c.ycor, this.ycor + this.size/2) - (c.size/2) - (this.size/2);
  }
  void display() {
    fill(30, 160, 0);
    rect(xcor, ycor, size, size);
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b, ArrayList<Itemdrop> i) {
    angle += PI/angle;
    yinc = height/amp * sin(angle);
    if (neg) {
      yinc *= -1;
    }
    if (super.move(k, c, m, b, i)) {
      m.remove(this);
      return true;
    }
    return false;
  }
  void shoot(ArrayList<Bullet> b) {
    if (g.tankyCounter % 90 == 0) {
      b.add(new Bullet(power, 1, 255, 124, 43, 10, xcor, ycor+size/2, -3*xinc, 0));
    }
  }
  void formation(ArrayList<Monster> mon) {
    mon.add(this);
    for (int i = 0; i < 3; i++) {
      Tiny t;
      if (i % 3 == 0) {
        t = new Tiny(hp, level, xp, power, size, xcor+size*i + 10 * size, ycor + 10 * size, xinc, yinc, amp + 5, angle + amp/ 4, true);
      } else if (i % 3 == 1) {
        t = new Tiny(hp, level, xp, power, size, xcor+size*i + 15 * size, ycor - 10 * size, xinc, yinc, amp + 5, angle + size/ 3, false);
      } else {
        t = new Tiny(hp, level, xp, power, size, xcor+size*i + 20 * size, ycor, xinc, yinc, amp, angle / 6, neg);
      }
      mon.add(t);
    }
  }
}
