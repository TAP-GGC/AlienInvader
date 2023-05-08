
PImage img,imgAlien,imgAlien2,imgGun,imgGun2,startScreen,p2Wins,p1Wins;

float x,y,x2,y2,x3,y3;
float bx,by,bx2,by2;
float ex,ey,ex2,ey2;

int score = 0;
int score2 = 0;

boolean dPressed = false;
boolean aPressed = false;
boolean rPressed = false;
boolean lPressed = false;
boolean wPressed = false;
boolean uPressed = false;
boolean restartPressed = false;
boolean shoot = false;
boolean shoot2 = false;

int gameTime = 0;

int reload;

PFont font;

float speed;
float speed2;

boolean colliding;

Enemy [] enemies = new Enemy[16];
Enemy alien1 = new Enemy(100,100);Enemy alien2 = new Enemy(250,100);Enemy alien3 = new Enemy(400,100);Enemy alien4 = new Enemy(550,100);Enemy alien5 = new Enemy(700,100);

Enemy alien6 = new Enemy(100,300);Enemy alien7 = new Enemy(250,300);Enemy alien8 = new Enemy(400,300);Enemy alien9 = new Enemy(550,300);Enemy alien10 = new Enemy(700,300);

Enemy2 [] enemies2 = new Enemy2[16];
Enemy2 alien1b = new Enemy2(1150,100);Enemy2 alien2b = new Enemy2(1300,100);Enemy2 alien3b = new Enemy2(1450,100);Enemy2 alien4b = new Enemy2(1600,100);Enemy2 alien5b = new Enemy2(1750,100);

Enemy2 alien6b = new Enemy2(1150,300);Enemy2 alien7b = new Enemy2(1300,300);Enemy2 alien8b = new Enemy2(1450,300);Enemy2 alien9b = new Enemy2(1600,300);Enemy2 alien10b = new Enemy2(1750,300);



float step;
void setup()
{ 
  
  //screen size
  fullScreen();
  
  //all images used
  imgAlien = loadImage("alienSprite1.png");
  imgAlien2 = loadImage("alienSprite2.png");
  imgGun =loadImage("player1Ship.png");
  imgGun2 = loadImage("player2Ship.png");
  startScreen = loadImage("welcomescreenW.png");
  p1Wins= loadImage("p1Wins2.png");
  p2Wins= loadImage("p2Wins2.png");
  
  //player 1's starting position
  x=width/4;
  y=height/1.5;
  
  //player 2's starting position
  x2=width/1.5;
  y2=height/1.5;
  
  //bullet1 speed
  speed=40;
  bx = x;
  by = y;
  
  //bullet2 speed
  speed2=40;
  bx2 = x2;
  by2=y2;
  
  
  //enemy movement
  step = 5;
  ex=width/17;
  ey=height/9;
  
}


void draw(){
  
  //background
  background(0);
  //image(img,0,0,width,height);
  if(gameTime == 0){
  startGame();}
  else if(gameTime ==1){
    playingGame();
    
  }

 

} 

void startGame(){
    background(0);
    stroke(0);
    fill(255,255,255);
    image(startScreen,ex*4,ey,1000,1000);
   
}
void playingGame(){
  player1();
  player2();
  bullet1();
  bullet2();

//displays aliens for player 1
 alien1.display();alien2.display();alien3.display();alien4.display(); alien5.display();
 
 alien6.display();alien7.display(); alien8.display();alien9.display();alien10.display();
 

 
//updates the player 1's score and position
 alien1.update();alien2.update();alien3.update();alien4.update();alien5.update();
 
 alien6.update();alien7.update();alien8.update();alien9.update();alien10.update();
 


//displays player 2's aliens
 alien1b.display();alien2b.display();alien3b.display();alien4b.display();alien5b.display();
 
 alien6b.display();alien7b.display();alien8b.display();alien9b.display();alien10b.display();
 

 
//updates the player 2's score and position
 alien1b.update();alien2b.update();alien3b.update();alien4b.update();alien5b.update();
 
 alien6b.update();alien7b.update();alien8b.update();alien9b.update();alien10b.update();
 
 
  drawText();
  
  if(score == 1000 || score2==1000 && restartPressed == true){
    
    score =0;
    score2=0;
     shoot=true;
     shoot2=true;
     
 
  }
}




void mousePressed(){
  if(gameTime==0){
    playingGame();
    gameTime=1;
  }
}
void mouseReleased(){
  if(gameTime==1){
    playingGame();
  }
}


void drawText(){
  //player 1 and player 2 divider
  stroke(255);
  strokeWeight(5);
 line(displayHeight-120,0,displayHeight-120,5000);
  
  //Score and lives for player 1
 textSize(50);
 fill(255,255,255);

 text("Score: " + score,width/17,height/1.1);
  
  //Score and lives for player 2
  textSize(50);
  fill(255,255,255);
 text("Score: " + score2,width*.60,height/1.1);
 
 //adds a pop up that displays that player 1 won
  if(score == 1000 && score2 != 1000){
    //rect(width/3.4,height/3,700,300);
    fill(255,255,255);
    textSize(100);
    fill(0);
    image(p1Wins,width/6.5,height/3.5);
   
  }
  
  //adds a pop up that displays that player 2 won
  if(score2 == 1000 && score != 1000){
    fill(255,255,255);
    textSize(100);
    fill(0);
    image(p2Wins,width/6.5,height/3.5);
  
  }
 
}

void player1(){
  //player 1 object
  stroke(0);
  fill(255,255,255);
  image(imgGun,x,y,150,100);
  
  
  //player 1's movement
  if(aPressed && x>=displayWidth*.03){
    x=x-15;
  }
  else if(dPressed && x<=displayWidth*.40){
    x=x+15;
  }

  
}

void player2(){
  //player 2 object
  stroke(0);
  fill(255,255,255);
  image(imgGun2,x2,y2,150,100);
  //rect(x2,y2,60,60);
  
  
  //player 2's movement
  if(lPressed && x2>=displayWidth*.53){
    x2=x2-15;
  }
  else if(rPressed && x2<=displayWidth*.90){
    x2=x2+15;
  }
}
  
  void bullet1(){
  //Starting location and shape of the bullet for player 1 
  stroke(255);
  fill(255,255,255);
  rect(bx+75,by+30,2,5);

   //boolean to see if w was pressed
  if(wPressed && score!=1000 && score2!=1000){
    shoot = true;
    
  }
  //if that w was pressed the bullet is released
  if(shoot){
    by=by-speed*.3;
  }
  //reloading
  if(by<=80){
    by=y;
    bx=x;
    shoot = false;
  }
//keeps bullet with the player
  if(aPressed && bx>=displayWidth*.03 && by>=700){
    bx=bx-15;
  }
  else if(dPressed && bx<=displayWidth*.40 && by>=700){
    bx=bx+15;
  }

  
 }
 
 
  void bullet2(){
   //Starting location and shape of the bullet for player 2 
  stroke(255);
  fill(255,255,255);
  rect(bx2+75,by2+30,2,5);
  //boolean to see if the up arrow was pressed

  if(uPressed && score!=1000 && score2!=1000){
    shoot2 = true;
  }
   //if that up arrow was pressed the bullet is released
  if(shoot2){
    by2=by2-speed2*.3;
  }
  //reloading
  if(by2<=20){
    by2=y2;
    bx2=x2;
    shoot2 = false;
  }
  //keeps bullet with the player when not being fired
  if(lPressed && bx2>=displayWidth*.53 && by2>=700){
    bx2=bx2-15;
  }
  else if(rPressed && bx2<=displayWidth*.90 && by2>=700){
    bx2=bx2+15;
  }
  }
  
//Enemy
class Enemy{
  
  float ex, ey;
  float alienSpeed1x, alienSpeed2x,alienSpeed1y, alienSpeed2y;
 
 Enemy(float a, float b){ex=a;ey=b;}
 
  void display(){
    stroke(0);
    fill(255,255,255);
    image(imgAlien,ex,ey,100,100);
    
   alienSpeed1x = random(5);
   alienSpeed2x = random(5);
   alienSpeed1y = random(5);
   alienSpeed2y = random(5);
  
   //moves alien horizontally
   ex=ex+alienSpeed1x;
   if(ex>800) ex=alienSpeed1x=-alienSpeed1x;
   //moves alien vertically
   ey=ey+alienSpeed1y;
   if(ey>400) ey=alienSpeed1y=-alienSpeed1y;
   //ey=ey+alienSpeed1y; if(ey>5000 && ey<50) alienSpeed1y=-alienSpeed1y;
  }
  
  //updates to tell if an enemy was hit and adds to score
   void update(){
    if((by<=ey+8 && by>=ey-8) && (bx<=ex+80 && bx>=ex-80)){
    ey=ey-40000;
    by=y;
    bx=x;
    shoot = false;
    score=score+100;
     
    }

   }
}


class Enemy2{
  
   float ex2, ey2;
  float alienSpeed1xy,alienSpeed1yy;
 Enemy2(int a, int b){ex2=a;ey2=b;}
 
  void display(){
    stroke(0);
    fill(255,255,255);
    image(imgAlien2,ex2,ey2,100,100);
    
   alienSpeed1xy = random(5);
   alienSpeed1yy = random(5);
  
   
   //moves alien horizontally
   ex2=ex2+alienSpeed1xy;
   if(ex2>1800){ ex2=alienSpeed1xy=-alienSpeed1xy; ex2=1000;}
   //moves alien vertically
   ey2=ey2+alienSpeed1yy;
   if(ey2>400) ey2=alienSpeed1yy=-alienSpeed1yy;
   //ey=ey+alienSpeed1y; if(ey>5000 && ey<50) alienSpeed1y=-alienSpeed1y;
  }
  
  
   void update(){
     if((by2<=ey2+8 && by2>=ey2-8) && (bx2<=ex2+80 && bx2>=ex2-80)){
    ey2=ey2-40000;
    by2=y2;
    bx2=x2;
    shoot2 = false;
    score2=score2+100;
    }
   }
}




void keyPressed(){
  //player 1's movement
  if(key=='a')
  {
    aPressed = true;
   
  }
  else if(key=='d')
  {
   dPressed = true;
  }
  
  //player 2's movement
  if(keyCode==LEFT)
  {
    lPressed = true;
   
  }
  else if(keyCode==RIGHT)
  {
   rPressed = true;
  }
  
  //bullet for player 1
  if (key =='w'){
    wPressed = true;
  }
  
  //bullet for player 2
  if (keyCode == UP){
      uPressed = true;
  }
  if(key == 'r'){
    restartPressed = true;
 
  }
 
}

void keyReleased(){
  
  //player 1's movement
  if(key=='a')
  {
    aPressed = false;
   
  }
  else if(key=='d')
  {
   dPressed = false;
  }
  //player 2's movement
  if(keyCode==LEFT)
  {
    lPressed = false;
   
  }
  else if(keyCode==RIGHT)
  {
   rPressed = false;
  }
  
  if (key =='w'){
    wPressed = false;
  }
  
  if (keyCode == UP){
      uPressed = false;
  }
  if(key == 'r'){
    restartPressed = false;
   
  }
}
