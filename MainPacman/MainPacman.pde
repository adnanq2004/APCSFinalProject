void setup() {
  size(1200,600);
  float currentlevel = 1.0;
  if (currentlevel == 1.0) {
    level1();
  }
}

void draw() {

}

private void level1() {
  fill(0);
  rect(300,0,600,600);
  stroke(#2B1BF0);
  rect(350,100,500,400);
  rect(375,125,450,350);
  rect(475,125,25,75);
  rect(700,125,25,75);
  rect(475,400,25,75);
  rect(700,400,25,75);
  rect(550,175,100,25);
  rect(550,400,100,25);
  line(550,275,550,350);
  line(550,350,650,350);
  line(650,350,650,275);
  line(650,275,625,275);
  line(625,275,625,325);
  line(625,325,575,325);
  line(575,325,575,275);
  line(575,275,550,275);
  rect(425,275,50,50);
  rect(725,275,50,50);
}