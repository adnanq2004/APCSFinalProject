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
int playermove;
boolean currentreversed;
ArrayList<Enemy> enemylist = new ArrayList<Enemy>();
ArrayList<String> directionlist = new ArrayList<String>();

void setup() {
  size(1020,930);
  fill(255);
  rect(-1,-1,1021,931);
  f = createFont("Arial",24,true);
  timenow = second();
  currentlevel = 1;
  lives = 3;
  textFont(f);
  for (int i = 0; i < 10; i++) {
    directionlist.add("none");
  }
}

void draw() {
  
  //opening
  if (currentlevel == 0) {
    textFont(f);
    fill(0);
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
  
  //level 1
  if (currentlevel == 1) {
    currentreversed = false;
    levelmap = generatemap("./level1.txt");
    currentlevel = 1.1;
    collected = 0;
    collecting = 0;
    lives = 3;
    remaining = -1;
    enemymove = millis();
    playermove = millis();
  }
  if (currentlevel == 1.1) {
    if (remaining == 0) {
      collected += player.getcollected();
      currentlevel = 2;
      timenow = millis();
      lives++;
    }
    else {
      enemylist.clear();
      levels(levelmap);
      displayothers();
      if (playermove > millis()) {
        playermove = millis();
      }
      else {
        if (millis() - playermove >= 75) {
          player.move();
          collecting = player.getcollected();
          collected += collecting;
          levelmap = player.getmap();
          playermove = millis();
        }
      }
      if (enemymove > millis()) {
        enemymove = millis();
      }
      else {
        if (millis() - enemymove >= 225) {
          for (int i = 0; i < enemylist.size(); i++) {
            Enemy e = enemylist.get(i);
            e.move(levelmap);
            directionlist.set(i,e.getDirection());
            levelmap = e.getmap();
            if (e.getkills()) {
              lives--;
              e.resetkill();
            }
          }
          enemymove = millis();
        }
      }
      if (lives <= 0) {
        currentlevel = -1;
      }
    }
  }
  
  //level 2
  if (currentlevel == 2) {
    fill(255);
    rect(-1,-1,1021,931);
    enemylist.clear();
    currentlevel = 2.1;
    remaining = -1;
    levelmap = generatemap("./level2.txt");
    enemymove = millis();
    playermove = millis();
    remaining = -1;
  }
  if (currentlevel == 2.1) {
    if (remaining == 0) {
      collected += player.getcollected();
      currentlevel = 3;
      timenow = millis();
      lives++;
    }
    else {
      enemylist.clear();
      levels(levelmap);
      displayothers();
      if (playermove > millis()) {
        playermove = millis();
      }
      else {
        if (millis() - playermove >= 75) {
          player.move();
          currentreversed = player.movements();
          collecting = player.getcollected();
          collected += collecting;
          levelmap = player.getmap();
          playermove = millis();
        }
      }
      if (enemymove > millis()) {
        enemymove = millis();
      }
      else {
        if (millis() - enemymove >= 225) {
          for (int i = 0; i < enemylist.size(); i++) {
            Enemy e = enemylist.get(i);
            e.move(levelmap);
            directionlist.set(i,e.getDirection());
            levelmap = e.getmap();
            if (e.getkills()) {
              lives--;
              e.resetkill();
            }
          }
          enemymove = millis();
        }
      }
      if (lives <= 0) {
        currentlevel = -1;
      }
    }
  }
  
  //level 3
  if (currentlevel == 3) {
    fill(255);
    rect(-1,-1,1021,931);
    enemylist.clear();
    currentlevel = 3.1;
    remaining = -1;
    levelmap = generatemap("./level2.txt");
    enemymove = millis();
    playermove = millis();
    remaining = -1;
  }
  if (currentlevel == 3.1) {
    if (remaining == 0) {
      collected += player.getcollected();
      currentlevel = 2;
      timenow = millis();
      lives++;
    }
    else {
      enemylist.clear();
      levels(levelmap);
      displayothers();
      if (playermove > millis()) {
        playermove = millis();
      }
      else {
        if (millis() - playermove >= 75) {
          player.move();
          currentreversed = player.movements();
          collecting = player.getcollected();
          collected += collecting;
          levelmap = player.getmap();
          playermove = millis();
        }
      }
      if (enemymove > millis()) {
        enemymove = millis();
      }
      else {
        if (millis() - enemymove >= 225) {
          for (int i = 0; i < enemylist.size(); i++) {
            Enemy e = enemylist.get(i);
            e.move(levelmap);
            directionlist.set(i,e.getDirection());
            levelmap = e.getmap();
            if (e.getkills()) {
              lives--;
              e.resetkill();
            }
          }
          enemymove = millis();
        }
      }
      if (lives <= 0) {
        currentlevel = -1;
      }
    }
  }
  if (currentlevel == 4) {
    victory(2);
  }
  if (currentlevel == -1) {
    gameover();
  }
}

private void displayothers() {
  f = createFont("Arial",20,true);
  fill(255);
  fill(0,255,0);
  stroke(0,255,0);
  rect(810,0,800,10);
  rect(810,10,10,920);
  rect(810,920,800,10);
  rect(1010,10,10,920);
  stroke(0,0,0);
  fill(255,255,255);
  
  //display level1
  if (currentlevel == 1.1) {
    text("LEVEL 1", 865, 30);
    text("Invasion", 865, 60);
  }
  
  //display level2
  else if (currentlevel == 2.1){
    text("LEVEL 2", 865, 30);
    text("Invading", 865, 60);
  }
  
  else if (currentlevel == 3.1) {
    text("LEVEL 2", 865, 30);
    text("Invaded", 865, 60);
  }
  
  //display remaining coins
  fill(#E8B817);
  text("Remaining Coins: ", 820,120);
  text("" + remaining,890,150);
  ellipse(870,140,25,25);
  ellipse(870,140,15,15);
  line(870,135,870,145);
  
  //display lives
  fill(#FC001E);
  text("Lives: " + lives, 865, 210);
  stroke(#FC001E);
  ellipse(960,195,15,15);
  ellipse(976,195,15,15);
  beginShape();
  vertex(951,195);
  vertex(968,220);
  vertex(984,195);
  endShape();
  stroke(0,0,0);
  
  //display remaining coins
  fill(#E8B817);
  text("Collected Coins: ", 830,270);
  text("" + collected,890,300);
  fill(#E8B817);
  ellipse(870,290,25,25);
  ellipse(870,290,15,15);
  line(870,285,870,295);
  fill(0,0,0);
  
  //display controls to use
  fill(#530FF5);
  if (!currentreversed) {
    text("Controls: WASD", 828,360);
  }
  else {
    text("Controls:", 860,360);
    text("Arrow Keys", 850,390);
  }
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

private void levels(char[][] level) {
    int directionindex = 0;
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
          //new coin
          fill(#E8B817);
          ellipse(currentx + 15, currenty + 15, 10,10);
        }
        else if (level[i][j] == 'B') {
          //reversing coin
          val++;
          fill(0);
          rect(currentx,currenty,30,30);
          fill(#FC1FE3);
          ellipse(currentx + 15, currenty + 15, 10,10);
        }
        else if (level[i][j] == 'S') {
          fill(0);
          rect(currentx,currenty,30,30);
          //safe zone
        }
        else if (level[i][j] == 'R') {
          //player is gonna go here.
          fill(0);
          stroke(0,0,0);
          rect(currentx,currenty,30,30);
          fill(#F50F0F);
          player = new Player(i,j,level,currentreversed);
          stroke(#F50F0F);
          ellipse(currentx + 15,currenty + 15,15,15);
          beginShape();
          vertex(currentx + 7,currenty + 12);
          vertex(currentx + 7,currenty + 4);
          vertex(currentx + 11,currenty + 12);
          endShape();
          beginShape();
          vertex(currentx + 18,currenty + 12);
          vertex(currentx + 22,currenty + 4);
          vertex(currentx + 22,currenty + 12);
          endShape();
          stroke(0,0,0);
        }
        else if (level[i][j] == 'P') {
          //player is gonna go here.
          fill(0);
          stroke(0,0,0);
          rect(currentx,currenty,30,30);
          fill(#F50F0F);
          player = new Player(i,j,level,currentreversed);
          stroke(#F50F0F);
          ellipse(currentx + 15,currenty + 15,15,15);
          beginShape();
          vertex(currentx + 7,currenty + 12);
          vertex(currentx + 7,currenty + 4);
          vertex(currentx + 11,currenty + 12);
          endShape();
          beginShape();
          vertex(currentx + 18,currenty + 12);
          vertex(currentx + 22,currenty + 4);
          vertex(currentx + 22,currenty + 12);
          endShape();
          stroke(0,0,0);
        }
        else if (level[i][j] == 'O') {
          //enemy on coin is here
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
          Enemy newstuff;
          newstuff = new Enemy(levelmap, i, j, directionlist.get(directionindex));
          enemylist.add(newstuff);
          directionindex++;
        }
        else if (level[i][j] == 'H') {
          //enemy on a flipping coin is here
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
          Enemy newstuff;
          newstuff = new Enemy(levelmap, i, j, directionlist.get(directionindex));
          enemylist.add(newstuff);
          directionindex++;
        }
        else if (level[i][j] == 'E') {
          //enemy is here
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
          Enemy newstuff;
          if (directionlist.size() > directionindex) {
            newstuff = new Enemy(levelmap, i, j, directionlist.get(directionindex));
          }
          else {
            newstuff = new Enemy(levelmap, i, j, "none");
          }
          enemylist.add(newstuff);
          directionindex++;
        }
        else if (level[i][j] == 'Q') {
          //boss on a coin is here
          
        }
        else if (level[i][j] == 'T') {
          //boss is here
          
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

private void Frozen() {
  for(int i = 0; i < levelmap.length; i++) {
    for(int j = 0; j < levelmap[0].length; j++) {
      if(levelmap[i][j] == 'Q') { // Frozen Tricknote
        levelmap[i][j] = 'B';
      }
      else if(levelmap[i][j] == 'R') {// Frozen Coin
        levelmap[i][j] = 'C';
      }
      else if(levelmap[i][j] == 'T') {// Frozen Nothing
        levelmap[i][j] = '.';
      }
    }
  }
  for(int i = 0; i < levelmap.length; i++) {
    for(int j = 0; j < levelmap[0].length; j++) {
      if(levelmap[i][j] == 'B') {
        Random rand = new Random();
        int int_random = rand.nextInt(10);
        if(int_random == 5) {
          levelmap[i][j] = 'Q';
        }
      }
      else if(levelmap[i][j] == 'C') {
        Random rand = new Random();
        int int_random = rand.nextInt(10);
        if(int_random == 5) {
          levelmap[i][j] = 'R';
        }
      }
      else if(levelmap[i][j] == '.') {
        Random rand = new Random();
        int int_random = rand.nextInt(10);
        if(int_random == 5) {
          levelmap[i][j] = 'T';
        }
      }
    }
  }
}

private void gameover() {
  fill(255);
  rect(-1,-1,1021,931);
  fill(0);
  PImage duck = loadImage("angryduck.png");
  image(duck, width/2 - duck.width/2, height/2 - duck.height/2);
  text("Congrats, you have been thrown out the airlock.", width/2-180-55, height/2 - duck.height/2-50);
}

private void victory(int num) {
  fill(255);
  rect(-1,-1,1021,931);
  fill(0);
  PImage duck = loadImage("happyduck" + (int)num + ".png");
  image(duck, width/2 - duck.width/2, height/2 - duck.height/2);
  text("Good job. You didn't die! Feel free to enjoy this duck for a bit, then lets move on, shall we?", width/2-480, height/2 - duck.height/2-50);
}
