import java.util.*;
class Game {
  //create method called endScreen
  Player p;
  Monster[] m;

  ArrayList<Monster> m;
  ArrayList<Bullet> b;
  ArrayList<Killable> k;


  void display() {
  }

}

  void update() {
  }
}
void setup() {
  ArrayList<Bullet> b = new ArrayList<Bullet>();
  b.add(new Bullet(2, 25, 10, 89, 5, 10, 10));
}
void draw(){
  setup();
  for (Bullet bul: b){
    bul.display();
  }
}
