boolean inShop = false;
Joey joe;
PVector direction = new PVector(0,0);
boolean moving = false;
PVector goal = new PVector(0,0);  
int rateTick = 0;
float childrenSpawnRate = 10;
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
  if((int)childrenSpawnRate ==0){
    jinyus.add(new Jinyu());
  }else if(rateTick%(int)childrenSpawnRate==0){
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
      
      if(ticksSinceLastAttack>=weapon.attackSpd[weapon.currentWeapon]*frameRate){
        attack(weapon);
        ticksSinceLastAttack=0;
      }
    }
  }
  updateGame();
  
  if(childrenSpawnRate-0.001 > 0){
    childrenSpawnRate-= 0.001;
  }
  

}
void updateGame(){
  
  switch(jinyusMurdered/50){
    case 0:weapon.currentWeapon = 0;break;
    
    case 1:weapon.currentWeapon = 1;break;
    
    case 2:weapon.currentWeapon = 2;break;
    
    case 3:weapon.currentWeapon = 3;break;
    
    default:break;
  
  }

}
void attack(Weapon weapon){
  PVector newDir = new PVector(direction.x*6,direction.y*6);
  
  
  PVector centre = new PVector(newDir.x+joe.pos.x,newDir.y+joe.pos.y);
  
  fill(255,0,0);
  rect(joe.pos.x,joe.pos.y,30,30);
  fill(0,0,0);
  checkJinyu(centre);


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
  
if(jinyus.get(i).checkDeath(pos,(int)weapon.weaponRadius[weapon.currentWeapon])){
    print("death");
      jinyus.remove(i);
      joe.money += 10;
      joe.HP += 5;
      totalHealing+=5;
      jinyusMurdered+=1;
    }
  }
}


void drawJoey(Joey joe){
   PImage joey = loadImage("da_wok.png");
   image(joey,joe.pos.x-45,joe.pos.y-40);
  //fill(255,0,0);
  //rect(joe.pos.x,joe.pos.y,30,30);
  //fill(0,0,0);


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
