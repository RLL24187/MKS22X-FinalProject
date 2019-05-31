import java.util.*;
class Game {
  //create method called endScreen
  Player p;

  ArrayList<Monster> monsterList;
  ArrayList<Bullet> bulletList;
  ArrayList<Killable> killedList;
  ArrayList<Collider> collideList;

  Game() {
    monsterList = new ArrayList<Monster>();
    bulletList = new ArrayList<Bullet>();
    killedList = new ArrayList<Killable>();
    collideList = new ArrayList<Collider>();
    p = new Player(10, 1, width/2., 350, 15, 25);
  }

  void display() {
    //int hp, int level, int xp, int power, int size, float x, float y, float xinc, float yinc
    int chooseMonster = (int)(Math.random() * 3);
    //int chooseMonster = 2;
    //println(chooseMonster);
    
    if (chooseMonster == 0) {
      Stan x = new Stan(10, 250, 0, 10, 15, width, height/2, 2, 0.);
      x.formation(monsterList);
      p.ycor = height/2;
    } else if (chooseMonster == 1) {
      Tanky y = new Tanky(20, 250, 0, 10, 75, width, height-75, .5, 0);
      y.formation(monsterList);
      p.ycor = height - 50;
    } else if (chooseMonster == 2) {
      boolean b = (int)(Math.random() * 2) % 2 == 0;
      Tiny z = new Tiny(10, 1, 5, 1, 10, width, height / 2, 3.2, 0, 25, b);
      z.formation(monsterList);
      p.ycor = height / 2;
    }
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
  size(1200, 700);
  g.display();
  for (Bullet bul : g.bulletList) {
    g.collideList.add(bul);
  }
  for (Monster mon : g.monsterList) {
    g.collideList.add(mon);
  }
}
void bulletMove(){
  for (int i = 0; i < g.bulletList.size(); i++) {
    Bullet bul = g.bulletList.get(i);
    if (bul.move(g.killedList, g.collideList, g.monsterList, g.bulletList)) {
      i--;
    }
    bul.display();
  }
}
void monsterMove(){
  for (int i = 0; i < g.monsterList.size(); i++) {
    Monster mon = g.monsterList.get(i);
    if (mon.move(g.killedList, g.collideList, g.monsterList, g.bulletList)){
      i--;
    }
    mon.display();
    mon.move(g.killedList, g.collideList, g.monsterList, g.bulletList);
  }
}
  
void draw() {
  background(255);
  g.p.display();
  g.p.shoot(g.bulletList, g.collideList);
  bulletMove();
  monsterMove();
  //println(g.collideList.size());
  //println(toString(g.collideList));
  //println(toString(g.bulletList));
  //println(toString(g.monsterList));
}
void keyPressed() {
  g.p.buttons();
  g.p.move();
  //controls(buttonsPressed
  //send vars into player
  //method simpleMove
  //x+=dx, y+=dy
  //growTimer--
}

void keyReleased() {
  g.p.movement.clear();
}
//print method for arrayList but not v helpful attm
String toString(ArrayList ary) {
  String output = "[";
  for (int i = 0; i < ary.size(); i++) {
    output += ary.get(i);
    if (i != ary.size() - 1) {
      output += ", ";
    }
  }
  return output + "]";
}
