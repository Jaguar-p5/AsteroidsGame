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
  frameRate(60);
  size(500, 500);
  for(int i = 0; i < 6 /*numAsteroids*/; i++){
   asteroids.add(new Asteroid(Math.random()*width, Math.random()*height, (float)Math.random()*PI*2, 2)); 
    
  }
  for(int i = 0; i < 100; i++){
  stars.add(new Star(Math.random()*width, Math.random*height);
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
    asteroids.remove(i);
    i--;
    }
  for(int i = 0; i < 100; i++){
  stars.get(i).show();
  }

  
}





// What follows is the code i used for collison handling
class Vector{
 private float x, y;
 Vector(double x_, double y_){
   x = (float)x_;
   y = (float)y_;

 }
 
  float getMag(){
    return sqrt(x * x + y*y);
  }
 void show(){
  System.out.println(" x is " + x + "   y is " + y);
 }
 float getX(){
   return x;
 }
 float getY(){
   return y;
 }
}

public Vector VectorAtoB(Vector a, Vector b){
  double xAmount = b.getX() - a.getX();
  double yAmount = b.getY() - a.getY();
  return new Vector(xAmount, yAmount);
  
}

class VectorCollection{
  Vector center;
  Vector[] cToVert;
  Vector[] vToVaxiis;
  VectorCollection(Floater theFloater){
    center = new Vector(theFloater.getX(), theFloater.getY());
    cToVert = new Vector[theFloater.getCorners()];
    for(int i = 0; i < theFloater.getCorners(); i++){
      cToVert[i] = rotateVertex(theFloater, i, theFloater.getPoint());
    }
   vToVaxiis = new Vector[theFloater.getCorners()];
   for(int i = 0; i < vToVaxiis.length; i++){
     if(i != vToVaxiis.length-1){
      vToVaxiis[i] = (VectorAtoB( cToVert[i], cToVert[i+1]));
       
     }
     else
       vToVaxiis[i] = VectorAtoB(cToVert[i], cToVert[0]);
     
   }
 }
 public int getSize(){
   return cToVert.length;
 }
 public Vector[] getAxiis(){
   return vToVaxiis;
 }
 public void showStuff(){
   System.out.println("Center at:   " + center.getX() + ", "+ center.getY());
  
  
  
}
}


boolean checkAxis(VectorCollection floater1, VectorCollection floater2, Vector testAxis){
  float max1 = maxMinProject(floater1, testAxis)[0];
  float max2 = maxMinProject(floater2, testAxis)[0];
  float min1 = maxMinProject(floater1, testAxis)[1];
  float min2 = maxMinProject(floater2, testAxis)[1];
  Vector centerDeltaVector = VectorAtoB(floater1.center, floater2.center); // name is misleading, should re write
  float dist = (projectAonB(centerDeltaVector, testAxis));
  min2 += dist;
  max2 += dist;

  return((min2 < min1 && max2 > max1 )|| min2 < max1 && max2 > min1);
}




boolean colideCheck(Floater a, Floater b){
VectorCollection aCollection = new VectorCollection(a);
VectorCollection bCollection = new VectorCollection(b);
Vector[] axisArray = new Vector[a.getCorners() + b.getCorners()];
int k = 0;
for(int i = 0; i < aCollection.getSize(); i++){
  axisArray[k] = aCollection.getAxiis()[i];
  k++;
}
for(int i = 0; i < bCollection.getSize(); i++){
    axisArray[k] = bCollection.getAxiis()[i];
    k++;
}

for(int i = 0; i < axisArray.length; i++){
 if(checkAxis(aCollection, bCollection, axisArray[i])) 
 ;
 else
     return false;
}
return true;
}


float[] maxMinProject(VectorCollection theFloater, Vector axis){
  float max = 0;
  float min = projectAonB(theFloater.cToVert[0], axis);
  int p = theFloater.cToVert.length;
  for(int i = 1; i < p; i++){
    if(projectAonB(theFloater.cToVert[i], axis)  < min)
      min = projectAonB(theFloater.cToVert[i], axis);
  }
  for(int i = 0; i < p; i++){
   if(projectAonB(theFloater.cToVert[i], axis)  > max)
     max = projectAonB(theFloater.cToVert[i], axis);
 
  }
  float[] ans = {max, min};
  return ans;
 
}


float projectAonB(Vector a, Vector b){
  // a will be the vertex, b is the unit vector of the line of comparison
  float dotProduct = a.x * b.x + a.y * b.y;
  float ans = dotProduct/b.getMag();
  return (ans);
}

public Vector rotateVertex(Floater q, int vertexNum, double theta){
  double xVal = q.getXcorners()[vertexNum];
  double yVal = q.getYcorners()[vertexNum];

  float dRadians = (float)(theta*(Math.PI/180));
  double newX = xVal*cos(dRadians) - yVal*sin(dRadians);
  double newY = yVal*cos(dRadians) + xVal*sin(dRadians);
  return new Vector(newX , newY );
}











