import java.util.*;
class Game {
  //create method called endScreen
  Player p;

  ArrayList<Monster> m;
  ArrayList<Bullet> b;
  ArrayList<Killable> k;

  Game() {
    m = new ArrayList<Monster>();
    b = new ArrayList<Bullet>();
    k = new ArrayList<Killable>();
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
  g.b.add(new Bullet(2, 25, 10, 89, 5, 10, 10));
}
void draw() {
  //setup();
  background(255);
  g.b.add(new Bullet(2, 25, 10, 89, 5, 100, 100));
  g.m.add(new Stan(250, 250, 10, 1, 0, "Stan", 10, 10, 10));
  for (Bullet bul : g.b) {
    bul.display();
  }
  for (Monster mon : g.m) {
    mon.move();
    mon.display();
  }
  g.p.move();
  g.p.display();
}