class Obstacle{
  int x,y,w,h;
  Obstacle(){
    fill(0, 0, 255);
    rect(0, 0, 10, 10);
  }
 Obstacle(int x,int y,int w,int h){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h =h;
    fill(0, 0, 255);
    rect(x, y, w, h);
  }
  void update(){
    fill(0,0,255);
    rect(x, y, w, h);
  }
}
