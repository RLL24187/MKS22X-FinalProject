import java.util.*;
class Game {
  //create method called endScreen
  Player p;

  ArrayList<Monster> monsterList;
  ArrayList<Bullet> bulletList;
  ArrayList<Killable> killedList;

  Game() {
    monsterList = new ArrayList<Monster>();
    bulletList = new ArrayList<Bullet>();
    killedList = new ArrayList<Killable>();
    p = new Player(1, "Sadboi", width/2, height/2, 5, 10);
  }

  void display() {
  }

  void update() {
  }

  void endScreen() {
    textSize(100);
    fill(255, 0, 0);
    text("YOU DIED.", height/2, width/2);
  }
}
Game g = new Game();
void setup() {
  size(500, 500);
  g.bulletList.add(new Bullet(2, 25, 10, 89, 5, 10, 10));
  g.monsterList.add(new Stan(250, 250, 10, 1, 0, "Stan", 10, 1, 10));
}
void draw() {
  //setup();
  background(255);
  g.bulletList.add(new Bullet(2, 25, 10, 89, 5, 100, 100));
  for (Bullet bul : g.bulletList) {
    bul.display();
  }
  for (Monster mon : g.monsterList) {
    mon.move();
    mon.display();
  }
  g.p.move();
  g.p.display();
}