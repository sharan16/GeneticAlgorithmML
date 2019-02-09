PVector goal  = new PVector(400, 10);
Obstacle o[];
Population p;
void setup() {
  size(700, 700); //size of the window
  frameRate(100);//increase this to make the dots go faster
  System.out.println(width);
  o = new Obstacle [10];
  //o[0] = new Obstacle(100, 500, 600, 10);
  o[0] = new Obstacle(100, 75, 10, 200);
  o[1] = new Obstacle(200, 75, 10, 200);
  o[2] = new Obstacle(300, 75, 10, 200);
  o[3] = new Obstacle(400, 75, 10, 200);
  o[4] = new Obstacle(500, 75, 10, 200);
  o[5] = new Obstacle(150, 300, 10, 200);
  o[6] = new Obstacle(250, 300, 10, 200);
  o[7] = new Obstacle(350, 300, 10, 200);
  o[8] = new Obstacle(450, 300, 10, 200);
  o[9] = new Obstacle(550, 300, 10, 200);
  p = new Population(10,o);
}


void draw() { 
  background(255);
  //----------Obstacle Display------------//
  for(int i=0; i < o.length;i++){
    o[i].update();
  }
  //--------------------------------------//
  
  //draw goal
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);
  
  p.update();

}
