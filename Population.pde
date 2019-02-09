class Population {
  Dot d[];
  Obstacle o[];
  int size;
  float fitness[];
  Population(int size, Obstacle o[]) {
    d = new Dot[size];
    fitness = new float[size];
    this.size = size;
    this.o = o;
    for (int i = 0; i< d.length; i++) {
      d[i] = new Dot (400, 600);
    }
  }
  boolean dead() {
    for (int i = 0; i< d.length; i++) {
      if (!d[i].dead) {
        return false;
      }
    }
    return true;
  }
  int maxFitness() {
    int largest = 0;
    for ( int i = 1; i < fitness.length; i++ )
    {
      if ( fitness[i] > fitness[largest] ) largest = i;
    }
    return largest; // position of the first largest found
  }
  void naturalSelection() {
    for (int i = 0; i < d.length; i++) {
      fitness[i] = d[i].fitness();
    }

    int successorIndex = maxFitness();
    Dot successor = new Dot(400, 600);
    successor.brain = d[successorIndex].copyBrain();
    successor.reachedGoal = d[successorIndex].reachedGoal;
    for (int i = 0; i< d.length; i++) {
      d[i] = new Dot(400, 600);
      d[i].brain = successor.copyBrain();
      if (i!=0) {
        if (!successor.reachedGoal) {
          d[i].mutate(0.1);
        }
        else{
          d[i].mutate(0.01);
        }
      } else {
        d[i].best = true;
      }
    }
  }
  void update() {
    for (int i = 0; i< d.length; i++) {
      d[i].update(o);
    }
    if (dead()) {
      naturalSelection();
    }
  }
}
