public class Jinyu{
  int dmg;
  int sped = 3;
  PVector pos;

  public Jinyu() {
    dmg = 10;

    switch((int)Math.random()*2){

        case 0: {pos = new PVector((float)Math.random()*width, 0.0);break;}


        case 1: {pos = new PVector((float)Math.random()*width, height);break;}

    }


  }
public int checkTouch(Joey joe){
    if(Math.abs(joe.pos.x-pos.x)<=10&&Math.abs(joe.pos.y-pos.y)<=10){
      joe.HP-=dmg;
      return dmg;
    }
    return 0;
  
  }

  
  
  
public boolean checkDeath(PVector atkPos,int radius){
    return (
      Math.sqrt(Math.abs(pos.x-atkPos.x)*Math.abs(pos.x-atkPos.x)+Math.abs(pos.y-atkPos.y)*Math.abs(pos.y-atkPos.y))<=radius

    );
  }
  
  
  
  public void move(PVector joe){
    float xDist = joe.x-pos.x;
    float yDist = joe.y-pos.y;
    
    double hyp = Math.hypot((double)Math.abs(xDist),(double)Math.abs(yDist));
    
    double ratio = hyp/sped;
    
    double actualX = xDist/ratio;
    double actualY = yDist/ratio;
    
    if(Math.abs(pos.x-joe.x)>2&&Math.abs(pos.y-joe.y)>2)pos.add(new PVector((float)actualX,(float)actualY));
   
    
    
  }
    
}
