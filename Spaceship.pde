class Spaceship extends Floater {   
   public Spaceship(){
     corners = 9;
     xCorners = new int[]{5,0,-2,-2,0,5,1,0,1};
     yCorners = new int[]{-1,-2,-1,1,2,1,1,0,-1};
     for (int i = 0; i < corners; i++){
       xCorners[i] *= 10;
       yCorners[i] *= 10;
     }
     myColor = color(255);
     myCenterX = 0;
     myCenterY = 0;
     myXspeed = 0;
     myYspeed = 0;
     myPointDirection = 0;
   }
   public void hyperspace(){
     myXspeed = 0;
     myYspeed = 0;
     myCenterX = rand(0, width);
     myCenterY = rand(0, height);
     myPointDirection = rand(0, 360);
   }
   public void setPos(double xp, double yp){
     myCenterX = (int)xp;
     myCenterY = (int)yp;
   }
   public void setSpeed(int ldx, int ldy){
     myXspeed = ldx;
     myYspeed = ldy;
   }
   public double getSpeed(){
     return Math.sqrt(myXspeed*myXspeed + myYspeed*myYspeed);
   }
}
