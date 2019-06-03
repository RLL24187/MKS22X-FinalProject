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

  Game() {
    monsterList = new ArrayList<Monster>();
    bulletList = new ArrayList<Bullet>();
    killedList = new ArrayList<Killable>();
    collideList = new ArrayList<Collider>();
    p = new Player(10, 1, width/2., height/2., 5, 25);
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
        x.ycor -= height - 3*x.size;
      }
      x.formation(monsterList);
      //counter = 360;
      //p.ycor = height/2;
    } else if (chooseMonster == 1) {
      Tanky y = new Tanky(20, 250, 0, 10, 75, width, chooseYcor, 1, 0);
      if (chooseYcor > height-(3*y.size)) {
        y.ycor -= height - 3*y.size;
      }
      y.formation(monsterList);
    } else if (chooseMonster == 2) {
      boolean b = (int)(Math.random() * 2) % 2 == 0;
      //Tiny z = new Tiny(10, 1, 5, 1, 10, width, height / 2, 2, 0, 200, PI/12, b);
      //counter = 280;
      Tiny z = new Tiny(10, 1, 5, 1, 10, width, chooseYcor, 2, 0, 200, PI/12, b);
      if (chooseYcor-z.amp < 0) {
        z.ycor += z.amp;
      } else if (chooseYcor+z.amp>height) {
        z.ycor -= z.amp;
      }
      z.formation(monsterList);
      //p.ycor = height / 2;
    }
  }
  void update() {
    stanCounter++;
    tankyCounter++;
    tinyCounter++;
    if (stanCounter % 150 == 0) {
      display(0);
      stanCounter = 1;
    } 
    if (tankyCounter % 400 == 0) {
      display(1);
      tankyCounter = 1;
    }
    if (tinyCounter % 200 == 0) {
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
  g.collideList.add(g.p);
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
    mon.shoot(g.bulletList);
    mon.display();
    mon.move(g.killedList, g.collideList, g.monsterList, g.bulletList);
  }
}
void draw() {
  background(255);
  g.p.simpleMove();
  g.p.display();
  //g.p.die(g.collideList);
  g.p.shoot(g.bulletList, g.collideList);
  g.update();
  bulletMove();
  monsterMove();
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
  g.p.reset();
}
//print method for ArrayList
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
