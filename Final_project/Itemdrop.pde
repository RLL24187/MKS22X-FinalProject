class Itemdrop{
  float xcor, ycor, xinc, yinc;
  int size;
  Itemdrop(float x, float y, int size, float xinc, float yinc) {
    xcor = x;
    ycor = y;
    this.xinc = xinc;
    this.yinc = yinc;
    this.size = size;
  }
  float distance(float x1, float x2, float y1, float y2) {
    return pow((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2), .5);
  }
  float distanceTo(Player p) {
    return distance(p.xcor, this.xcor, p.ycor, this.ycor) - (p.size/2) - (this.size/2);
  }
  boolean inContact (Player p) {
    return (distanceTo(p) <= 0);
  }
  boolean move(Player p, ArrayList<Itemdrop> i) {
    xcor+= xinc;
    ycor+= yinc;
    return die(p, i); //returns true when this dies
  }
  boolean die(Player p, ArrayList<Itemdrop> i) {
    if (inContact(p)){
      collected();
      i.remove(this);
      return true;
    }
    return false;
  }
  void display(){
  }
  void collected(){ //does the power up
  }
}
class Coin extends Itemdrop{
  int value;
  Coin(float x, float y, int size, float xinc, float yinc, int value){
    super(x, y, size, xinc, yinc);
    this.value = value;
  }
  void collected(Game g){
    g.coinCount += value;
  }
}
class Shield extends Itemdrop{
  Shield(float x, float y, int size, float xinc, float yinc){
    super(x, y, size, xinc, yinc);
  }
  void collected(Game g){
    g.p.lives = 2; //this doesn't stack
  }
  
}
class DoubleBullet extends Itemdrop{
  DoubleBullet(float x, float y, int size, float xinc, float yinc){
    super(x, y, size, xinc, yinc);
    this.value = value;
  }
  void collected(Game g){
    g.coinCount += value;
  }
}
