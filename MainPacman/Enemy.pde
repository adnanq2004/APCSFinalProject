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
  //String direction;
  
  Enemy(char[][] map, int xcor, int ycor) {
    //pos = startpos;
    //directions = alldirs;
    level = map;
    speed = 1;
    x = xcor;
    y = ycor;
    time = second();
    gotkill = false;
    //direction = dir;
  }
  
  void move() {
    if(second() - time >= 1) {
      String finalpath;
      int possiblepaths = 0;;
      ArrayList<String> paths = new ArrayList<String>();
      if (x > 0 && (level[x-1][y] != '#' && level[x-1][y] != 'S')) {
        possiblepaths++;
        paths.add("up");
      }
      if (y > 0 && (level[x][y-1] != '#' && level[x][y-1] != 'S')) {
        possiblepaths++;
        paths.add("left");
      }
      if (x < level.length-1 && (level[x+1][y] != '#' && level[x+1][y] != 'S')) {
        possiblepaths++;
        paths.add("down");
      }
      if (y < level[0].length-1 && (level[x][y+1] != '#' && level[x][y+1] != 'S')) {
        possiblepaths++;
        paths.add("right");
      }
      if (paths.size() > 1) {
        Random rand = new Random();
        int int_random = rand.nextInt(possiblepaths);
        finalpath = paths.get(int_random);
      }
      else {
        finalpath = paths.get(0);
      }
      
      if (finalpath == "up") {
        step(x-1,y);
      }
      else if (finalpath == "left") {
        step(x,y-1);
      }
      else if (finalpath == "down") {
        step(x+1,y);
      }
      else if (finalpath == "right") {
        step(x,y+1);
      }
      
    }
  }
  
  void step(int xval, int yval) {
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
    }
  }
  
  boolean getkills() {
    return gotkill;
  }
  
  char[][] getmap() {
    return level;
  }
  
}
