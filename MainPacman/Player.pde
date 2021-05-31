class Player {

  int x, y;
  char[][] map;
  int collected;
  
  Player(int xcor, int ycor, char[][] level){
    x = xcor;
    y = ycor;
    collected = 0;
    map = level;
  }
  
  void move() {
    if (map[x][y] == 'P') {
      if (keyPressed) {
        if (key == 'W' || key == 'w') {
          if (x <= 0 || map[x-1][y] == '#') {
          }
          else {
            if (map[x-1][y] == 'C') {
              map[x-1][y] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else {
              map[x-1][y] = 'P';
              map[x][y] = '.';
            }
          }
        }
        else if (key == 'A' || key == 'a') {
          if (y <= 0 || map[x][y-1] == '#') {
          }
          else {
            if (map[x][y-1] == 'C') {
              map[x][y-1] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else {
              map[x][y-1] = 'P';
              map[x][y] = '.';
            }
          }
        }
        else if (key == 'S' || key == 's') {
          if (x >= map.length-1 || map[x+1][y] == '#') {
          }
          else {
            if (map[x+1][y] == 'C') {
              map[x+1][y] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else {
              map[x+1][y] = 'P';
              map[x][y] = '.';
            }
          }
        }
        else if (key == 'D' || key == 'd') {
          if (y >= map[0].length-1 || map[x][y+1] == '#') {
          }
          else {
            if (map[x][y+1] == 'C') {
              map[x][y+1] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else {
              map[x][y+1] = 'P';
              map[x][y] = '.';
            }
          }
        }
      }
    }
    else if (map[x][y] == 'R') {
      if (keyPressed) {
        if (key == 'W' || key == 'w') {
          if (x <= 0 || map[x-1][y] == '#') {
          }
          else {
            if (map[x-1][y] == 'C') {
              map[x-1][y] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else {
              map[x-1][y] = 'P';
              map[x][y] = '.';
            }
          }
        }
        else if (key == 'A' || key == 'a') {
          if (y <= 0 || map[x][y-1] == '#') {
          }
          else {
            if (map[x][y-1] == 'C') {
              map[x][y-1] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else {
              map[x][y-1] = 'P';
              map[x][y] = '.';
            }
          }
        }
        else if (key == 'S' || key == 's') {
          if (x >= map.length-1 || map[x+1][y] == '#') {
          }
          else {
            if (map[x+1][y] == 'C') {
              map[x+1][y] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else {
              map[x+1][y] = 'P';
              map[x][y] = '.';
            }
          }
        }
        else if (key == 'D' || key == 'd') {
          if (y >= map[0].length-1 || map[x][y+1] == '#') {
          }
          else {
            if (map[x][y+1] == 'C') {
              map[x][y+1] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else {
              map[x][y+1] = 'P';
              map[x][y] = '.';
            }
          }
        }
      }
    }
  
  }
  
  int getcollected() {
    return collected;
  }
  
  char[][] getmap() {
    return map;
  }

}
