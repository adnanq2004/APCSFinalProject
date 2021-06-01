import java.util.*;
import java.io.*;
PFont f;

//instance variables
double currentlevel;
char[][] levelmap;
int timenow;
int collected;
int collecting;
int remaining;
Player player;
int lives;
int enemymove;
ArrayList<Enemy> enemylist = new ArrayList<Enemy>();

void setup() {
  size(1020,930);
  fill(255);
  rect(-1,-1,1021,931);
  f = createFont("Arial",24,true);
  timenow = second();
  currentlevel = 0;
}

void draw() {
  if (currentlevel == 0) {
    textFont(f);
    fill(0);
    //currentlevel = 1;
    text("Welcome to Pacman!",width/2-120,height/2-50);
    if (second() - timenow >= 3) {
      fill(255);
      rect(-1,-1,1021,931);
      textFont(f);
      fill(0);
      text("The Game Will Begin In!",width/2-120,height/2-50);
      if (second() - timenow >= 4) {
        text("3..",width/2-5,height/2);
        if (second() - timenow >= 5) {
          fill(255);
          rect(-1,-1,1021,931);
          textFont(f);
          fill(0);
          text("The Game Will Begin In!",width/2-120,height/2-50);
          text("2..",width/2-5,height/2);
          if (second() - timenow >= 6) {
            fill(255);
            rect(-1,-1,1021,931);
            textFont(f);
            fill(0);
            text("The Game Will Begin In!",width/2-120,height/2-50);
            text("1..",width/2-5,height/2);
          }
          if (second() - timenow >= 7) {
            currentlevel = 1;
            fill(255);
            rect(-1,-1,1021,931);
          }
        }
      }
    }
  }
  if (currentlevel == 1) {
    levelmap = generatemap("./level1.txt");
    currentlevel = 1.1;
    collected = 0;
    collecting = 0;
    lives = 3;
    remaining = -1;
    enemymove = second();
  }
  if (currentlevel == 1.1) {
    if (remaining == 0) {
      //println(collected);
      collected += player.getcollected();
      currentlevel = 2;
    }
    else {
      enemylist.clear();
      levels(levelmap);
      displayothers();
      player.move();
      collecting = player.getcollected();
      collected += collecting;
      levelmap = player.getmap();
      if (enemymove > second()) {
        enemymove = second();
      }
      else {
        if (second() - enemymove >= .1) {
          for (Enemy e: enemylist) {
            e.move(levelmap);
            levelmap = e.getmap();
            if (e.getkills()) {
              lives--;
              e.resetkill();
            }
          }
          enemymove = second();
        }
      }
      if (lives <= 0) {
        currentlevel = -1;
      }
    }
  }
  if (currentlevel == 2) {
    fill(255);
    rect(-1,-1,1021,931);
    enemylist.clear();
  }
  if (currentlevel == -1) {
    gameover();
  }
}

private void displayothers() {
  f = createFont("Arial",20,true);
  fill(255);
  text("DISPLAYS", 850,90);
  fill(#E8B817);
  text("Remaining Coins: ", 810,120);
  text("" + remaining,850,150);
  fill(#FC001E);
  text("Lives: " + lives, 850, 210);
  fill(#E8B817);
  text("Collected Coins: ", 820,270);
  int collect = collected;
  text("" + collect,850,300);
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

void levels(char[][] level) {
    
    //starting the code to make the maps visualized
    fill(255);
    rect(-1,-1,1001,931);
    int val = 0;
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
          val++;
          fill(0);
          rect(currentx,currenty,30,30);
          //new coin here, so probably make a class or smth for that later.
          fill(#E8B817);
          ellipse(currentx + 15, currenty + 15, 10,10);
        }
        else if (level[i][j] == 'S') {
          fill(0);
          rect(currentx,currenty,30,30);
        }
        else if (level[i][j] == 'R') {
          fill(0);
          stroke(0,0,0);
          rect(currentx,currenty,30,30);
          //player is gonna go here.
          fill(#F50F0F);
          player = new Player(i,j,level);
          stroke(#F50F0F);
          ellipse(15,15,15,15);
          beginShape();
          vertex(7,12);
          vertex(7,4);
          vertex(11,12);
          endShape();
          beginShape();
          vertex(18,12);
          vertex(22,4);
          vertex(22,12);
          endShape();
          stroke(0,0,0);
        }
        else if (level[i][j] == 'P') {
          fill(0);
          stroke(0,0,0);
          rect(currentx,currenty,30,30);
          //player is gonna go here.
          fill(#F50F0F);
          player = new Player(i,j,level);
          stroke(#F50F0F);
          ellipse(15,15,15,15);
          beginShape();
          vertex(7,12);
          vertex(7,4);
          vertex(11,12);
          endShape();
          beginShape();
          vertex(18,12);
          vertex(22,4);
          vertex(22,12);
          endShape();
          stroke(0,0,0);
        }
        else if (level[i][j] == 'O') {
          val++;
          fill(0);
          stroke(0,0,0);
          rect(currentx,currenty,30,30);
          fill(#FC1FE3);
          stroke(#FC1FE3);
          ellipse(currentx + 15,currenty + 15, 15,15);
          beginShape();
          vertex(currentx + 8, currenty + 18);
          vertex(currentx + 8,currenty + 28);
          vertex(currentx + 15,currenty + 18);
          vertex(currentx + 15,currenty + 18);
          vertex(currentx + 22,currenty + 28);
          vertex(currentx + 22,currenty + 18);
          endShape();
          beginShape();
          vertex(currentx + 10,currenty + 18);
          vertex(currentx + 15,currenty + 28);
          vertex(currentx + 20,currenty + 18);
          endShape();
          fill(0,0,0);
          ellipse(currentx + 10,currenty + 15,5,5);
          ellipse(currentx + 20,currenty + 15,5,5);
          stroke(0,0,0);
          Enemy newstuff = new Enemy(levelmap, i, j);
          enemylist.add(newstuff);
        }
        else if (level[i][j] == 'E') {
          fill(0);
          rect(currentx,currenty,30,30);
          stroke(0,0,0);
          fill(#FC1FE3);
          stroke(#FC1FE3);
          ellipse(currentx + 15,currenty + 15, 15,15);
          beginShape();
          vertex(currentx + 8, currenty + 18);
          vertex(currentx + 8,currenty + 28);
          vertex(currentx + 15,currenty + 18);
          vertex(currentx + 15,currenty + 18);
          vertex(currentx + 22,currenty + 28);
          vertex(currentx + 22,currenty + 18);
          endShape();
          beginShape();
          vertex(currentx + 10,currenty + 18);
          vertex(currentx + 15,currenty + 28);
          vertex(currentx + 20,currenty + 18);
          endShape();
          fill(0,0,0);
          ellipse(currentx + 10,currenty + 15,5,5);
          ellipse(currentx + 20,currenty + 15,5,5);
          stroke(0,0,0);
          Enemy newstuff = new Enemy(levelmap, i, j);
          enemylist.add(newstuff);
        }
        else {
          fill(0);
          rect(currentx,currenty,30,30);
        }
        currentx += 30;
      }
      currenty += 30;
    }
    remaining = val;
    
}

void gameover() {
  fill(255);
  rect(-1,-1,1021,931);
  fill(0);
  text("Congrats, you died, you failure.", width/2-180, height/2-50);
}
