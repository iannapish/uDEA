class Fireball{
  float x, y;
  float vectorX, vectorY;
  float angle;
  float speed = 1;
  
  Fireball(float x, float y){
    this.x = x;
    this.y = y;
    angle = atan2((random(0,height) - y),(random(0,width) - x));
    vectorX = speed*(5*cos(angle));
    vectorY = speed*(5*sin(angle));
  }
  
  void drawFireball(){
    x += vectorX;
    y += vectorY;
    fill(#F56A19);
    ellipse(x,y,10,10);
  }
  
}

ArrayList<Fireball> fireball = new ArrayList<Fireball>();
int numFireballs = 0;
int fireTimer = 0;

float playerX = 300;
float playerY = 300;

void setup(){
  size(600,600);
}

void draw(){
  background(80);
  
  //TEMPORARY CHARACTER
  fill(#F5DF19);
  rect(playerX, playerY, 30,60);
  
  update();
  render();
  
}

void update(){
  Fireball temp;
  
  //CREATES NEW FIREBALL IF LESS THAN 5 FIREBALLS ON SCREEN
  if (fireTimer == 100){
    if( numFireballs < 5){
      fireball.add(new Fireball(playerX, playerY));
      numFireballs++;
    }
    fireTimer = 0;
  }
  fireTimer += 4;
  
  //CHECKS TO SEE IF ANY FIREBALLS ARE OFFSCREEN THEN DELETES IF TRUE
  for (int i = 0; i < fireball.size(); i++){
    temp = fireball.get(i);
    
    if ((temp.x < 0) || (temp.x > width)){
    fireball.remove(i);
    numFireballs--;
    }
    
    if ((temp.y < 0) || (temp.y > height)){
    fireball.remove(i);
    numFireballs--;
    }
  }
}

void render(){
  Fireball temp;
  
  for (int i = 0; i < fireball.size(); i++){
    temp = fireball.get(i);
    temp.drawFireball();
    
    println(numFireballs);
  }
  
}

//ONLY FIRES ONE FIREBALL FIX LATER


/* 
void checkFireballOffscreen(){
  
 Fireball temp;
    
 for (int i = 0; i < fireball.size(); i++){
    temp = fireball.get(i);
    
    if ((temp.x < 0) || (temp.x > width)){
    fireball.remove(i);
    numFireballs--;
    }
    
    if ((temp.y < 0) || (temp.y > height)){
    fireball.remove(i);
    numFireballs--;
    }
  }
}


//NOT USING ATM
void createFireball(int fireTimer){
  if (fireTimer == 100){
    if( numFireballs < 5){
      fireball.add(new Fireball(playerX, playerY));
      numFireballs++;
    }
    fireTimer = 0;
  }
}

*/