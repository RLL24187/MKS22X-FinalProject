class Itemdrop {
  float xcor, ycor, xinc, yinc;
  int size;
  float beginTime;
  float lifeSpan; 
  float millis;
  PImage dropImg;
  boolean intact = false;
  //lifeSpan is for how many seconds left before it can't be collected anymore
  //seconds doesn't apply to Coin, this is how long the power lasts
  Itemdrop(float x, float y, int size, float xinc, float yinc, float lifeSpan, PImage dropImg, String type) {
    xcor = x;
    ycor = y;
    this.xinc = xinc;
    this.yinc = yinc;
    this.size = size;
    this.dropImg = dropImg;
    beginTime = millis();
    this.lifeSpan = lifeSpan;
  }
  Itemdrop(float x, float y, int size, float xinc, float yinc, float lifeSpan, float millis, PImage dropImg) {
    xcor = x;
    ycor = y;
    this.xinc = xinc;
    this.yinc = yinc;
    this.size = size;
    this.dropImg = dropImg;
    beginTime = millis();
    this.lifeSpan = lifeSpan;
    this.millis = millis;
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
    if (inContact(g.p)) {
      collected(g);
      intact = true;
      display();
      g.itemdropList.remove(this);
      return true;
    } else if (millis() - beginTime > lifeSpan) {
      intact = false;
      g.itemdropList.remove(this);
      return true;
    }
    return false;
  }
  void display() {
    image(dropImg, xcor, ycor, size, size);
  }
  void collected(Game g) { 
    return; //does the power up
  }
  void bigDisplay(Game g) {
    return;
  }
}
class Coin extends Itemdrop {
  int value;
  Coin(float x, float y, int size, float xinc, float yinc, int value, float lifeSpan, PImage coinImg) {
    super(x, y, size, xinc, yinc, lifeSpan, coinImg, "player");
    this.value = value;
  }
  void collected(Game g) {
    g.coinCount += value;
    println("New coin count: "+g.coinCount);
  }
  void bigDisplay(Game g) {
    return;
  }
}
class Shield extends Itemdrop {
  Shield(float x, float y, int size, float xinc, float yinc, float lifeSpan, int millis, PImage shieldImg) {
    super(x, y, size, xinc, yinc, lifeSpan, millis, shieldImg);
  }
  void collected(Game g) {
    g.p.lives = 2; //this doesn't stack
    println("New lives count: "+g.p.lives);
    g.shieldTime = millis;
    intact = true;
  }
  void bigDisplay(Game g) {
    for(int i = 0; i < 5; i++) {
      image(dropImg, g.p.xcor, g.p.ycor, g.p.size+ 20, g.p.size+20);
    }
  }
  void display() {
    if (intact) {
      bigDisplay(g);
    } else {
      for (int i = 0; i < 5; i++) {
        image(dropImg, xcor, ycor, size, size);
      }
      fill(250, 250, 250);
      ellipse(xcor, ycor, size, size);
    }
  }
}
class DoubleBullet extends Itemdrop {
  DoubleBullet(float x, float y, int size, float xinc, float yinc, float lifeSpan, int millis, PImage bulImg) {
    super(x, y, size, xinc, yinc, lifeSpan, millis, bulImg);
  }
  void collected(Game g) {
    g.numBullets = 2; //reminder to implement a count down so this doesn't last forever
    println("New numBullets: "+g.numBullets);
    g.dbTime = millis; //1 minute
  }
  void bigDisplay(Game g) {
    return;
  }
}
