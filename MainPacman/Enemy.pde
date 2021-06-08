import java.util.*;
import java.io.*;
public class Enemy{
  int speed;
  char[][] level;
  //Deque<Integer> pos;
  //Deque<String> directions;
  int x;
  int y;
  int time;
  boolean gotkill;
  String direction;
  
  Enemy(char[][] map, int xcor, int ycor, String direct) {
    level = map;
    speed = 1;
    x = xcor;
    y = ycor;
    time = second();
    gotkill = false;
    direction = direct;
  }
  
  void move(char[][] ma) {
    level = ma;
    String finalpath;
    int possiblepaths = 0;
    ArrayList<String> paths = new ArrayList<String>();
    if ((x > 0 && (level[x-1][y] != '#' && level[x-1][y] != 'S')) || (level[x-1][y] == 'P' || level[x-1][y] == '.' || level[x-1][y] == 'C' || level[x-1][y] == 'B')) {
      possiblepaths++;
      paths.add("up");
    }
    if ((y > 0 && (level[x][y-1] != '#' && level[x][y-1] != 'S')) || (level[x][y-1] == 'P' || level[x][y-1] == '.' || level[x][y-1] == 'C' || level[x][y-1] == 'B')) {
      possiblepaths++;
      paths.add("left");
    }
    if ((x < level.length-1 && (level[x+1][y] != '#' && level[x+1][y] != 'S')) || (level[x+1][y] == 'P' || level[x+1][y] == '.' || level[x+1][y] == 'C' || level[x+1][y] == 'B')) {
      possiblepaths++;
      paths.add("down");
    }
    if ((y < level[0].length-1 && (level[x][y+1] != '#' && level[x][y+1] != 'S')) || (level[x][y+1] == 'P' || level[x][y+1] == '.' || level[x][y+1] == 'C' || level[x][y+1] == 'B')) {
      possiblepaths++;
      paths.add("right");
    }
    
    if (paths.size() == 2) {
      String opposite = "reeeeeeeee";
      if (direction == "up") {
        opposite = "down";
      }
      if (direction == "down") {
        opposite = "up";
      }
      if (direction == "left") {
        opposite = "right";
      }
      if (direction == "right") {
        opposite = "left";
      }
      if (paths.indexOf(opposite) == -1) {
        Random rand = new Random();
        int int_random = rand.nextInt(possiblepaths);
        finalpath = paths.get(int_random);
      }
      else {
        paths.remove(paths.indexOf(opposite));
        finalpath = paths.get(0);
      }
    }
    
    else if (paths.size() > 2) {
      String opposite = "";
      if (direction == "up") {
        opposite = "down";
      }
      if (direction == "down") {
        opposite = "up";
      }
      if (direction == "left") {
        opposite = "right";
      }
      if (direction == "right") {
        opposite = "left";
      }
      if (paths.indexOf(opposite) == -1) {
        Random rand = new Random();
        int int_random = rand.nextInt(possiblepaths);
        finalpath = paths.get(int_random);
      }
      else {
        paths.remove(paths.indexOf(opposite));
        possiblepaths--;
        Random rand = new Random();
        int int_random = rand.nextInt(possiblepaths);
        finalpath = paths.get(int_random);
      }
    }
    else {
      finalpath = paths.get(0);
    }
    
    if (finalpath == "up") {
      step(level,x-1,y);
    }
    else if (finalpath == "left") {
      step(level,x,y-1);
    }
    else if (finalpath == "down") {
      step(level,x+1,y);
    }
    else if (finalpath == "right") {
      step(level,x,y+1);
    }
    direction = finalpath;
  }
  
  void step(char[][] level, int xval, int yval) {
    if (level[x][y] == 'O') {
      if (level[xval][yval] == 'P') {
        level[x][y] = 'C';
        level[xval][yval] = 'E';
        level[15][13] = 'P';
        gotkill = true;
      }
      else if (level[xval][yval] == 'C') {
        level[x][y] = 'C';
        level[xval][yval] = 'O';
      }
      else if (level[xval][yval] == 'B') {
        level[x][y] = 'C';
        level[xval][yval] = 'H';
      }
      else if (level[xval][yval] == '.') {
        level[x][y] = 'C';
        level[xval][yval] = 'E';
      }
    }
    else if (level[x][y] == 'H') {
      if (level[xval][yval] == 'P') {
        level[x][y] = 'B';
        level[xval][yval] = 'E';
        level[15][13] = 'P';
        gotkill = true;
      }
      else if (level[xval][yval] == 'C') {
        level[x][y] = 'B';
        level[xval][yval] = 'O';
      }
      else if (level[xval][yval] == 'B') {
        level[x][y] = 'B';
        level[xval][yval] = 'H';
      }
      else if (level[xval][yval] == '.') {
        level[x][y] = 'B';
        level[xval][yval] = 'E';
      }
    }
    else {
      if (level[xval][yval] == 'P') {
        level[x][y] = '.';
        level[xval][yval] = 'E';
        level[15][13] = 'P';
        gotkill = true;
      }
      else if (level[xval][yval] == 'C') {
        level[x][y] = '.';
        level[xval][yval] = 'O';
      }
      else if (level[xval][yval] == 'B') {
        level[x][y] = '.';
        level[xval][yval] = 'H';
      }
      else if (level[xval][yval] == '.') {
        level[x][y] = '.';
        level[xval][yval] = 'E';
      }
    }
  }
  
  boolean getkills() {
    return gotkill;
  }
  
  char[][] getmap() {
    return level;
  }
  
  String getDirection() {
    return direction;
  }
  
  void resetkill() {
    gotkill = false;
  }
  
}
