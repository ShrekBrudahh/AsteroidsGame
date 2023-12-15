public class Bullet extends Floater{
  private int scaleFactor;
  public Bullet(Spaceship ship){
    corners = 4;
    xCorners = new int[]{3,3,-3,-3};
    yCorners = new int[]{1,-1,-1,1};
    myColor = color(255,0,0);
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myXspeed = ship.getSX();
    myYspeed = ship.getSY();
    myPointDirection = ship.mPD() + rand(0,0);
    scaleFactor = 2;
    for (int i = 0; i < corners; i++){
       xCorners[i] *= scaleFactor;
       yCorners[i] *= scaleFactor;
    }
    acc(6);
  }
  public void move ()   //move the floater in the current direction of travel
  {      
       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
  }   
}
