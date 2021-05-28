import java.util.*;
import java.io.*;

void setup() {
  size(1200,900);
}

void draw() {

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

private void level1() {
    char[][] level = generatemap("level1.txt");
}
