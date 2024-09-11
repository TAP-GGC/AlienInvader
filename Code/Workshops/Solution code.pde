//This is how you create a comment. Any text between // and the end of the line is ignored by the program. 

int x = 250, y=250; 
boolean leftPressed, rightPressed; 
boolean upPressed, downPressed; 

void setup()
{
  size(500,500);
}

void draw()
{
  background(152,190,100);
  square(x,y,50);
  fill(100,10,100);
 
  
  if (leftPressed && x>=30){
    x=x-10; 
  }
  if (rightPressed && x<=420){
    x=x+10; 
  }
  if (upPressed && y>=30){
    y=y-10; 
  }
  if (downPressed && y<=420){
    y=y+10; 
  }
  
}

void keyPressed()
{
  if (keyCode == LEFT){
    leftPressed = true; 
  }
  
  if (keyCode == RIGHT){
    rightPressed = true; 
  }
  
  if (keyCode == UP){
    upPressed = true; 
  }
  
  if (keyCode == DOWN){
    downPressed = true; 
  }
}

void keyReleased()
{
  if (keyCode == LEFT){
    leftPressed=false; 
  } 
  
  if (keyCode == RIGHT){
    rightPressed = false; 
  }
  
  if (keyCode == UP){
    upPressed = false; 
  }
  
  if (keyCode == DOWN){
    downPressed = false; 
  }
}
