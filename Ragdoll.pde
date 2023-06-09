public class Ragdoll{
  int framesSinceSpawn;
  PVector pos;
  public Ragdoll(){
    framesSinceSpawn = 0;
  }
  
  public void tick(){
    framesSinceSpawn++;
  }
  
  public boolean drawSelf(){
    if (framesSinceSpawn>=500){
      return true;
    }
    PImage body = loadImage("ded.png");
    image(body,pos.x,pos.y);
    return false;
  }
}
