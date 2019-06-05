import java.util.*;

class Game {
  //create method called endScreen
  Player p;
  int numBullets = 1;
  int bankAccount = 0;
  int coinCount = 0;
  int stanCounter;
  int tankyCounter;
  int tinyCounter;
  int mode = 0;
  float dbTime = 0;
  float shieldTime = 0;
  float playerShootTime = 0;
  float time = millis();
  ArrayList<Monster> monsterList;
  ArrayList<Bullet> bulletList;
  ArrayList<Killable> killedList;
  ArrayList<Collider> collideList;
  ArrayList<Itemdrop> itemdropList;
  //PImage stanImg, tankyImg, tinyImg, playerImg, coinImg, shieldImg;
  Game() {
    monsterList = new ArrayList<Monster>();
    bulletList = new ArrayList<Bullet>();
    killedList = new ArrayList<Killable>();
    collideList = new ArrayList<Collider>();
    itemdropList = new ArrayList<Itemdrop>();
    p = new Player(10, 1, width/2., height/2., 5, 25, playerImg);
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
    int chooseYcor = (int)(Math.random()* (height));
    if (chooseMonster == 0) {
      Stan x = new Stan(10, 250, 0, 10, 30, width, chooseYcor, 2, 0., stanImg);
      if (chooseYcor <= 3*x.size) {
        x.ycor += 3*x.size;
      } else if (chooseYcor > height-(3*x.size)) {
        x.ycor -= 3*x.size;
      }
      x.formation(monsterList, collideList);
    } else if (chooseMonster == 1) {
      Tanky y = new Tanky(20, 250, 0, 10, 75, width, chooseYcor, 1, 0, tankyImg);
      if (chooseYcor < y.size/2) {
        y.ycor += y.size/2;
      }
      if (chooseYcor > height-y.size/2) {
        y.ycor -= y.size/2;
      }
      y.formation(monsterList, collideList);
    } else if (chooseMonster == 2) {
      boolean b = (int)(Math.random() * 2) % 2 == 0;
      Tiny z = new Tiny(10, 1, 5, 1, 20, width, chooseYcor, 2, 0, 200, PI/12, b, tinyImg);
      if (chooseYcor-z.amp < 0) {
        z.ycor += z.amp;
      } else if (chooseYcor+z.amp>height) {
        z.ycor -= z.amp;
      }
      z.formation(monsterList, collideList);
    }
  }
  void update() {
    stanCounter++;
    tankyCounter++;
    tinyCounter++;
    if (dbTime > 0) {
      dbTime -= millis() - time;
      if (dbTime <= 0) {
        numBullets = 1;
        println("numBullets fixed");
      }
    }
    if (shieldTime > 0) {
      shieldTime -= millis() - time;
      if (shieldTime <= 0) {
        g.p.lives = 1;
        println("lives fixed");
      }
    }
    if (playerShootTime > 0){
      playerShootTime -= millis() - time;
      /*
      if (playerShootTime <= 0) {
        println("Ready to fire!");
      }
      */
    }
    if (stanCounter % 3000 == 0) {
      display(0);
      stanCounter = 1;
    }
    if (tankyCounter % 4000 == 0) {
      display(1);
      tankyCounter = 1;
    }
    if (tinyCounter % 2000 == 0) {
      display(2);
      tinyCounter = 1;
    }
    time = millis();
  }
  void endScreen() {
    textSize(100);
    fill(255, 0, 0);
    text("YOU DIED.", height/2, width/2);
  }
  //buttons:
  //width/2 - rectWidth/2, 500
  void menu(PImage wallpaper, PFont font, PFont buttonFont) {
    image(wallpaper, 0, 0, width, height);
    strokeWeight(4);
    textFont(font, 60);
    textAlign(CENTER);
    text("DOWNgradius", width/2, height/2-100);
    textFont(buttonFont, 30);
    noFill();
    stroke(255);
    rect(width/2 - 100, 350, 200, 45);
    rect(width/2 -100, 415, 200, 45);
    rect(width/2-100, 480, 200, 45);
    rect(width/2-100, 545, 200, 45);
    if (width/2-100 <= mouseX && mouseX <= width/2 + 100) {
      if (350 <= mouseY && mouseY <= 395) {
        stroke(204, 102, 0);
        rect(width/2 - 100, 350, 200, 45);
        if (mousePressed) {
          strokeWeight(1);
          stroke(0);
          imageMode(CENTER);
          mode = 1;
        }
      }
      if (415 <= mouseY && mouseY <= 460) {
        stroke(204, 102, 0);
        rect(width/2 -100, 415, 200, 45);
        if (mousePressed) {
          mode = 2;
        }
      }
      if (480 <= mouseY && mouseY <= 525) {
        stroke(204, 102, 0);
        rect(width/2-100, 480, 200, 45);
        //if (mousePressed) {
        //  mode = 3;
        //}
      }
      if (545 <= mouseY && mouseY <= 590) {
        stroke(204, 102, 0);
        rect(width/2-100, 545, 200, 45);
        if (mousePressed) {
          exit();
        }
      }
    }
    text("START", width/2, 385);
    text("GUIDE", width/2, 450);
    text("AVATARS", width/2, 515);
    text("EXIT", width/2, 580);
  }

  void instructions() {
    image(menuPaper, 0, 0, width, height);
    textSize(100);
    text("SHOOOOOOOOOOT", width/2, height/2);
  }

  void pause() {
  }
}
Game g;
PFont font, buttonFont;
PImage menuPaper;
PImage stanImg, tankyImg, tinyImg, playerImg, coinImg, shieldImg, bulImg;
void setup() {
  font = createFont("Monotxt_IV50", 60);
  menuPaper = loadImage("menuWallpaper.jpg");
  buttonFont = createFont("Monotxt_IV25", 30);
  stanImg = loadImage("stanImg.png");
  tankyImg = loadImage("tankyImg.png");
  tinyImg = loadImage("tinyImg.png");
  playerImg = loadImage("playerImg.png");
  coinImg = loadImage("coinImg.png");
  shieldImg = loadImage("shieldImg.png");
  bulImg = loadImage("bulImg.png");
  g= new Game();
  //String[] fontList = PFont.list();
  //printArray(fontList);
  size(1200, 700);
  g.menu(menuPaper, font, buttonFont);
  g.p.ycor = height/2;
  //for (Bullet bul : g.bulletList) {
  //  g.collideList.add(bul);
  //}
  //for (Monster mon : g.monsterList) {
  //  g.collideList.add(mon);
  //}
  //g.collideList.add(g.p);
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
    if (mon.move(g.killedList, g.collideList, g.monsterList, g.bulletList, g.itemdropList)) {
      i--;
    }
    mon.shoot(g.bulletList, g.collideList);
    mon.display();
    //mon.move(g.killedList, g.collideList, g.monsterList, g.bulletList);
  }
}
void itemdropMove() {
  for (int i = 0; i < g.itemdropList.size(); i++) {
    Itemdrop item = g.itemdropList.get(i);
    if (item.move(g)) {
      i--;
    }
  }
}
void draw() {
  if (g.mode == 0) { //menu
    g.menu(menuPaper, font, buttonFont);
  }
  if (g.mode == 1) { //playing
    background(0);
    g.p.die(g.collideList);
    g.p.simpleMove();
    g.p.display();
    g.p.die(g, g.collideList);
    if (g.playerShootTime <= 0 && g.p.shoot(g.bulletList, g.collideList, g.numBullets)){
      g.playerShootTime = 100;
    }
    g.update();
    bulletMove();
    itemdropMove();
    monsterMove();
  }
  if (g.mode == 2) { //instructions
    g.instructions();
  }
  if (g.mode == 3) { //end
    background(0);
    g.endScreen();
  }
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
