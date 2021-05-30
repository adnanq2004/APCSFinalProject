class Player {
  float x,y;
  
  Player(float xcoord,float ycoord){
    x = xcoord;
    y = ycoord;
  }
  
  void play() {
    fill(150,0,100);
    ellipse(x,y,40,40);
    keyPressed();
    walls();
  }
  
  void walls() {
    if(x <= 20) {
      x = 20;
    }
    if(y <= 20) {
      y = 20;
    }
    if(x >= 1180) {
      x = 1180;
    }
    if(y >= 580) {
      y = 580;
    }
  }
  
  void keyPressed() {
    if(key == 'a') {
      x -= 5;
    }
    if(key == 'd') {
      x += 5;
    }
    if(key == 'w') {
      y-= 5;
    }
    if(key == 's') {
      y+= 5;
    }
  }
  
}
