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
    p = new Player(1, "Sadboi", width/2, height/2, 5, 10);
  }

  void display() {
    //int hp, int level, int xp, String species, int power, int size, float x, float y, float xinc, float yinc
    int chooseMonster = (int)Math.random() * 2;
    if (chooseMonster == 0) {
        monsterList.add(new Stan(250, 250, 0, "Stan", 10, 5, 1., 10., 2., 0.));
    } else if (chooseMonster == 1) {
        monsterList.add(new Tanky(250, 250, 0, "Tanky", 10, 5,  1., 10., 2., 0.));
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
  size(1200, 1200);
  //below is just tests!
  //Bullet tempB = new Bullet(2, 25, 10, 89, 5, 10, 10);
  //Collider temp = new Bullet(2, 25, 10, 89, 5, 10, 10);
  //g.bulletList.add(tempB);
  //g.collideList.add(temp);
  //println("tempB xcor: "+tempB.xcor);
  //println("temp xcor: "+ temp.xcor);
  g.bulletList.add(new Bullet(2, 25, 10, 89, 5, 10, 10, 2, 0));
  //int hp, int level, int xp, String species, int power, int size, float x, float y, float xinc, float yinc
  g.monsterList.add(new Stan(10, 1, 5, "Stan", 1, 10, 250, 250, 3, 0));

  println("\nAdding bullet");
  for (Bullet bul : g.bulletList) {
    //println("bulletlistSize: "+ g.bulletList.size());
    //println("g.bulletList.get(0).xcor: "+g.bulletList.get(0).xcor);
    //g.collideList.add(tempB);
    g.collideList.add(bul);
    //println("size: "+g.collideList.size());
    //println("bul.xcor: "+bul.xcor);
    //println(g.collideList.get(0));
    //println("g.collideList.get(0).xcor: "+g.collideList.get(0).xcor);
    //println(bul.ycor);
  }
  println("\nAdding monster");
  for (Monster mon : g.monsterList) {
    g.collideList.add(mon);
    //println(g.collideList.get(1).xcor);
    //println(mon.xcor);
    //println(mon.ycor);
    println(g.collideList.size());
  }
  println(width);
  println(height);
  println(toString(g.collideList));
}
void draw() {
  //setup();
  background(255);
  g.p.move();
  g.p.display();
  g.p.shoot(g.bulletList);
  //for (Bullet bul : g.bulletList) {
  for (int i = 0; i < g.bulletList.size(); i++) {
    //g.collideList.add(bul);
    Bullet bul = g.bulletList.get(i);
    bul.display();
    bul.move(g.killedList, g.collideList, g.bulletList);
    //println(g.collideList.size());
  }
  //for (Monster mon : g.monsterList) {
  for (int i = 0; i < g.monsterList.size(); i++) {
    //g.collideList.add(mon);
    Monster mon = g.monsterList.get(i);
    mon.display();
    mon.move(g.killedList, g.collideList, g.monsterList);
    //println(g.collideList.size());
  }
  //println(g.collideList.size());
  //println(toString(g.collideList));
  //println(toString(g.bulletList));
  //println(toString(g.monsterList));
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
