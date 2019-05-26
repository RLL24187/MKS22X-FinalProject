class Collider implements Killable {
  float xcor, ycor;
  int size;
  Collider(float x, float y, int size){
    xcor = x;
    ycor = y;
    this.size = size;
  }
  float distanceTo(Collider c) {
    println("\n\ndistanceTo");
    println(this);
    println(this.xcor);
    println(c.xcor);
    println(c);
    return pow((c.xcor * c.xcor) + (c.ycor * c.ycor), .5) - pow((this.xcor * this.xcor) + (this.ycor + this.ycor), .5) - (c.size + this.size);
  }
  boolean inRadius (Collider c) {
    println(this);
    println(c);
    println("inRadius: " + c.equals(this));
    println("distanceTo(c): "+distanceTo(c));
    return (!c.equals(this) && distanceTo(c) <= 0);
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

  void die(ArrayList<Killable> k, ArrayList<Collider>c) {
    if (inContact(c)) println("inContact");
    if (xcor>width) println("x>width");
    if (xcor<0) println("x<0");
    if (ycor<0) println("y<0");
    if (ycor>height) println("y>height)");
    if (inContact(c) || (xcor > width) || xcor < 0 || ycor < 0 || ycor > height) {
      k.add(this);
      c.remove(this);
    }
  }
}
