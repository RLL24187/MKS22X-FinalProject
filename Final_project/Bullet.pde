class Bullet implements Killable{
  int damage;
  int red;
  int green;
  int blue;
  int radius;
  int x, y;
  
  Bullet(int dmg, int r, int g, int b, int rad, int x, int y){
    damage = dmg;
    red = r;
    green = g;
    blue = b;
    radius = rad;
    this.x = x;
    this.y = y;
  }
  
  boolean inContact(ArrayList<Monster> m){
    return false;
  }
  
  void die(){
    
  }
  void display(){
    fill(red, green, blue);
    circle(x, y, radius);
  }
  void splitIt(){
  }
}
