ArrayList <Star> stars = new ArrayList <Star>();
Spaceship tim = new Spaceship();


boolean[] keys = new boolean[222]; // 222 is the highest keyCode value i know

public void keyPressed(){keys[keyCode] = true;}
public void keyReleased(){keys[keyCode] = false;}

// True is pressed, False is released
public boolean getState(int keyCode) {
  return keys[keyCode];
}

Spaceship tim = new Spaceship();

ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();




void setup(){
  size(500, 500);
  for(int i = 0; i < 4 /*numAsteroids*/; i++){
   asteroids.add(new Asteroid(Math.random()*width, Math.random()*height, (float)Math.random()*PI*2, 2)); 
    
  }
  for(int i = 0; i < 100; i++){
  stars.add(new Star());
  }
  
}


void draw(){


  background(0);
  tim.readHyperspace();
  tim.readTurning();
  tim.readAcceleration();
  tim.move();
  tim.show();
  for(int i = 0; i < asteroids.size(); i++){
    
    asteroids.get(i).move();
    asteroids.get(i).turning();
    asteroids.get(i).show();
    if(colideCheck(asteroids.get(i), tim)){
    noLoop();
  for(int i = 0; i < 
  }
    
  }

  
}

