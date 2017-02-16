void setup(){
  size(700,700);
}


int shade = 0; //SHADE FOR ENTER BUTTON


void draw(){
  background(30,30,30);
  drawTitle();
  drawEnterButton(); 
}

void drawTitle(){
   textSize(50);
   fill(200,0,0);
   textAlign(CENTER);
   text("uDEA", width/2 ,200);
}

void drawEnterButton(){
  if (shade >= 255){
    shade = 0;
  }
  textSize(20);
  fill(shade, shade, shade);
  textAlign(CENTER);
  text("PRESS ENTER", width/2, 400);
  shade += 3;
}