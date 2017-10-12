float X1, X2;
float Y1, Y2;  
float Speed; 
float YMove; 

void setup()
{
  //player = new Player();
  size(600, 300);
  colorMode(RGB, 100);
  background(100);
  rectMode(CENTER);
  frameRate(30);
  X1 = 0;
  Y1 = 290;
  Speed = 3;
  X2 = 10;
  Y2 = 280;
}

void draw()
{
  background(100);
  X1 = X1 + Speed;
  X2 = X2 + Speed;
  fill(0);
  rect(X1, Y1, 10, 10);
  rect(X2, Y2, 10, 10);
}