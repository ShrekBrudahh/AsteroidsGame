Spaceship[] ships;
Star[] star ;
ArrayList <Asteroid> asteroids;

boolean w = false;
boolean a = false;
boolean s = false;
boolean d = false;
boolean h = false;

double accel = 0.1;
double rotInc = 2;
int tAi = 0;
int initAmtOfAsteroids = 10;

public void setup(){
  size(700,700);
  star = new Star[100];
  ships = new Spaceship[1];
  asteroids = new ArrayList <Asteroid>();
  for (int i = 0; i < star.length; i++){
    star[i] = new Star();
  }
  for (int i = 0; i < ships.length; i++){
    ships[i] = new Spaceship();
  }
  ships[0].setPos(width/2.0,height/2.0);
  
  
  for (int i = 0; i < initAmtOfAsteroids; i++){
    asteroids.add(new Asteroid());
  }
  
  for (int i = 0; i < asteroids.size(); i++){
    asteroids.get(i).acc((10.0 - asteroids.get(i).getSF())/10.0 * 3);
  }
  
}
public void draw(){
  background(0);
  for (int i = 0; i < asteroids.size(); i++){
    Asteroid local = asteroids.get(i);
    double hitRadius = local.getSF()/10.0 * 100;
    local.move();
    local.show();
    if (dist((float)local.getX(),(float)local.getY(),(float)ships[0].getX(),(float)ships[0].getY()) <= hitRadius){
      asteroids.remove(i);
    }
  }
  for (int i = 0; i < star.length; i++){
    star[i].show();
  }
  if (w){accelships('w');}
  if (a){turnships('a');}
  if (s){accelships('s');}
  if (d){turnships('d');}
  if (h){ships[0].hyperspace(); h = false;}
  
 for (int i = 0; i < ships.length; i++){
    ships[i].move();
    ships[i].show();
  }
  
}

public void keyPressed(){
  if (key == 'w'){
    w = true;
  }else if(key == 'a'){
    a = true;
  }else if(key == 's'){
    s = true;
  }else if(key == 'd'){
    d = true;
  }else if(key == 'h'){
    h = true;
  }
}

public void keyReleased(){
  if (key == 'w'){
    w = false;
  }else if(key == 'a'){
    a = false;
  }else if(key == 's'){
    s = false;
  }else if(key == 'd'){
    d = false;
  }
}

public void accelships(char keY){
  for (int i = 0; i < ships.length; i++){
    if (keY == 'w'){
      ships[i].acc(accel);
    }else{
     ships[i].acc(-accel);
    }
  }
}

public void turnships(char keY){
  for (int i = 0; i < ships.length; i++){
    if (keY == 'd'){
      ships[i].turn(rotInc);
    }else{
      ships[i].turn(-rotInc);
    }
  }
}

public float clamp(float x, float min, float max){
  if (x < min){
    x = min;
  }else if (x > max){
    x = max;
  }
  return x;
}

public int rand(int min, int max){
  return min + (int)(Math.random()*(1+(max-min)));
}

