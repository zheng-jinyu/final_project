public class Weapon{
  int currentWeapon;
  /*
  0 = fist
  1 = bat
  2 = katana
  3 = chainsaw
  */
  
  public Weapon(){
    currentWeapon = 0;
  }
  
  float[] attackSpd = 
  {
   1,//fist
   3,//bat
   2,//katana
   0,//chainsaw
  
  };
  
   float[] weaponRadius = 
  {
   90,//fist
   200,//bat
   200,//katana
   100,//chainsaw
  
  };
  
  public void drawWeapon(Joey joe){
    
    switch(currentWeapon){
      case 0:   PImage fist = loadImage("fist.png");
                image(fist,joe.pos.x+10,joe.pos.y+10); break;
      case 1:   PImage bat = loadImage("bat.png");
                image(bat,joe.pos.x+10,joe.pos.y+10); break;
      case 2:   PImage katana = loadImage("sword.png");
                image(katana,joe.pos.x+10,joe.pos.y+10); break;
      case 3:   PImage chainsaw = loadImage("chainsaw.png"); 
                image(chainsaw,joe.pos.x+10,joe.pos.y+10); break;
    }

  }
  
  
}
