public class Children{
  int dmg;
  int sped = 3;
  PVector pos;

  public Children() {
    dmg = 10;

    switch((int)Math.random()*2){

        case 0: pos = new PVector(Math.random()*width, 0);


        case 1: pos = new PVector(Math.random()*width, height);

    }


  }

  public void move(PVector joe.pos){
    float xDist = joe.pos.x-pos.x;
    float yDist = joe.pos.y-pos.y;
    
    double hyp = Math.hypot((double)Math.abs(xDist),(double)Math.abs(yDist));
    
    double ratio = hyp/sped;
    
    double actualX = xDist/ratio;
    double actualY = yDist/ratio;
    
    if(Math.abs(pos.x-joe.pos.x)>2&&Math.abs(pos.y-joe.pos.y)>2)pos.add(new PVector((float)actualX,(float)actualY));
    
    
  }
    
}
