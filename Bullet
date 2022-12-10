class Bullet extends Floater{
  protected int lifeTime;
  protected int lifeTracker;
  protected int diameter;
  public Bullet(Floater source, int life, double offsetAngle){
  lifeTime = life;
  lifeTracker = 0;
  diameter = 9;
  myCenterX = source.getX();
  myCenterY = source.getY(); 
  myPointDirection = source.getPoint() + offsetAngle;
  accelerate(4);
  this.move();
  this.move();
  this.move();
  this.move();
  this.move();
  this.move(); 
 }
 
 void show(){
  fill(255); 
  ellipse((float)myCenterX, (float)myCenterY, diameter, diameter); 
 }
 void checkExpire(){
    lifeTracker ++; 
  if(lifeTracker == lifeTime)
    bullets.remove(this); 
 }
 float getDi(){
   return diameter;
 }
  
  
}
