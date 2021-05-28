import java.util.*;
import java.io.*;

public class e{

  private static char[][] generatemap(String filename) {
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
      char[][] val = new char[2][2];
      for (int i = 0; i < val.length; i++) {
        for (int j = 0; j < val[i].length; j++) {
          val[i][j] = 'z';
        }
      }
      return val;
    }
  }

  private static void level1() {
      char[][] level = generatemap("./level1.txt");
      for (char[] a: level) {
        for (char b: a) {
          System.out.print(b);
        }
        System.out.println("");
      }
      //int startx = 0;
      //int currenty = 0;
      //for (int i = 0; i < level.length; i++) {
      //  int currentx = startx;
      //  for (int j = 0; j < level[i].length; j++) {

      //  }
      //}
  }

  public static void main(String[] args) {
    // level1();
    char[][] level = generatemap("level1.txt");
    for (char[] a: level) {
      for (char b: a) {
        System.out.print(b);
      }
      System.out.println("");
    }
    System.out.println("hah");
  }

}
