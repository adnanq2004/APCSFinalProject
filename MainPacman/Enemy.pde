import java.util.*;
import java.io.*;
public class Enemy{
  int speed;
  char[][] map;
  //Deque<Integer> pos;
  //Deque<String> directions;
  int x;
  int y;
  int time;
  //String direction;
  
  Enemy(char[][] level, int xcor, int ycor) {
    //pos = startpos;
    //directions = alldirs;
    map = level;
    speed = 1;
    x = xcor;
    y = cor;
    time = second();
    //direction = dir;
  }
  
  void move() {
    if(second() - time >= 1) {
      String finalpath;
      int possiblepaths;
      ArrayList<String> paths;
      if (x > 0 && level[x-1][y] != '#') {
        possiblepaths++;
        paths.add("up");
      }
      if (y > 0 && level[x][y-1] != '#') {
        possiblepaths++;
        paths.add("left");
      }
      if (x < level.length-1 && level[x+1][y] != '#') {
        possiblepaths++;
        paths.add("down");
      }
      if (y < level[0].length-1 && level[x][y+1] != '#') {
        possiblepaths++;
        paths.add("right");
      }
      if (paths.length > 1) {
        Random rand = new Random();
        int int_random = rand.nextInt(possiblepaths);
        finalpath = possiblepaths[int_random];
      }
      else {
        finalpath = possiblepaths[0];
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
        
      }
    }
  }
  
}
