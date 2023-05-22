public class Children{
  int dmg;
  int sped = 3;
  PVector pos;

  public Children() {
    dmg = 10;

    switch((int)Math.random()*2){

        case 0: {pos = new PVector((float)Math.random()*width, 0.0);break;}


        case 1: {pos = new PVector((float)Math.random()*width, height);break;}

    }


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
