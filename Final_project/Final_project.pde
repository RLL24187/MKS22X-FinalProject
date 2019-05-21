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
}
void draw(){
}

void endScreen() {
  textSize(100);
  fill(255, 0, 0);
  text("YOU DIED.", height/2, width/2);
}