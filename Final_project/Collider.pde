class Collider implements Killable {
  float x, y, size;
  float distanceTo(Collider c) {
    return pow((c.x * c.x) + (c.y * c.y), .5) - pow((this.x * this.x) + (this.y + this.y), .5) - (c.size + this.size);
  }
  boolean inRadius (Collider c) {
    return (distanceTo(c) <= 0);
  }
  boolean inContact(ArrayList<Collider> c) {
    for (Collider obj : c) {
      if (inRadius(obj)) {
        return true;
      }
    }
    return false;
  }
  boolean inContact(Collider c) {
    return inRadius(c);
  }

  void die(ArrayList<Killable> k, ArrayList<Collider>c) {
    if (inContact(c) || (x > width) || x < 0 || y < 0 || y > height) {
      k.add(this);
      c.remove(this);
    }
  }
}
