import java.util.*;
class Game {
  //create method called endScreen
  Player p;
  int numBullets = 2;
  int bankAccount = 0;
  int coinCount = 0;
  int stanCounter;
  int tankyCounter;
  int tinyCounter;
  int mode = 0;
  ArrayList<Monster> monsterList;
  ArrayList<Bullet> bulletList;
  ArrayList<Killable> killedList;
  ArrayList<Collider> collideList;
  ArrayList<Itemdrop> itemdropList;

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
Game g = new Game();
PFont font, buttonFont;
PImage menuPaper;
void setup() {
  font = createFont("Monotxt_IV50", 60);
  menuPaper = loadImage("menuWallpaper.jpg");
  buttonFont = createFont("Monotxt_IV25", 30);
  //String[] fontList = PFont.list();
  //printArray(fontList);
  size(1200, 700);
  g.menu(menuPaper, font, buttonFont);
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
  if (g.mode == 0) { //menu
    g.menu(menuPaper, font, buttonFont);
  }
  if (g.mode == 1) { //playing
    background(255);
    g.p.simpleMove();
    g.p.display();
    g.p.shoot(g.bulletList, g.collideList, g.numBullets);
    g.update();
    bulletMove();
    monsterMove();
  }
  if (g.mode == 2) { //instructions
    g.instructions();
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

//FONT LIST:
//[0] "AIGDT"
//[1] "AMGDT"
//[2] "AMGDT_IV25"
//[3] "AMGDT_IV50"
//[4] "AcadEref"
//[5] "AmdtSymbols"
//[6] "Arial"
//[7] "Arial Black"
//[8] "Arial Bold"
//[9] "Arial Bold Italic"
//[10] "Arial Italic"
//[11] "Bahnschrift"
//[12] "Bahnschrift Bold"
//[13] "Bahnschrift Bold Condensed"
//[14] "Bahnschrift Bold SemiCondensed"
//[15] "Bahnschrift Condensed"
//[16] "Bahnschrift Light"
//[17] "Bahnschrift Light Condensed"
//[18] "Bahnschrift Light SemiCondensed"
//[19] "Bahnschrift Regular"
//[20] "Bahnschrift SemiBold"
//[21] "Bahnschrift SemiBold Condensed"
//[22] "Bahnschrift SemiBold SemiCondensed"
//[23] "Bahnschrift SemiCondensed"
//[24] "Bahnschrift SemiLight"
//[25] "Bahnschrift SemiLight Condensed"
//[26] "Bahnschrift SemiLight SemiCondensed"
//[27] "Bank Gothic Light BT"
//[28] "Bank Gothic Medium BT"
//[29] "Calibri"
//[30] "Calibri Bold"
//[31] "Calibri Bold Italic"
//[32] "Calibri Italic"
//[33] "Calibri Light"
//[34] "Calibri Light Italic"
//[35] "Cambria"
//[36] "Cambria Bold"
//[37] "Cambria Bold Italic"
//[38] "Cambria Italic"
//[39] "Cambria Math"
//[40] "Candara"
//[41] "Candara Bold"
//[42] "Candara Bold Italic"
//[43] "Candara Italic"
//[44] "CityBlueprint"
//[45] "Comic Sans MS"
//[46] "Comic Sans MS Bold"
//[47] "Comic Sans MS Bold Italic"
//[48] "Comic Sans MS Italic"
//[49] "Commercial Pi BT"
//[50] "Commercial Script BT"
//[51] "Complex"
//[52] "Complex_IV25"
//[53] "Complex_IV50"
//[54] "Consolas"
//[55] "Consolas Bold"
//[56] "Consolas Bold Italic"
//[57] "Consolas Italic"
//[58] "Constantia"
//[59] "Constantia Bold"
//[60] "Constantia Bold Italic"
//[61] "Constantia Italic"
//[62] "Corbel"
//[63] "Corbel Bold"
//[64] "Corbel Bold Italic"
//[65] "Corbel Italic"
//[66] "CountryBlueprint"
//[67] "Courier New"
//[68] "Courier New Bold"
//[69] "Courier New Bold Italic"
//[70] "Courier New Italic"
//[71] "DengXian Bold"
//[72] "DengXian Light"
//[73] "DengXian Regular"
//[74] "Dialog.bold"
//[75] "Dialog.bolditalic"
//[76] "Dialog.italic"
//[77] "Dialog.plain"
//[78] "DialogInput.bold"
//[79] "DialogInput.bolditalic"
//[80] "DialogInput.italic"
//[81] "DialogInput.plain"
//[82] "Dutch 801 Bold BT"
//[83] "Dutch 801 Bold Italic BT"
//[84] "Dutch 801 Extra Bold BT"
//[85] "Dutch 801 Italic BT"
//[86] "Dutch 801 Roman BT"
//[87] "Ebrima"
//[88] "Ebrima Bold"
//[89] "EuroRoman"
//[90] "EuroRoman Oblique"
//[91] "FangSong"
//[92] "Franklin Gothic Medium"
//[93] "Franklin Gothic Medium Italic"
//[94] "GDT"
//[95] "GDT_IV25"
//[96] "GDT_IV50"
//[97] "GENISO"
//[98] "GOST Common"
//[99] "GOST Common Italic"
//[100] "Gabriola"
//[101] "Gadugi"
//[102] "Gadugi Bold"
//[103] "Georgia"
//[104] "Georgia Bold"
//[105] "Georgia Bold Italic"
//[106] "Georgia Italic"
//[107] "GothicE"
//[108] "GothicG"
//[109] "GothicI"
//[110] "GreekC"
//[111] "GreekC_IV25"
//[112] "GreekC_IV50"
//[113] "GreekS"
//[114] "GreekS_IV25"
//[115] "GreekS_IV50"
//[116] "HoloLens MDL2 Assets"
//[117] "ISOCP"
//[118] "ISOCP2"
//[119] "ISOCP2_IV25"
//[120] "ISOCP2_IV50"
//[121] "ISOCP3"
//[122] "ISOCP3_IV25"
//[123] "ISOCP3_IV50"
//[124] "ISOCPEUR"
//[125] "ISOCPEUR Italic"
//[126] "ISOCP_IV25"
//[127] "ISOCP_IV50"
//[128] "ISOCT"
//[129] "ISOCT2"
//[130] "ISOCT2_IV25"
//[131] "ISOCT2_IV50"
//[132] "ISOCT3"
//[133] "ISOCT3_IV25"
//[134] "ISOCT3_IV50"
//[135] "ISOCTEUR"
//[136] "ISOCTEUR Italic"
//[137] "ISOCT_IV25"
//[138] "ISOCT_IV50"
//[139] "Impact"
//[140] "Ink Free"
//[141] "Italic"
//[142] "ItalicC"
//[143] "ItalicT"
//[144] "Italic_IV25"
//[145] "Italic_IV50"
//[146] "Javanese Text"
//[147] "KaiTi"
//[148] "Leelawadee UI"
//[149] "Leelawadee UI Bold"
//[150] "Leelawadee UI Semilight"
//[151] "Lucida Bright Demibold"
//[152] "Lucida Bright Demibold Italic"
//[153] "Lucida Bright Italic"
//[154] "Lucida Bright Regular"
//[155] "Lucida Console"
//[156] "Lucida Sans Demibold"
//[157] "Lucida Sans Regular"
//[158] "Lucida Sans Typewriter Bold"
//[159] "Lucida Sans Typewriter Regular"
//[160] "Lucida Sans Unicode"
//[161] "MS Gothic"
//[162] "MS PGothic"
//[163] "MS UI Gothic"
//[164] "MV Boli"
//[165] "Malgun Gothic"
//[166] "Malgun Gothic Bold"
//[167] "Malgun Gothic Semilight"
//[168] "Marlett"
//[169] "Microsoft Himalaya"
//[170] "Microsoft JhengHei"
//[171] "Microsoft JhengHei Bold"
//[172] "Microsoft JhengHei Light"
//[173] "Microsoft JhengHei UI"
//[174] "Microsoft JhengHei UI Bold"
//[175] "Microsoft JhengHei UI Light"
//[176] "Microsoft New Tai Lue"
//[177] "Microsoft New Tai Lue Bold"
//[178] "Microsoft PhagsPa"
//[179] "Microsoft PhagsPa Bold"
//[180] "Microsoft Sans Serif"
//[181] "Microsoft Tai Le"
//[182] "Microsoft Tai Le Bold"
//[183] "Microsoft YaHei"
//[184] "Microsoft YaHei Bold"
//[185] "Microsoft YaHei Light"
//[186] "Microsoft YaHei UI"
//[187] "Microsoft YaHei UI Bold"
//[188] "Microsoft YaHei UI Light"
//[189] "Microsoft Yi Baiti"
//[190] "MingLiU-ExtB"
//[191] "MingLiU_HKSCS-ExtB"
//[192] "Mongolian Baiti"
//[193] "Monospace 821 BT"
//[194] "Monospace 821 Bold BT"
//[195] "Monospace 821 Bold Italic BT"
//[196] "Monospace 821 Italic BT"
//[197] "Monospaced.bold"
//[198] "Monospaced.bolditalic"
//[199] "Monospaced.italic"
//[200] "Monospaced.plain"
//[201] "Monotxt"
//[202] "Monotxt_IV25"
//[203] "Monotxt_IV50"
//[204] "Myanmar Text"
//[205] "Myanmar Text Bold"
//[206] "NSimSun"
//[207] "Nirmala UI"
//[208] "Nirmala UI Bold"
//[209] "Nirmala UI Semilight"
//[210] "PMingLiU-ExtB"
//[211] "Palatino Linotype"
//[212] "Palatino Linotype Bold"
//[213] "Palatino Linotype Bold Italic"
//[214] "Palatino Linotype Italic"
//[215] "PanRoman"
//[216] "Proxy 1"
//[217] "Proxy 2"
//[218] "Proxy 3"
//[219] "Proxy 4"
//[220] "Proxy 5"
//[221] "Proxy 6"
//[222] "Proxy 7"
//[223] "Proxy 8"
//[224] "Proxy 9"
//[225] "RomanC"
//[226] "RomanD"
//[227] "RomanS"
//[228] "RomanS_IV25"
//[229] "RomanS_IV50"
//[230] "RomanT"
//[231] "Romantic"
//[232] "Romantic Bold"
//[233] "Romantic Italic"
//[234] "SansSerif"
//[235] "SansSerif Bold"
//[236] "SansSerif BoldOblique"
//[237] "SansSerif Oblique"
//[238] "SansSerif.bold"
//[239] "SansSerif.bolditalic"
//[240] "SansSerif.italic"
//[241] "SansSerif.plain"
//[242] "ScriptC"
//[243] "ScriptS"
//[244] "ScriptS_IV25"
//[245] "ScriptS_IV50"
//[246] "Segoe MDL2 Assets"
//[247] "Segoe Print"
//[248] "Segoe Print Bold"
//[249] "Segoe Script"
//[250] "Segoe Script Bold"
//[251] "Segoe UI"
//[252] "Segoe UI Black"
//[253] "Segoe UI Black Italic"
//[254] "Segoe UI Bold"
//[255] "Segoe UI Bold Italic"
//[256] "Segoe UI Emoji"
//[257] "Segoe UI Historic"
//[258] "Segoe UI Italic"
//[259] "Segoe UI Light"
//[260] "Segoe UI Light Italic"
//[261] "Segoe UI Semibold"
//[262] "Segoe UI Semibold Italic"
//[263] "Segoe UI Semilight"
//[264] "Segoe UI Semilight Italic"
//[265] "Segoe UI Symbol"
//[266] "Serif.bold"
//[267] "Serif.bolditalic"
//[268] "Serif.italic"
//[269] "Serif.plain"
//[270] "SimHei"
//[271] "SimSun"
//[272] "SimSun-ExtB"
//[273] "Simplex"
//[274] "Simplex_IV25"
//[275] "Simplex_IV50"
//[276] "Sitka Banner"
//[277] "Sitka Banner Bold"
//[278] "Sitka Banner Bold Italic"
//[279] "Sitka Banner Italic"
//[280] "Sitka Display"
//[281] "Sitka Display Bold"
//[282] "Sitka Display Bold Italic"
//[283] "Sitka Display Italic"
//[284] "Sitka Heading"
//[285] "Sitka Heading Bold"
//[286] "Sitka Heading Bold Italic"
//[287] "Sitka Heading Italic"
//[288] "Sitka Small"
//[289] "Sitka Small Bold"
//[290] "Sitka Small Bold Italic"
//[291] "Sitka Small Italic"
//[292] "Sitka Subheading"
//[293] "Sitka Subheading Bold"
//[294] "Sitka Subheading Bold Italic"
//[295] "Sitka Subheading Italic"
//[296] "Sitka Text"
//[297] "Sitka Text Bold"
//[298] "Sitka Text Bold Italic"
//[299] "Sitka Text Italic"
//[300] "Stylus BT"
//[301] "SuperFrench"
//[302] "Swiss 721 BT"
//[303] "Swiss 721 Black BT"
//[304] "Swiss 721 Black Condensed BT"
//[305] "Swiss 721 Black Condensed Italic BT"
//[306] "Swiss 721 Black Extended BT"
//[307] "Swiss 721 Black Italic BT"
//[308] "Swiss 721 Black Outline BT"
//[309] "Swiss 721 Bold BT"
//[310] "Swiss 721 Bold Condensed BT"
//[311] "Swiss 721 Bold Condensed Italic BT"
//[312] "Swiss 721 Bold Condensed Outline BT"
//[313] "Swiss 721 Bold Extended BT"
//[314] "Swiss 721 Bold Italic BT"
//[315] "Swiss 721 Bold Outline BT"
//[316] "Swiss 721 Condensed BT"
//[317] "Swiss 721 Condensed Italic BT"
//[318] "Swiss 721 Extended BT"
//[319] "Swiss 721 Italic BT"
//[320] "Swiss 721 Light BT"
//[321] "Swiss 721 Light Condensed BT"
//[322] "Swiss 721 Light Condensed Italic BT"
//[323] "Swiss 721 Light Extended BT"
//[324] "Swiss 721 Light Italic BT"
//[325] "Syastro"
//[326] "Syastro_IV25"
//[327] "Syastro_IV50"
//[328] "Sylfaen"
//[329] "Symap"
//[330] "Symap_IV25"
//[331] "Symap_IV50"
//[332] "Symath"
//[333] "Symath_IV25"
//[334] "Symath_IV50"
//[335] "Symbol"
//[336] "Symeteo"
//[337] "Symeteo_IV25"
//[338] "Symeteo_IV50"
//[339] "Symusic"
//[340] "Symusic_IV25"
//[341] "Symusic_IV50"
//[342] "Tahoma"
//[343] "Tahoma Bold"
//[344] "Technic"
//[345] "TechnicBold"
//[346] "TechnicLite"
//[347] "Times New Roman"
//[348] "Times New Roman Bold"
//[349] "Times New Roman Bold Italic"
//[350] "Times New Roman Italic"
//[351] "Trebuchet MS"
//[352] "Trebuchet MS Bold"
//[353] "Trebuchet MS Bold Italic"
//[354] "Trebuchet MS Italic"
//[355] "Txt"
//[356] "Txt_IV25"
//[357] "Txt_IV50"
//[358] "Universal Math 1 BT"
//[359] "Verdana"
//[360] "Verdana Bold"
//[361] "Verdana Bold Italic"
//[362] "Verdana Italic"
//[363] "Vineta BT"
//[364] "Webdings"
//[365] "Wingdings"
//[366] "Yu Gothic Bold"
//[367] "Yu Gothic Light"
//[368] "Yu Gothic Medium"
//[369] "Yu Gothic Regular"
//[370] "Yu Gothic UI Bold"
//[371] "Yu Gothic UI Light"
//[372] "Yu Gothic UI Regular"
//[373] "Yu Gothic UI Semibold"
//[374] "Yu Gothic UI Semilight"
