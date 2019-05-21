import java.util.*;
class Game {
  //create method called endScreen
  Player p;

  ArrayList<Monster> m;
  ArrayList<Bullet> b;
  ArrayList<Killable> k;


  void display() {
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

void endScreen() {
  textSize(100);
  fill(255, 0, 0);
  text("YOU DIED.", height/2, width/2);
}