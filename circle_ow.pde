//determines how many circles will be displayed
final int NUM_PARTICLES = 100;
Circle[] bloop = new Circle[NUM_PARTICLES];

void setup() {
  size(800,800);
    for (int i=0; i<NUM_PARTICLES-1; i++) {
      bloop[i] = new Circle(random(width),random(height),10,random(-4,4),random(-4,4)); 
    }
}


void draw() {
  background(0);
  //allows all the methods to apply for all circles
  for (int x=0; x<bloop.length-1; x++) {
    bloop[x].display();
    bloop[x].move();
    bloop[x].bounceWall();
    bloop[x].clickity();
    bloop[x].addFriction();
    //checks if balls overlap. if so, ow method will be called
    for (int y=0; y<bloop.length-1; y++) {
      bloop[x].ow(bloop[y]);
    }
}
}
  
