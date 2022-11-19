ArrayList <Star> stars = new ArrayList <Star>();
Spaceship bob = new Spaceship();
Monster sue = new Monster();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
public void setup() 
{
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

