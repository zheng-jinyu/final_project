boolean inShop = false;
Joey joe;
PVector direction = new PVector(0,0);
boolean moving = false;
PVector goal = new PVector(0,0);  
int rateTick = 0;
int childrenSpawnRate = 60;
ArrayList<Jinyu> jinyus = new ArrayList<Jinyu>();
Weapon weapon;
boolean dead = false;
int ticksSinceLastAttack;
PVector attackPosition;


//GAME STATS
int jinyusMurdered;
int totalHealing;
int totalDmgTaken;



void setup(){
  size(1080,810);
  background(0,200,0);
  joe = new Joey();
  attackPosition = new PVector(-100,-100);
  ticksSinceLastAttack = 0;
  
  weapon = new Weapon(); 
}

void draw(){
  if(dead)return;
  background(0,150,50);
  rateTick++;
  
  drawJoey(joe);
  direction = joe.move(new PVector(mouseX,mouseY));
  if(rateTick%childrenSpawnRate==0){
    jinyus.add(new Jinyu());
    
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
      print(weapon.attackSpd[weapon.currentWeapon]*frameRate);
      
      if(ticksSinceLastAttack>=weapon.attackSpd[weapon.currentWeapon]*frameRate){
        attack(weapon);
        ticksSinceLastAttack=0;
      }
    }
  }
  
  

}

<<<<<<< HEAD
void market() {
  if(inShop && keyPressed == "F") {
    
  }
=======
void attack(Weapon weapon){
  PVector newDir = new PVector(direction.x*6,direction.y*6);
  
  
  PVector centre = new PVector(newDir.x+joe.pos.x,newDir.y+joe.pos.y);
  
  fill(255,0,0);
  rect(joe.pos.x,joe.pos.y,30,30);
  fill(0,0,0);
  checkJinyu(centre);
>>>>>>> e3200c4dba2201e3fbf888374346eb4e6349671f

}

void drawChildren(){
  for(int i = 0; i<jinyus.size();i++){
    PImage child = loadImage("jinyu.png");
    image(child,jinyus.get(i).pos.x,jinyus.get(i).pos.y);
    /*
    fill(100,200,150);
    rect(children.get(i).pos.x,children.get(i).pos.y,30,30);
    fill(0,0,0);
    */
    
    jinyus.get(i).move(joe.pos);
    
    totalDmgTaken+=jinyus.get(i).checkTouch(joe);
    
  }

}

void checkJinyu(PVector pos){
  for(int i = 0; i<jinyus.size();i++){
  
if(jinyus.get(i).checkDeath(pos)){
    print("death");
      jinyus.remove(i);
    }
  }
}


void drawJoey(Joey joe){
  Pimage joe = loadImage("m1.png");
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
  text("You defeated "+jinyusMurdered+" jinyus.",width/2-100,height/2);

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
