class Asteroid extends Floater{
  protected double mySize;
  public Asteroid(double xPos, double yPos, float theta, double speedMag, double scalar){
    mySize = scalar;
    corners = 4;
    myColor = 111;
    myCenterX = xPos;
    myCenterY = yPos;
    myXspeed = speedMag*cos(theta);
    myYspeed = speedMag*sin(theta);
    myPointDirection = 0;
    xCorners = new int[4];
    xCorners[0] = (int)(-35*scalar);
    xCorners[1] = (int)(35*scalar);
    xCorners[2] =  (int)(35*scalar);
    xCorners[3] = (int)(-35*scalar);
    yCorners = new int[4];
    yCorners[0] = (int)(35*scalar);
    yCorners[1] = (int)(35*scalar);
    yCorners[2] = (int)(-35*scalar);
    yCorners[3] = (int)(-35*scalar);
 }
  public double getSize(){return mySize;}
  public void turning(){
   turn(1);
    
  }
  
}
