import java.util.*;
import java.io.*;
public class Boss{
  char[][] level;
  int x;
  int y;
  int time;
  boolean gotkill;
  String direction;
  Boss(char[][] map, int xcor, int ycor, String direct){
    level = map;
    x = xcor;
    y = ycor;
    time = second();
    gotkill = false;
    direction = direct;
  }
  
  void step(char[][] level, int xval, int yval) {
    if (level[x][y] == 'E') { //Adnan fix this
      
    }
    else if (level[x][y] == 'O') { //Adnan fix this
      
    }
    else if (level[x][y] == 'T') { //T stands for Boss + Coin
      if (level[xval][yval] == 'P') { // P stands for Player
        level[x][y] = 'C'; // C stands for coin
        level[xval][yval] = 'G'; //G stands for boss
        level[15][13] = 'P';
        gotkill = true;
      }
      else if (level[xval][yval] == 'C') {
        level[x][y] = 'C';
        level[xval][yval] = 'T';
      }
      else if (level[xval][yval] == 'B') { //B stands for Trick Coin
        level[x][y] = 'C';
        level[xval][yval] = 'J';//J stands for Boss + Trick Coin
      }
      else if (level[xval][yval] == '.') { // . stands for just a empty space
        level[x][y] = 'C';
        level[xval][yval] = 'G'; 
      }
    }
    else if (level[x][y] == 'J') {
      if (level[xval][yval] == 'P') {
        level[x][y] = 'B';
        level[xval][yval] = 'G';
        level[15][13] = 'P';
        gotkill = true;
      }
      else if (level[xval][yval] == 'C') {
        level[x][y] = 'B';
        level[xval][yval] = 'T';
      }
      else if (level[xval][yval] == 'B') {
        level[x][y] = 'B';
        level[xval][yval] = 'J';
      }
      else if (level[xval][yval] == '.') {
        level[x][y] = 'B';
        level[xval][yval] = 'G';
      }
    }
    else {
      if (level[xval][yval] == 'P') {
        level[x][y] = '.';
        level[xval][yval] = 'G';
        level[15][13] = 'P';
        gotkill = true;
      }
      else if (level[xval][yval] == 'C') {
        level[x][y] = '.';
        level[xval][yval] = 'T';
      }
      else if (level[xval][yval] == 'B') {
        level[x][y] = '.';
        level[xval][yval] = 'J';
      }
      else if (level[xval][yval] == '.') {
        level[x][y] = '.';
        level[xval][yval] = 'G';
      }
    }
  }
  
  
}
