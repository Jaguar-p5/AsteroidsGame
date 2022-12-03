class Asteroid extends Floater{

  public Asteroid(double xPos, double yPos, float theta, double speedMag){
    corners = 4;
    myColor = 111;
    myCenterX = xPos;
    myCenterY = yPos;
    myXspeed = speedMag*cos(theta);
    myYspeed = speedMag*sin(theta);
    myPointDirection = 0;
    xCorners = new int[4];
    xCorners[0] = -35;
    xCorners[1] = 35;
    xCorners[2] =  35;
    xCorners[3] = -35;
    yCorners = new int[4];
    yCorners[0] = 35;
    yCorners[1] = 35;
    yCorners[2] = -35;
    yCorners[3] = -35;
 }
  public void turning(){
   turn(1);
    
  }
  
}
