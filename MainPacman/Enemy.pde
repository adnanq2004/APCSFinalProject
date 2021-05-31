import java.util.*;
import java.io.*;
public class Enemy{
  int speed;
  char[][] map;
  Deque<Integer> pos;
  int time;
  
  Enemy(Deque<Integer> startpos, char[][] level) {
    pos = startpos;
    map = level;
    speed = 1;
    time = second();
  }
  
  void move() {
    if(second() - time >= 1) {
      int x = pos.removeFirst();
      pos.addLast(x);
      int y = pos.removeFirst();
      pos.addLast(y);
      map[x][y] = 'E';
      time = second();
    }
  }
  
}
