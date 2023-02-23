private double fractionLength = .8; 
private int smallestBranch = 50; 
private double branchAngle = .5;  
public void setup() 
{   
  size(800, 700);
  for (int i = 0; i < snowfall.length; i++) {
    snowfall[i] = new Snow();
  }

} 
public void draw() 
{
  background(208, 248, 255); 
  strokeWeight(3);
  stroke(213, 213, 213);   
  line(400,700,400,550);  
  drawBranches(400,550,100,3*Math.PI/2);
  stroke(233, 204, 184);
  line(660, 620, 630, 600);
  line(740, 630, 770, 590);
  fill(255);
  stroke(255);
  ellipse(700, 650, 100, 100);
  ellipse(700, 570, 80, 80);
  fill(0);
  ellipse(700, 650, 10, 10);
  ellipse(700, 670, 10, 10);
  
  
  for (int i = 0; i < snowfall.length; i++) {
    snowfall[i].show();
    snowfall[i].fall();
  }
  if(mousePressed) {
   redraw();
   background(203, 227, 250);
   fill(255, 253, 205); 
   ellipse(100, 100, 50, 50);
   setBranch(10);
   strokeWeight(3);
   stroke(208, 255, 197);   
   line(400,700,400,550); 
   drawBranches(400,550,100,3*Math.PI/2);
   setBranch(50);
 
  }
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
 double angle1 = angle + branchAngle;
 double angle2 = angle - branchAngle;
 int endX1 = (int)(branchLength*Math.cos(angle1) + x);
 int endY1 = (int)(branchLength*Math.sin(angle1) + y);
 int endX2 = (int)(branchLength*Math.cos(angle2) + x);
 int endY2 = (int)(branchLength*Math.sin(angle2) + y);
 line(x, y, endX1, endY1);
 line(x, y, endX2, endY2);
                         
 if(branchLength > smallestBranch) {
   drawBranches(endX1, endY1, branchLength*fractionLength, angle1);
   drawBranches(endX2, endY2, branchLength*fractionLength, angle2); 
}
 if(mousePressed) {
  stroke(232, 222, 255);
  ellipse(endX1, endY2, 5, 5);
  stroke(255, 232, 222);
  ellipse(endX2, endY2, 4, 4); 
  stroke(208, 255, 197);   
}
}

public void setBranch(int n) {
  smallestBranch = n;
}

public int getBranch() {
  return smallestBranch;
}

public void keyPressed(){
  if(keyPressed) {
  if(key == ' ') {
    setBranch(40);
  }
  }
 if(key == 's') {
    setBranch(30);
    }

}
