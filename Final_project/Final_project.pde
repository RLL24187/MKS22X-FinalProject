import java.util.*;
class Game {
  //create method called endScreen
  Player p;
  int stanCounter;
  int tankyCounter;
  int tinyCounter;

  ArrayList<Monster> monsterList;
  ArrayList<Bullet> bulletList;
  ArrayList<Killable> killedList;
  ArrayList<Collider> collideList;
  int second = second();
  Game() {
    monsterList = new ArrayList<Monster>();
    bulletList = new ArrayList<Bullet>();
    killedList = new ArrayList<Killable>();
    collideList = new ArrayList<Collider>();
    p = new Player(10, 1, width/2., height/2., 15, 25);
    int firstWave = (int)(Math.random() * 3);
    if (firstWave == 0) {
      stanCounter = -1;
    } else if (firstWave == 1) {
      tankyCounter = -1;
    } else if (firstWave == 2) {
      tinyCounter = -1;
    }
  }


  void display(int chooseMonster) {
    //int hp, int level, int xp, int power, int size, float x, float y, float xinc, float yinc
    //int chooseMonster = (int)(Math.random() * 3);
    //int chooseMonster = 2;
    //println(chooseMonster);
    int chooseYcor = (int)(Math.random()* (height));
    if (chooseMonster == 0) {
      //Stan x = new Stan(10, 250, 0, 10, 15, width, height/2, 2, 0.);
      Stan x = new Stan(10, 250, 0, 10, 15, width, chooseYcor, 2, 0.);
      if (chooseYcor <= 2*x.size) {
        x.ycor += 2*x.size;
      } else if (chooseYcor > height-(3*x.size)) {
        x.ycor -= 3*x.size;
      }
      x.formation(monsterList);
      //counter = 360;
      //p.ycor = height/2;
    } else if (chooseMonster == 1) {
      Tanky t = new Tanky(20, 250, 0, 10, 75, width, height-75, .5, 0);
      t.formation(monsterList);
    } else if (chooseMonster == 2) {
      //Tanky y = new Tanky(20, 250, 0, 10, 75, width, height-75, 1, 0);
      //counter = 1;
      if (chooseYcor > height - 75) {
        chooseYcor -= 75;
      } else if (chooseYcor < 75) {
        chooseYcor += 75;
      }
      Tanky y = new Tanky(20, 250, 0, 10, 75, width, chooseYcor, 1, 0);
      y.formation(monsterList);
      //p.ycor = height - 50;
    } else if (chooseMonster == 2) {
      boolean b = (int)(Math.random() * 2) % 2 == 0;
      //Tiny z = new Tiny(10, 1, 5, 1, 10, width, height / 2, 2, 0, 200, PI/12, b);
      //counter = 280;
      Tiny z = new Tiny(10, 1, 5, 1, 10, width, chooseYcor, 2, 0, 200, PI/12, b);
      z.formation(monsterList);
      //p.ycor = height / 2;
    }
  }

  void update() {
    stanCounter++;
    tankyCounter++;
    tinyCounter++;
    if (stanCounter % 75 == 0) {
      display(0);
      stanCounter = 1;
    } 
    if (tankyCounter % 200 == 0) {
      display(1);
      tankyCounter = 1;
    }
    if (tinyCounter % 100 == 0) {
      display(2);
      tinyCounter = 1;
    }
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
  //g.display();
  g.p.ycor = height/2;
  for (Bullet bul : g.bulletList) {
    g.collideList.add(bul);
  }
  for (Monster mon : g.monsterList) {
    g.collideList.add(mon);
  }
}
void bulletMove() {
  for (int i = 0; i < g.bulletList.size(); i++) {
    Bullet bul = g.bulletList.get(i);
    if (bul.move(g.killedList, g.collideList, g.monsterList, g.bulletList)) {
      i--;
    }
    bul.display();
  }
}
void monsterMove() {
  for (int i = 0; i < g.monsterList.size(); i++) {
    Monster mon = g.monsterList.get(i);
    if (mon.move(g.killedList, g.collideList, g.monsterList, g.bulletList)) {
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
  g.update();
  bulletMove();
  monsterMove();
  g.p.simpleMove();
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
  g.p.yinc = 0;
  g.p.xinc = 0;
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
