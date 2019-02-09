class Dot {
  PVector vel;
  PVector pos;
  PVector brain[];
  int instructionCount;
  int step;
  float fitness;
  boolean dead;
  boolean best;
  boolean reachedGoal;
  int x,y;
  Dot(int x, int y) {
    instructionCount = 1000;
    vel = new PVector(0, 0);
    pos = new PVector(x, y);
    this.x = x;
    best = false;
    this.y = y;
    dead = false;
    reachedGoal = false;
    step = 0;
    brain = new PVector[instructionCount];
    for (int i = 0; i< brain.length; i++) {
      float randomAngle = random(2*PI);
      brain[i] = PVector.fromAngle(randomAngle);
    }
  }
  void move() {
    if (step<instructionCount) {
      vel.add(brain[step]);
      vel.limit(5);
      pos.add(vel);
      step++;
    } else {
      dead = true;
    }
  }
  void mutate(float intensity){
    for(int i =0; i< brain.length;i++){
      float rand = random(1);
     // System.out.println(rand);
      if( rand < intensity){
        float angle = random(2*PI);
        brain[i] = PVector.fromAngle(angle);
      }
    }
  }
  float fitness(){
    if (reachedGoal) {//if the dot reached the goal then the fitness is based on the amount of steps it took to get there
      fitness = 1.0/16.0 + 10000.0/(float)(step*step);
    } else {//if the dot didn't reach the goal then the fitness is based on how close it is to the goal
      float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
      fitness = 1.0/(distanceToGoal*distanceToGoal);
    }
    return fitness;
  }
  PVector[] copyBrain(){
    PVector output[] = new PVector[instructionCount];
    for (int i = 0; i< brain.length; i++) {
      output[i] = brain[i].copy();
    }
    return output;
  }
  void update(Obstacle o []) {
    if (!best)
      fill(0);
     else
      fill(0,255,0);
    ellipse(pos.x, pos.y, 4, 4);
    if (!dead) {
      move();
      if (pos.x< 2|| pos.y<2 || pos.x>width-2 || pos.y>height -2) {//if near the edges of the window then kill it 
        dead = true;
      } else if (dist(pos.x, pos.y, goal.x, goal.y) < 5) {//if reached goal
        dead = true;
      } else {//if hit obstacle
        for (int i = 0; i < o.length; i++) {
          if ( pos.x > o[i].x - 2 && pos.x < (o[i].x + o[i].w + 2) && pos.y > o[i].y && pos.y-2 < o[i].y + o[i].h + 2) {
              dead = true;
          }
        }
      }
    }
  }
}
