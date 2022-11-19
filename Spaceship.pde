class Spaceship extends Floater  
{   
private int iFrames;
private int hyperBuffer;
  double speedCap = 2;
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
  public double getPoint(){
    return myPointDirection;
  }
  public Spaceship()
  {  
    iFrames = 0;
    hyperBuffer = 0;
    corners = 3;
    myColor = 111;
    myCenterX = 200;
    myCenterY = 200;
    myXspeed = 0.0;
    myYspeed = 0.0;
    myPointDirection = 0;
    xCorners = new int[3];
    xCorners[0] = 30;
    xCorners[1] = -20;
    xCorners[2] =  -20;
    yCorners = new int[3];
    yCorners[0] = 0;
    yCorners[1] = 15;
    yCorners[2] = -15;
    
  }
  public void hyperSpace(){
    myColor = color(  (int)(Math.random() * 255), (int)(Math.random() * 255),  (int)(Math.random() * 255) );
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*height;
    myPointDirection = 360 * Math.random();
    iFrames = 100;
    
    
    
  }
  public void kill(){
  if(iFrames == 0)
  noLoop();
  }
  public void show(){
    if(iFrames > 0)
     iFrames--;
   
    fill(myColor);   
    stroke(myColor);    
    
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
    stroke(0);
    ellipse(0, 0, 10, 10);
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
 }
  public void readTurning()
  {
    if(getState(65))
      turn(-4);
    if(getState(68))
      turn(4);
  }
  public void readHyperspace(){
    if(getState(32) && hyperBuffer >=10){
      hyperSpace();
      hyperBuffer = 0;
    }
    hyperBuffer++;
  }
  public void readAcceleration()
  {
    if(getState(87)) 
        accelerate(0.65);
    if(getState(83))
      accelerate(-0.65);
    double mag = sqrt((float)(myXspeed*myXspeed + myYspeed*myYspeed)); 
    double cos = myXspeed/mag;
    double sin = myYspeed/mag;
    if(mag != 0){
    myXspeed = (mag*0.99 - 0.02)*cos;
    myYspeed = (mag*0.99 -0.02)*sin;
  }
  }
}
