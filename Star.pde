class Star extends Floater//note that this class does NOT extend Floater
{
  void show(){
   fill(55);
   stroke(0);
   ellipse((float)myCenterX, (float)myCenterY, 5, 5);
   }
  public Star(double x, double y){
  myCenterX = x;
  myCenterY = y;
  }
}
