class Tanky extends Monster{
  Tanky(int hp, int level, int xp, int power, int size, float x, float y, float xinc, float yinc) {
    super(hp, level, xp, power, size, x, y, xinc, yinc);
  }
  void display() {
    fill(123, 35, 58);
    rect(xcor, ycor, 10, 10);
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b){
    xcor-=xinc;
    ycor-=yinc;
    return super.die(k, c, m, b);
  }
  void shoot(ArrayList<Bullet> b) {
    b.add(new Bullet(power, 1, 231, 124, 43, 5, xcor, ycor, xinc, yinc));
  }
}
  