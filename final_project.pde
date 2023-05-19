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
  background(0,150,50);
  
  drawJoey(joe);
  rotate((float)joe.move(goal));
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
