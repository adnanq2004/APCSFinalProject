class DemoPlayer {

  int x, y;
  char[][] map;
  int collected;
  
  DemoPlayer(int xcor, int ycor, char[][] level){
    x = xcor;
    y = ycor;
    collected = 0;
    map = level;
  }
  
  void move() {
    if (keyPressed) {
      
      if (key == 'W' || key == 'w') {
        if (x <= 0 || map[x-1][y] == '#' || map[x-1][y] == 'E' || map[x-1][y] == 'O') {
        }
        else {
          if (map[x][y] == 'R') {
            if (map[x-1][y] == 'C') {
              map[x-1][y] = 'P';
              map[x][y] = 'S';
              collected++;
            }
            else if (map[x-1][y] == 'S') {
              map[x-1][y] = 'R';
              map[x][y] = 'S';
            }
            else {
              map[x-1][y] = 'P';
              map[x][y] = 'S';
            }
          }
          else {
            if (map[x-1][y] == 'C') {
              map[x-1][y] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else if (map[x-1][y] == 'S') {
              map[x-1][y] = 'R';
              map[x][y] = '.';
            }
            else {
              map[x-1][y] = 'P';
              map[x][y] = '.';
            }
          }
        }
      }
      
      else if (key == 'A' || key == 'a') {
        if (y <= 0 || map[x][y-1] == '#' || map[x][y-1] == 'E' || map[x][y-1] == 'O') {
        }
        else {
          if (map[x][y] == 'R') {
            if (map[x][y-1] == 'C') {
              map[x][y-1] = 'P';
              map[x][y] = 'S';
              collected++;
            }
            else if (map[x][y-1] == 'S') {
              map[x][y-1] = 'R';
              map[x][y] = 'S';
            }
            else {
              map[x][y-1] = 'P';
              map[x][y] = 'S';
            }
          }
          else {
            if (map[x][y-1] == 'C') {
              map[x][y-1] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else if (map[x][y-1] == 'S') {
              map[x][y-1] = 'R';
              map[x][y] = '.';
            }
            else {
              map[x][y-1] = 'P';
              map[x][y] = '.';
            }
          }
        }
      }
      
      else if (key == 'S' || key == 's') {
        if (x >= map.length-1 || map[x+1][y] == '#' || map[x+1][y] == 'E' || map[x+1][y] == 'O') {
        }
        else {
          if (map[x][y] == 'R') {
            if (map[x+1][y] == 'C') {
              map[x+1][y] = 'P';
              map[x][y] = 'S';
              collected++;
            }
            else if (map[x+1][y] == 'S') {
              map[x+1][y] = 'R';
              map[x][y] = 'S';
            }
            else {
              map[x+1][y] = 'P';
              map[x][y] = 'S';
            }
          }
          else {
            if (map[x+1][y] == 'C') {
              map[x+1][y] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else if (map[x+1][y] == 'S') {
              map[x+1][y] = 'R';
              map[x][y] = '.';
            }
            else {
              map[x+1][y] = 'P';
              map[x][y] = '.';
            }
          }
        }
      }
      
      else if (key == 'D' || key == 'd') {
        if (y >= map[0].length-1 || map[x][y+1] == '#' || map[x][y+1] == 'E' || map[x][y+1] == 'O') {
        }
        else {
          if (map[x][y] == 'R') {
            if (map[x][y+1] == 'C') {
              map[x][y+1] = 'P';
              map[x][y] = 'S';
              collected++;
            }
            else if (map[x][y+1] == 'S') {
              map[x][y+1] = 'R';
              map[x][y] = 'S';
            }
            else {
              map[x][y+1] = 'P';
              map[x][y] = 'S';
            }
          }
          else {
            if (map[x][y+1] == 'C') {
              map[x][y+1] = 'P';
              map[x][y] = '.';
              collected++;
            }
            else if (map[x][y+1] == 'S') {
              map[x][y+1] = 'R';
              map[x][y] = '.';
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
