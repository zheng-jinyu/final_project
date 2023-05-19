boolean inShop = false;
Joey joe;
PVector direction = new PVector(0,0);
boolean moving = false;
PVector goal = new PVector(0,0);  

void setup(){
  size(1920,1080);
  background(0,200,0);
  joe = new Joey();
}

void draw(){
  background(0,200,0);
  drawJoey(joe);
  /*
  if (keyPressed){
    if(key == CODED){
      switch(keyCode){
        
        case UP:{direction = (new PVector(0,-10));moving=true;break;}
        case DOWN:{direction = (new PVector(0,10));moving=true;break;}
        case LEFT:{direction = (new PVector(-10,0));moving=true;break;}
        case RIGHT:{direction = (new PVector(10,0));moving=true;break;}
        
        
      }
      
  }
  }
  */
  joe.move(goal);
}

void drawJoey(Joey joe){
  fill(255,0,0);
  rect(joe.pos.x,joe.pos.y,30,30);
  fill(0,0,0);


}

void mouseClicked(){
 goal.x=mouseX;
 goal.y=mouseY;

}
/*
void keyReleased(){
  moving = false;
}
*/
