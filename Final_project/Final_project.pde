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
    p = new Player(10, 1, width/2., height/2., 5, 10);
  }

  void display() {
    //int hp, int level, int xp, int power, int size, float x, float y, float xinc, float yinc
    int chooseMonster = (int)Math.random() * 3;
    //println(chooseMonster);
    if (chooseMonster == 0) {
      Stan x = new Stan(250, 250, 0, 10, 5, width/2, height/2, 2, 0.);
      x.formation(monsterList);
    } else if (chooseMonster == 1) {
      Tanky y = new Tanky(250, 250, 0, 10, 15, width/2, height-15, 2, 0);
      y.formation(monsterList);
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
  //below is just tests!
  //Bullet tempB = new Bullet(2, 25, 10, 89, 5, 10, 10);
  //Collider temp = new Bullet(2, 25, 10, 89, 5, 10, 10);
  //g.bulletList.add(tempB);
  //g.collideList.add(temp);
  //println("tempB xcor: "+tempB.xcor);
  //println("temp xcor: "+ temp.xcor);
  g.bulletList.add(new Bullet(10, 1, 25, 10, 89, 5, 10, 10, -2, 0));
  //int hp, int level, int xp, String species, int power, int size, float x, float y, float xinc, float yinc

    //println("\nAdding bullet");
    for (Bullet bul : g.bulletList) {
    //println("bulletlistSize: "+ g.bulletList.size());
    //println("g.bulletList.get(0).xcor: "+g.bulletList.get(0).xcor);
    //g.collideList.add(tempB);
    g.collideList.add(bul);
    println("bul hp: "+bul.hp);
    //println("size: "+g.collideList.size());
    //println("bul.xcor: "+bul.xcor);
    //println(g.collideList.get(0));
    //println("g.collideList.get(0).xcor: "+g.collideList.get(0).xcor);
    //println(bul.ycor);
  }
  //println("\nAdding monster");
  for (Monster mon : g.monsterList) {
    g.collideList.add(mon);
    //println(g.collideList.get(1).xcor);
    //println(mon.xcor);
    //println(mon.ycor);
    //println(g.collideList.size());
  }
  //g.collideList.add(g.p);
  //println(width);
  //println(height);
  //println(toString(g.collideList));
}
void draw() {
  //setup();
  background(255);
  g.p.display();
  g.p.shoot(g.bulletList, g.collideList);
  //for (Bullet bul : g.bulletList) {
  for (int i = 0; i < g.bulletList.size(); i++) {
    //g.collideList.add(bul);
    Bullet bul = g.bulletList.get(i);
    //bul.display();
    //println(bul.hp);
    if (bul.move(g.killedList, g.collideList, g.monsterList, g.bulletList)) {
      i--;
    }
    bul.display();
    //println(g.collideList.size());
  }
  //for (Monster mon : g.monsterList) 
  for (int i = 0; i < g.monsterList.size(); i++) {
    //g.collideList.add(mon);
    Monster mon = g.monsterList.get(i);
    //mon.display();
    if (mon.move(g.killedList, g.collideList, g.monsterList, g.bulletList)){
      i--;
    }
    mon.display();
    //println("IM DISPLAYING");
    mon.move(g.killedList, g.collideList, g.monsterList, g.bulletList);
    //println(g.collideList.size());
  }
  //println(g.collideList.size());
  //println(toString(g.collideList));
  //println(toString(g.bulletList));
  //println(toString(g.monsterList));
}
void keyPressed() {
  g.p.buttons();
  g.p.move();
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