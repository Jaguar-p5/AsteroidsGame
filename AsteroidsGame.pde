ArrayList <Star> stars = new ArrayList <Star>();
Spaceship bob = new Spaceship();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
public void setup() 
{
size(800, 800);
  for(int i = 0; i < 100; i ++){
    stars.add(new Star(Math.random()*width, Math.random()* height));
  
}
}
public void draw() 
{

   background(0);
      for(int i = 0; i < stars.size(); i++)
     stars.get(i).show();
   bob.readTurning();
   bob.readHyperspace();
   bob.move();
   bob.show();
   bob.readAcceleration();
   if (mousePressed == true)
     bullets.add(new EnemyPellet(bob));
   //sue.show();
   //sue.shoot();
   for(int i = bullets.size()-1; i >= 0; i--){
    bullets.get(i).move();
    bullets.get(i).show();
    bullets.get(i).detect(bob); 
     
   }

}



boolean[] keys = new boolean[222]; // 222 is the highest keyCode value i know

public void keyPressed(){keys[keyCode] = true;}
public void keyReleased() {keys[keyCode] = false;}

// True is pressed, False is released
public boolean getState(int keyCode) {
  
  return keys[keyCode];
}




class Bullet extends Floater{
 float lifeSpan, lifeTimer;
 boolean doesWarp;
 Bullet(Spaceship thisShip){
   lifeTimer = 0;
   myCenterX = thisShip.getX();
   myCenterY = thisShip.getY();
   myPointDirection = thisShip.getPoint();
   

   
 }
 Bullet(Gun theGun){
   lifeTimer = 0;
   myCenterX = theGun.getX();
   myCenterY = theGun.getY();
   myPointDirection = theGun.getPoint();
   
 }
 public void detect(Spaceship player){
  if(lifeTimer >= lifeSpan)
    bullets.remove(this);
  lifeTimer += 1; 
  if( abs((float)(player.getX() - myCenterX)) <= 10 && abs((float)(player.getY() - myCenterY)) <= 10)
    noLoop();
   
   
 }
   public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
    
    if(doesWarp == true){
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
  }
  }   
 

 
 public void show(){
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    stroke(222);
    fill(222);
    ellipse(0, 0, 9, 9);
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
 }
  
  
  
}



class EnemyPellet extends Bullet{
  EnemyPellet(Spaceship source){
   super(source);
   lifeSpan = 1111111;
   doesWarp = true;
   this.accelerate(6);
   this.move();
   this.move();
   this.accelerate(-2);
  }
  EnemyPellet(Gun theGun){
    super(theGun);
    lifeSpan = 200;
    doesWarp = true;
   this.accelerate(6);
   this.move();
   this.move();
   this.accelerate(-2);
  }
  
}


