Snow[] snowfall  = new Snow [1000];

class Snow 
{
  int myX;
  float myY;
  float mySpeed;
  int mySize;
  int myColor;
  
  Snow() {
    myX = (int)(Math.random()*1000 - 200);
    myY = (int)(Math.random()*800 - 100);
    mySize = (int)(Math.random()*400);
    mySpeed = mySize/600.0;
    myColor = color(255);
  }
  void fall() {
    myX = myX + (int)(Math.random()*3)-1;
    myY = myY + mySpeed;
    if (myY < -100) {
      myY = 500; }
  }
  void show() {
    fill(myColor);
    stroke(myColor);
    ellipse(myX, myY, 5, 5);
  }
}
