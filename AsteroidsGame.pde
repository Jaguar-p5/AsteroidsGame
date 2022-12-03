ArrayList <Star> stars = new ArrayList <Star>();
Spaceship bob = new Spaceship();

public void setup() 
{
frameRate(100);
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


}



boolean[] keys = new boolean[222]; // 222 is the highest keyCode value i know

public void keyPressed(){keys[keyCode] = true;}
public void keyReleased() {keys[keyCode] = false;}

// True is pressed, False is released
public boolean getState(int keyCode) {
  
  return keys[keyCode];
}


