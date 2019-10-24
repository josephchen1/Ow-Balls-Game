class Circle {
  private float xCenter;
  private float yCenter;
  private int radius;
  private float xVelocity;
  private float yVelocity;
  private float mouseRadius = 250;
  
  //constructor
  public Circle (float x, float y, int r, float dx, float dy) {
    xCenter = x;
    yCenter = y;
    radius = r;
    xVelocity = dx;
    yVelocity = dy;
  }
  
  //checks if a circle overlaps another
  public boolean overlapping(Circle other) {
      float dist = dist(xCenter, yCenter, other.xCenter, other.yCenter);
      if (dist < radius + other.radius) {
        return true;
      }
      else {
        return false;
    }
  }
 
 //displays text on circles and changes color to show text when circles overlap
 public void ow(Circle other){
   if (overlapping(other)==true) {
     textSize(10);
     text("OW", xCenter-9, yCenter+3); 
     fill(255, 255, 255);
   }
 }
  
 //allows circles to move 
 public void move(){
   xCenter += xVelocity;
    yCenter += yVelocity;
  }

  //allows circles to bounce off walls or constraints
  public void bounceWall() {
    if (xCenter >= width-radius || xCenter <= radius) {
      xVelocity = xVelocity * (-1);
    }
    if (yCenter >= (height-radius) || yCenter <= radius) {
      yVelocity = yVelocity * (-1);
    }
  }
  
  //allows mouse left click to attract circles within the specified radius
  public void clickity() {
    if (mousePressed == true) {
      float xDiff = xCenter - mouseX;
      float yDiff = yCenter - mouseY;
      float distance = sqrt(xDiff*xDiff+yDiff*yDiff);
      if(distance < mouseRadius) { 
         float angle = atan2(yDiff,xDiff);
         xVelocity -= cos(angle);
         yVelocity -= sin(angle);
       }
    }
  }
  
  //adds friction to circles
  public void addFriction() {
    xVelocity*=0.99;
    yVelocity*=0.99;
  }
  
  //displays circles
  public void display()
  {
    fill(yCenter/(height/255),xCenter/(width/255),255-yCenter/(height/255));
    ellipse(xCenter,yCenter,radius*2,radius*2);
  }

}
