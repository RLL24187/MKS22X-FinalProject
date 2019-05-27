class Tanky extends Monster{
  Tanky(int hp, int level, int xp, String species, int power, int size, float x, float y, float xinc, float yinc) {
    super(hp, level, xp, species, power, size, x, y, xinc, yinc);
  }
  void display() {
    fill(123, 35, 58);
    rect(xcor, ycor, 10, 10);
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m){
    xcor-=xinc;
    ycor-=yinc;
    return super.die(k, c, m);
  }
  void shoot(ArrayList<Bullet> b) {
    b.add(new Bullet(10, 231, 124, 43, 5, xcor, ycor, xinc, yinc));
  }
}
  
