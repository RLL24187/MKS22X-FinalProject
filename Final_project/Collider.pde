class Collider implements Killable {
  float xcor, ycor, xinc, yinc;
  int size;
  Collider(float x, float y, int size){
    xcor = x;
    ycor = y;
    this.size = size;
  }
  float distance(float x1, float x2, float y1, float y2){
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
  boolean inContact(ArrayList<Collider> c) {
    //println("inContact: ");
    for (Collider obj : c) {
      if (inRadius(obj)) {
        //println(true);
        return true;
      }
    }
    return false;
  }
  boolean inContact(Collider c) {
    return inRadius(c);
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, float xinc, float yinc){
    xcor+= xinc;
    ycor+= yinc;
    return die(k, c);
  }

  boolean die(ArrayList<Killable> k, ArrayList<Collider>c) {
    //println(xcor);
    if (inContact(c)) println("inContact");
    //if (xcor>width) println("x>width");
    //if (xcor<0) println("x<0");
    //if (ycor<0) println("y<0");
    //if (ycor>height) println("y>height)");
    if (inContact(c) || (xcor > width) || xcor < 0 || ycor < 0 || ycor > height) {
      k.add(this);
      c.remove(this);
      //println("removed");
      return true;
    }
    return false;
  }
}
