class Collider implements Killable {
  float xcor, ycor, xinc, yinc;
  int size, hp, power;
  Collider(float x, float y, int size, int hp, int power) {
    xcor = x;
    ycor = y;
    this.size = size;
    this.hp = hp;
    this.power = power;
  }

  void display() {
  }
  float distance(float x1, float x2, float y1, float y2) {
    return pow((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2), .5);
  }
  float distanceTo(Collider c) {
    return distance(c.xcor, this.xcor, c.ycor, this.ycor) - (c.size/2) - (this.size/2);
  }
  boolean inRadius (Collider c) {
    if (c.equals(this)) return false;
    return (distanceTo(c) <= 0);
  }
  Collider inContact(ArrayList<Collider> c) {
    //println("inContact: ");
    for (Collider obj : c) {
      if (inRadius(obj)) {
        //println(true);
        return obj;
      }
    }
    return null;
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b, float xinc, float yinc) {
    xcor+= xinc;
    ycor+= yinc;
    return die(k, c, m, b); //returns true when this dies
  }

  int changeHP(int change) {
    hp -= change;
    //println(this + "'s HP: "+hp);
    return hp;
  }

  boolean die(ArrayList<Killable> k, ArrayList<Collider>c, ArrayList<Monster> m, ArrayList<Bullet> b) {
    boolean returnval = false;
    if (inContact(c) != null) println("inContact");
    Collider temp = inContact(c); 
    if (temp != null) { 
      int thisNewHP = changeHP(temp.power);
      int tempNewHP = temp.changeHP(this.power);
      if (thisNewHP <= 0) {
        k.add(this); //remove the monster from collider and add to killed if HP too low
        c.remove(this);
        //m.remove(this);
        //b.remove(this);
        //this.display();
        //temp.display();
        temp.move(k, c, m, b, temp.xinc, temp.yinc);
        println(this+" removed");
        returnval = true;
      }
      if (tempNewHP <= 0) {
        c.remove(temp);
        m.remove(temp);
        b.remove(temp);
        println(temp + " removed");
        //this.display();
        //temp.display();
        this.move(k, c, m, b, this.xinc, this.yinc);
        //return true;
      }//otherwise it stays alive, with HP changed
    }
    if (xcor < -1 * size) { //out of bounds
      c.remove(this);
      return true;
    }
    return returnval;
  }
}
