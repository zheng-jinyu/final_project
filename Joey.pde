public class Joey{
  int HP;
  int money;
  PVector pos;
  int sped = 5;
  public Joey(){
    HP = 1000;
    money = 69;
    pos = new PVector(960,540);
  }
  
  public double move(PVector dir){
    float xDist = dir.x-pos.x;
    float yDist = dir.y-pos.y;
    
    double hyp = Math.hypot((double)Math.abs(xDist),(double)Math.abs(yDist));
    
    double ratio = hyp/sped;
    
    double actualX = xDist/ratio;
    double actualY = yDist/ratio;
    
    if(Math.abs(pos.x-dir.x)>2&&Math.abs(pos.y-dir.y)>2)pos.add(new PVector((float)actualX,(float)actualY));
    
    
    return Math.atan(actualY/actualX);
    
  }
  
}
