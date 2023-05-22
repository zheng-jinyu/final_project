public class Weapon{
  int currentWeapon;
  /*
  0 = fist
  1 = bat
  2 = katana
  3 = chainsaw
  4 = AK47
  5 = rocket Launcher??
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
   0.1//AK47
  
  };
  
  public void drawWeapon(Joey joe){
    switch(currentWeapon){
      
    }
    rect(joe.pos.x+10,joe.pos.y+10,10,10);
  }
  
  
}
