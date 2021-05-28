import java.util.*;
import java.io.*;

void setup() {
  size(810,930);
  char[][] level = generatemap("level1.txt");
  level1(level);
}

void draw() {
  char[][] level = generatemap("level1.txt");
  level1(level);
  fill(#1A17E8);
  //rect(0,0,30,30);
}

private char[][] generatemap(String filename) {
  try {
    File filetoread = new File(filename);
    Scanner scan = new Scanner(filetoread);
    ArrayList temp = new ArrayList<Character>();
    while(scan.hasNextLine()) {
      temp.add(scan.nextLine().toString());
    }
    char[][] board = new char[temp.size()][temp.get(0).toString().length()];
      for(int i = 0; i < board.length; i++) {
        for(int j = 0; j < board[0].length; j++) {
          board[i][j] = temp.get(i).toString().charAt(j);
        }
      }
    return board;
  }
  catch (FileNotFoundException e) {
    return new char[0][0];
  }
}

void level1(char[][] level) {
  
    //test to see if the level is read correctly
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
        if (level[currentx][currenty] == '#') {
          fill(#1A17E8);
          rect(currentx,currenty,30,30);
        }
        else if (level[currentx][currenty] == 'C') {
          fill(0);
          rect(currentx,currenty,30,30);
          //new coin here, so probably make a class or smth for that later.
          fill(#E8B817);
          ellipse(currentx + 15, currenty + 15, 10,10);
        }
        else if (level[currentx][currenty] == 'P') {
          fill(0);
          rect(currentx,currenty,30,30);
          //player is gonna go here.
          fill(#E817DE);
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
    
}
