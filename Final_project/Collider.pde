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
  
  void display(){
  }
  float distance(float x1, float x2, float y1, float y2) {
    return pow((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2), .5);
  }
  float distanceTo(Collider c) {
    //println("\n\ndistanceTo");
    //println(this);
    //println(c);
    //println(this.xcor);
    //println(c.xcor);
    //println(this.ycor);
    //println(c.ycor);
    //println(distance(c.xcor, this.xcor, c.ycor, this.ycor));
    return distance(c.xcor, this.xcor, c.ycor, this.ycor) - (c.size/2) - (this.size/2);
  }
  boolean inRadius (Collider c) {
    //println(this);
    //println(c);
    //println("inRadius: " + c.equals(this));
    //println("distanceTo(c): "+distanceTo(c));
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
  /*
  boolean inContact(Collider c) {
   return inRadius(c);
   }*/
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
    //if (xcor>width) println("x>width");
    //if (xcor<0) println("x<0");
    //if (ycor<0) println("y<0");
    //if (ycor>height) println("y>height)");
    Collider temp = inContact(c); 
    if (temp != null) { 
      //println(this + ": "+ xcor);
      //println(temp + ": "+ temp.xcor);
      /*
      println(temp + "'s power: "+temp.power);
      println(this + "'s HP: "+this.hp);
      println(temp + "'s HP: "+temp.hp);
      println(this + "'s power: "+this.power);
      */
      int thisNewHP = changeHP(temp.power);
      int tempNewHP = temp.changeHP(this.power);
      /*
      println(this + "thisNewHP: "+thisNewHP);
      println(temp + "tempNewHP: "+tempNewHP);
      */
      //if (changeHP(temp.power) <= 0) { //will always change the HP: returns the new HP of this
      if (thisNewHP <= 0){
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
      //if (temp.changeHP(this.power) <= 0){
      if (tempNewHP <= 0){
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
    if (xcor < -1 * size || ycor < 0 || ycor > height) { //out of bounds
      //k.add(this);
      //println(c.size());
      c.remove(this);
      //m.remove(this);
      //b.remove(this);
      //println(this + " out of bounds: (x,y) = ("+xcor+","+ycor+")");
      //println(c.size());
      return true;
    }
    return returnval;
  }
}
