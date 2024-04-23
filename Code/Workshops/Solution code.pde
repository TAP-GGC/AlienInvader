//This is how you create a comment. Any text between // and the end of the line is ignored by the program. 

int x = 250, y=250; 
boolean leftPressed, rightPressed; 

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
  
}

void keyPressed()
{
  if (keyCode == LEFT){
    leftPressed = true; 
  }
  
  if (keyCode == RIGHT){
    rightPressed = true; 
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
}
