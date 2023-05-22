boolean inShop = false;
Joey joe;
PVector direction = new PVector(0,0);
boolean moving = false;
PVector goal = new PVector(0,0);  
int rateTick = 0;
int childrenSpawnRate = 60;
ArrayList<Children> children = new ArrayList<Children>();

void setup(){
  size(1920,1080);
  background(0,200,0);
  joe = new Joey();
}

void draw(){
  background(0,150,50);
  rateTick++;
  
  drawJoey(joe);
  joe.move(goal);
  
  if(rateTick%childrenSpawnRate==0){
    children.add(new Children());
    
  }
  
  drawChildren();
  

}

void drawChildren(){
  for(int i = 0; i<children.size();i++){
    fill(100,200,150);
    rect(children.get(i).pos.x,children.get(i).pos.y,30,30);
    fill(0,0,0);
    children.get(i).move(joe.pos);
  }

}


void drawJoey(Joey joe){
  fill(255,0,0);
  rect(joe.pos.x,joe.pos.y,30,30);
  fill(0,0,0);


}

void mouseClicked(){
  if(mouseButton == RIGHT){
 goal.x=mouseX;
 goal.y=mouseY;
  }

}
/*
void keyReleased(){
  moving = false;
}
*/
