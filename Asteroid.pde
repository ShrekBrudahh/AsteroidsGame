public class Asteroid extends Floater{
  private double dRot;
  private int scaleFactor;
  Asteroid(){
   
    if (rand(1,2) == 1){
      corners = 6;
      xCorners = new int[]{4,2,-3,-4,-3,0,2};
      yCorners = new int[]{-3,-6,-3,-1,3,5,4};
    }else{
      corners = 6;
      xCorners = new int[]{1,3,2,-1,-4,-3};
      yCorners = new int[]{-2,1,3,4,2,-4};
    }
    scaleFactor = rand(3,8);
    
    for (int i = 0; i < corners; i++){
       xCorners[i] *= scaleFactor;
       yCorners[i] *= scaleFactor;
    }
    
    dRot = ((10 - (float)scaleFactor)/10.0 * 5) * rand(-1,1);
    
    
    myColor = color(255);
    myCenterX = rand(0,width);
    myCenterY = rand(0,height);
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = rand(0,360);
    
  }
  public void move(){
     //change the x and y coordinates by myXspeed and myYspeed      
    myCenterX += myXspeed;    
    myCenterY += myYspeed;    

    //wrap around screen    
    if(myCenterX >width)
    {    
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {    
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }
   
    else if (myCenterY < 0)
    {    
      myCenterY = height;    
    }  
    myPointDirection += dRot;
  }
  
  public void show ()  //Draws the floater at the current position  
  {             
    stroke(255);
    fill(0);
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    noStroke();
  }   
  
  public int getSF(){
    return scaleFactor;
  }
  public void setPos(double xp, double yp){
     myCenterX = (int)xp;
     myCenterY = (int)yp;
  }
}
