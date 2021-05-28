import java.util.*;
import java.io.*;

void setup() {
  size(810,930);
  char[][] level1 = generatemap("./level1.txt");
  level(level1);
}

void draw() {
  //char[][] level = generatemap("./level1.txt");
  //level1(level);
  //fill(#1A17E8);
  //rect(0,0,30,30);
  //tests();
}

private char[][] generatemap(String filename) {
  
  try {
    String[] lines = loadStrings(filename);
    char[][] board = new char[lines.length][lines[0].length()];
    
    for (int i = 0; i < lines.length; i++) {
      String c = lines[i];
      String[] temp = split(c, " ");
      //println(temp);
      //println(temp.length);
      for (int j = 0; j < temp.length; j++) {
        board[i][j] = temp[j].charAt(0);
      }
    }
    return board;
  }
  catch (Exception e) {
    println("failed");
    return new char[0][0];
  }
  
}

void level(char[][] level) {
  
    ////test to see if the level is read correctly
    //for (char[] a: level) {
    //  for (char b: a) {
    //    System.out.print(b);
    //  }
    //  System.out.println("");
    //}
    
    //actually starting the code to make the maps visualized
    int startx = 0;
    int currenty = 0;
    for (int i = 0; i < level.length; i++) {
      int currentx = startx;
      for (int j = 0; j < level[i].length; j++) {
        if (level[i][j] == '#') {
          fill(#1A17E8);
          rect(currentx,currenty,30,30);
        }
        else if (level[i][j] == 'C') {
          fill(0);
          rect(currentx,currenty,30,30);
          //new coin here, so probably make a class or smth for that later.
          fill(#E8B817);
          ellipse(currentx + 15, currenty + 15, 10,10);
        }
        else if (level[i][j] == 'P') {
          fill(0);
          rect(currentx,currenty,30,30);
          //player is gonna go here.
          fill(255);
          ellipse(currentx + 15, currenty + 15, 10,10);
        }
        else {
          fill(0);
          rect(currentx,currenty,30,30);
        }
        currentx += 30;
      }
      currenty += 30;
    }
    
    ////testing to see if i can iterate through an array to display shapes
    //char[][] tests = new char[2][2];
    //int x = 0;
    //int y = 0;
    //for (int i = 0; i < tests.length; i++) {
    //  for (int j = 0; j < tests.length; j++) {
    //    fill((float) (Math.random() * 100),(float) (Math.random() * 100),(float) (Math.random() * 100));
    //    rect(x,y,100,100);
    //    x+=100;
    //  }
    //  x = 0;
    //  y+=100;
    //}
    ////test ended up being positive.
    
}
