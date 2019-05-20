class Game{
  Player p;
  Monster[] m;
  void setup(){
  }
  void display(){
  }
  
}
class Player{
  int lives;
  String name;
  Player(int hp, String name){
   lives = hp;
   this.name = name;
  }
}
class Monster{
  int hp;
  Monster(int hp){
    this.hp = hp;
  }  
}
