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
  boolean move(Game g) {
    xcor+= xinc;
    ycor+= yinc;
    display();
    return die(g); //returns true when this dies
  }
  boolean die(Game g) {
    if (inContact(g.p)){
      collected(g);
      g.itemdropList.remove(this);
      return true;
    }
    return false;
  }
  void display(){
  }
  void collected(Game g){ //does the power up
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
    println("New coin count: "+g.coinCount);
  }
  void display(){
    //temp display
    fill(0, 150, 150);
    ellipse(xcor, ycor, size, size);
  }
}
class Shield extends Itemdrop{
  Shield(float x, float y, int size, float xinc, float yinc){
    super(x, y, size, xinc, yinc);
  }
  void collected(Game g){
    g.p.lives = 2; //this doesn't stack
    println("New lives count: "+g.p.lives);
  }
  void display(){
    //temp display
    fill(150, 20, 20);
    ellipse(xcor, ycor, size, size);
  }
}
class DoubleBullet extends Itemdrop{
  DoubleBullet(float x, float y, int size, float xinc, float yinc){
    super(x, y, size, xinc, yinc);
  }
  void collected(Game g){
    g.numBullets = 2; //reminder to implement a count down so this doesn't last forever
    println("New numBullets: "+g.numBullets);
  }
  void display(){
    //temp display
    fill(150, 0, 150);
    ellipse(xcor, ycor, size, size);
  }
}
