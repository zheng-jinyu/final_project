boolean inShop = false;
Joey joe;
PVector direction = new PVector(0,0);
boolean moving = false;
PVector goal = new PVector(0,0);  
int rateTick = 0;
int childrenSpawnRate = 60;
ArrayList<Children> children = new ArrayList<Children>();
Weapon weapon;
boolean dead = false;
int ticksSinceLastAttack;


//GAME STATS
int childrenMurdered;
int totalHealing;
int totalDmgTaken;



void setup(){
  size(1080,810);
  background(0,200,0);
  joe = new Joey();
  ticksSinceLastAttack = 0;
  
  weapon = new Weapon(); 
}

void draw(){
  if(dead)return;
  background(0,150,50);
  rateTick++;
  
  drawJoey(joe);
  joe.move(new PVector(mouseX,mouseY));
  
  if(rateTick%childrenSpawnRate==0){
    children.add(new Children());
    
  }
  weapon.drawWeapon(joe);
  drawChildren();
  
  if(joe.HP<=0){
    death();
    joe.HP=0;
  }
  textSize(60);
  text("HP: "+joe.HP,700,60);
  ticksSinceLastAttack++;
  if(keyPressed){
    if (key == 'a'){
      print("a");
      if(ticksSinceLastAttack>=weapon.attackSpd[weapon.currentWeapon]*frameRate){
        attack(weapon);
        ticksSinceLastAttack=0;
      }
    }
  }
  
  

}

void attack(Weapon weapon){
  

}


void drawChildren(){
  for(int i = 0; i<children.size();i++){
    PImage child = loadImage("jinyu.png");
    image(child,children.get(i).pos.x,children.get(i).pos.y);
    /*
    fill(100,200,150);
    rect(children.get(i).pos.x,children.get(i).pos.y,30,30);
    fill(0,0,0);
    */
    
    children.get(i).move(joe.pos);
    totalDmgTaken+=children.get(i).checkTouch(joe);
  }

}


void drawJoey(Joey joe){
  fill(255,0,0);
  rect(joe.pos.x,joe.pos.y,30,30);
  fill(0,0,0);


}
void death(){
  PImage img;
  img = loadImage("lost.png");
  image(img,0,0);
  dead = true;
  textSize(60);
  text("YOU DIED",width/2-100,height/2-50);
  textSize(20);
  text("You defeated "+childrenMurdered+" jinyus.",width/2-100,height/2);
  text("You healed "+totalHealing+" HP.",width/2-100,height/2+50);
  text("You took "+totalDmgTaken+" DMG.",width/2-100,height/2+100);
  
  
}
void mouseClicked(){
  //if(mouseButton == RIGHT){
 goal.x=mouseX;
 goal.y=mouseY;
  //}

}
/*
void keyReleased(){
  moving = false;
}
*/
