

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// sample simple processing / processing.js file from Andy Johnson - CS 422 - Spring 2017

// one current issue is dealing with sounds between Processing and Processing.js
// without compiler directives its hard to easily comment in and out the two different versions

// the external sound library (Sketch / Import Library / Sound) will work in processing but not in processing.js
// uncomment these two lines to get audio in Processing
//import processing.sound.*;
//SoundFile beepSound;

// here is a processing.js solution from http://aaron-sherwood.com/processingjs/circleSound.html
// uncomment this line to get audio in Processing.js
Audio beepSound = new Audio();

// also note the soundfile needs to be in the data folder for processing and outside that folder for Processing.js
// sounds are also a bit slowerer to start up in Processing.js

// placeholder for future image
PImage img[] = new PImage[10];

// some buttons
int[][] buttons = { {50, 100}, {50, 200}, {50, 300}, {50, 400}, {50, 500}};
int buttonX = 100;
int buttonY = 50;
int counter[] = {0, 0, 0};
int preHeatCounter[] = {0, 0, 0};
int stage = 0;
int temp = 0;
int preHeatTemp = 0;

int hour = 0;
int min = 0;
int sec = 0;
int mode = 0;
int timeCounter[] = {0, 0, 0, 0, 0, 0};
boolean celsius = false;
boolean stop = false;
boolean pause = false;
int[][] threeButtons={ {0, 700}, {560, 700}, {1180, 700}};
String[] threeButtonText = {"back", "OK", "cancel" };
int threeButtonX = 100;
int threeButtonY = 25;

int[][] stage1Buttons = { {124, 230}, {900, 230}};
String[] stage1Text = {"Custom", "Preset"};
int stage1ButtonX = 200;
int stage1ButtonY = 85;

int[][] stage2Displays = { {450, 280}, {600, 280}, {750, 280}};
int stage2DisplayX = 75;
int stage2DisplayY = 150;
int[][] stage2Buttons = { {450, 250}, {600, 250}, {750, 250}};


int[][] stage3Displays = { {250, 280}, {350, 280}, {500, 280}, {600, 280}, {750, 280}, {850, 280}};
int stage3DisplayX = 75;
int stage3DisplayY = 150;
int[][] stage3Buttons = { {250, 250}, {350, 250}, {500, 250}, {600, 250}, {750, 250}, {850, 250}};

int[][] stage4Buttons = {{250, 250}, {250, 300}, {250, 350}, {250, 400}, {250, 450}, {750, 300}};
int stage4ButtonsX = 100;
int stage4ButtonsY = 25;
String[] stage4Text = {"Bake", "Broil", "Toast", "Pizza", "Bagel", "Custom"};

int[][] stage5Buttons = { {124, 600}, {900, 600}};
String[] stage5Text = {"Preheat", "Start"};

int stage10Buttons[][]= {{420, 200}, {420, 220}, {800, 220}, {420, 420}};
int stage10Size[][]= {{400, 20}, {20, 200}, {20, 200}, {400, 20}}; 
boolean stage10Selected[] = {false, false, false, false};

String[] preSetName = {"Toast: White", "Toast: Golden", "Toast: Burnt"};
int[] preSetTime = {30, 120, 180};

int hourToMs = 3600000;
int minToMs = 60000;
int secToMs = 1000;
int countDown = 0;
int subtractor = 0;
int currentTime;
int time = 0;
boolean stage9Enter = false;
int shutoff = 0;
int borderStroke = 10;
int pauseSubtractor = 0;
int pauseTime = 0;
boolean mute = false;
boolean firstPause = false;

/////////////////////////////////////////////////////

void loadSounds() {
  // beep soundfile shortened from http://soundbible.com/2158-Text-Message-Alert-5.html

  //Processing load sound
  //beepSound = new SoundFile(this, "bing.mp3");

  // processing.js load sound
  beepSound.setAttribute("src", "bing.mp3");
}

void playBeep() {
  // play audio in processing or processing.js
  if (mute == false) {
    beepSound.play();
  }
}


void setup() {
  size(1280, 800);
  loadSounds();
}

void draw() {
  currentTime = millis() - subtractor;

  switch(stage) {
  case 0: 
    turnOn();
    break;
  case 1: 
    stage1();
    break;
  case 2: 
    stage2();
    break;
  case 3: 
    stage3();
    break;
  case 4: 
    stage4();
    break;
  case 5:
    stage5();
    break;
  case 6:
    stage6();
    break;
  case 7:
    stage7();
    break;
  case 8:
    preHeat();
    break;
  case 9:
    stage9();
    break;
  case 10:
    stage10();
    break;
  default: 
    turnOn();
    break;
  }
}

void turnOn() {
  noStroke();
  background(0);
  fill(127, 127, 127);
  ellipse(640, 400, 300, 300);
  fill(0, 102, 153);
  textSize(32);
  text("Turn ON", 580, 400);
}

// preset or custom
void stage1() {
  noStroke();
  background(0);
  oneButton();
  pause = false;
  stop = false;

  fill(127, 127, 127);
  rect(stage1Buttons[0][0], stage1Buttons[0][1], stage1ButtonX, stage1ButtonY, 10);
  textSize(20);
  fill(0, 102, 153);
  text(stage1Text[0], stage1Buttons[0][0], stage1Buttons[0][1] + 23);

  fill(127, 127, 127);
  rect(stage1Buttons[1][0], stage1Buttons[1][1], stage1ButtonX, stage1ButtonY, 10);
  textSize(20);
  fill(0, 102, 153);
  text(preSetName[0], stage1Buttons[1][0], stage1Buttons[1][1] + 23);

  fill(127, 127, 127);
  rect(stage1Buttons[1][0], stage1Buttons[1][1]+150, stage1ButtonX, stage1ButtonY, 10);
  textSize(20);
  fill(0, 102, 153);
  text(preSetName[1], stage1Buttons[1][0], stage1Buttons[1][1] + 23+150);


  fill(127, 127, 127);
  rect(stage1Buttons[1][0], stage1Buttons[1][1]+300, stage1ButtonX, stage1ButtonY, 10);
  textSize(20);
  fill(0, 102, 153);
  text(preSetName[2], stage1Buttons[1][0], stage1Buttons[1][1] + 23+300);
}

// mode selection
void stage2() {
  noStroke();
  background(0);
  threeButton();
  textSize(36);
  fill(0, 102, 153);
  text("Select mode", 500, 105);
  for (int i=0; i<stage4Buttons.length; i++) {
    fill(127, 127, 127);
    rect(stage4Buttons[i][0], stage4Buttons[i][1], stage4ButtonsX, stage4ButtonsY, 10);
    textSize(20);
    fill(0, 102, 153);
    text(stage4Text[i], stage4Buttons[i][0] + 5, stage4Buttons[i][1] + 23);
  }
  if (mode == 1) {
    fill(240, 255, 76);
    rect(stage4Buttons[0][0], stage4Buttons[0][1], stage4ButtonsX, stage4ButtonsY, 10);
    textSize(20);
    fill(0, 102, 153);
    text(stage4Text[0], stage4Buttons[0][0] + 5, stage4Buttons[0][1] + 23);
  }
  if (mode == 2) {
    fill(240, 255, 76);
    rect(stage4Buttons[1][0], stage4Buttons[1][1], stage4ButtonsX, stage4ButtonsY, 10);
    textSize(20);
    fill(0, 102, 153);
    text(stage4Text[1], stage4Buttons[1][0] + 5, stage4Buttons[1][1] + 23);
  }
  if (mode == 3) {
    fill(240, 255, 76);
    rect(stage4Buttons[2][0], stage4Buttons[2][1], stage4ButtonsX, stage4ButtonsY, 10);
    textSize(20);
    fill(0, 102, 153);
    text(stage4Text[2], stage4Buttons[2][0] + 5, stage4Buttons[2][1] + 23);
  }
  if (mode == 4) {
    fill(240, 255, 76);
    rect(stage4Buttons[3][0], stage4Buttons[3][1], stage4ButtonsX, stage4ButtonsY, 10);
    textSize(20);
    fill(0, 102, 153);
    text(stage4Text[3], stage4Buttons[3][0] + 5, stage4Buttons[3][1] + 23);
  }
  if (mode == 5) {
    fill(240, 255, 76);
    rect(stage4Buttons[4][0], stage4Buttons[4][1], stage4ButtonsX, stage4ButtonsY, 10);
    textSize(20);
    fill(0, 102, 153);
    text(stage4Text[4], stage4Buttons[4][0] + 5, stage4Buttons[4][1] + 23);
  }
  if (mode == 6) {
    fill(240, 255, 76);
    rect(stage4Buttons[5][0], stage4Buttons[5][1], stage4ButtonsX, stage4ButtonsY, 10);
    textSize(20);
    fill(0, 102, 153);
    text(stage4Text[5], stage4Buttons[5][0] + 5, stage4Buttons[5][1] + 23);
  }
}


// Temp selecting
void stage3() {
  noStroke();
  background(0);
  threeButton();
  textSize(36);
  fill(0, 102, 153);
  text("Set Temperature", 500, 105);
  for (int i=0; i<stage2Displays.length; i++) {
    fill(127, 127, 127);

    rect(stage2Displays[i][0], stage2Displays[i][1], stage2DisplayX, stage2DisplayY, 10);

    fill(221, 44, 44+i);
    triangle(stage2Displays[i][0], stage2Displays[i][1] - 20, stage2Displays[i][0] + stage2DisplayX, stage2Displays[i][1] - 20, stage2Displays[i][0] + (stage2DisplayX/2), stage2Displays[i][1] - 50);

    fill(0, 137+i, 229);
    triangle(stage2Displays[i][0], stage2Displays[i][1] + 20 + stage2DisplayY, stage2Displays[i][0] + stage2DisplayX, stage2Displays[i][1] + stage2DisplayY + 20, 
      stage2Displays[i][0] + (stage2DisplayX/2), stage2Displays[i][1] + 50 + stage2DisplayY);
  }
  String one;
  String ten; 
  String hundred;
  int holder = temp;
  one = floor(holder%10) + "";  
  holder = holder/10;
  ten = floor(holder%10) + "";  
  holder = holder/10;  
  hundred = floor(holder%10) + "";  
  holder = holder/10;
  textSize(36);
  fill(0, 102, 153);
  text(hundred, stage2Displays[0][0] + 30, stage2Displays[0][1] +100);
  text(ten, stage2Displays[1][0] + 30, stage2Displays[1][1] + 100);
  text(one, stage2Displays[2][0] + 30, stage2Displays[2][1] + 100);

  if (celsius == false) {

    fill(240, 255, 76);
    rect(900, 280, stage2DisplayX, stage2DisplayY/2, 10);
    textSize(36);
    fill(0, 102, 153);
    text("F", 900 + 30, 280 +50);
    fill(127, 127, 127);
    rect(900, 280 + (stage2DisplayY/2), stage2DisplayX, stage2DisplayY/2, 10);
    fill(0, 102, 153);
    text("C", 900 + 30, 280 +50+ (stage2DisplayY/2) );
  }
  if (celsius == true) {

    fill(127, 127, 127);
    rect(900, 280, stage2DisplayX, stage2DisplayY/2, 10);
    textSize(36);
    fill(0, 102, 153);
    text("F", 900 + 30, 280 +50);
    fill(240, 255, 76);
    rect(900, 280 + (stage2DisplayY/2), stage2DisplayX, stage2DisplayY/2, 10);
    fill(0, 102, 153);
    text("C", 900 + 30, 280 +50+ (stage2DisplayY/2) );
  }
}
//Time Selecting
void stage4() {
  noStroke();
  background(0);
  threeButton();
  textSize(36);
  fill(0, 102, 153);
  text("Set Time", 500, 105);

  for (int i=0; i<stage3Displays.length; i++) {
    fill(127, 127, 127);

    rect(stage3Displays[i][0], stage3Displays[i][1], stage3DisplayX, stage3DisplayY, 10);

    fill(221, 44, 44+i);
    triangle(stage3Displays[i][0], stage3Displays[i][1] - 20, stage3Displays[i][0] + stage3DisplayX, stage3Displays[i][1] - 20, stage3Displays[i][0] + (stage3DisplayX/2), stage3Displays[i][1] - 50);

    fill(0, 137+i, 229);
    triangle(stage3Displays[i][0], stage3Displays[i][1] + 20 + stage3DisplayY, stage3Displays[i][0] + stage3DisplayX, stage3Displays[i][1] + stage3DisplayY + 20, 
      stage3Displays[i][0] + (stage3DisplayX/2), stage3Displays[i][1] + 50 + stage3DisplayY);
  }
  int holder = hour;
  String hOne = floor(holder%10) + "";
  holder = holder/10;
  String hTen = floor(holder%10) + "";  
  holder = min;
  String mOne = floor(holder%10) + "";
  holder = holder/10;
  String mTen = floor(holder%10) + "";  
  holder = sec;
  String sOne = floor(holder%10) + "";
  holder = holder/10;
  String sTen = floor(holder%10) + "";  
  textSize(36);
  fill(0, 102, 153);
  text(hTen, stage3Displays[0][0] + 30, stage3Displays[0][1] + 100);
  text(hOne, stage3Displays[1][0] + 30, stage3Displays[1][1] + 100);
  text(mTen, stage3Displays[2][0] + 30, stage3Displays[2][1] + 100);
  text(mOne, stage3Displays[3][0] + 30, stage3Displays[3][1] + 100);
  text(sTen, stage3Displays[4][0] + 30, stage3Displays[4][1] + 100);
  text(sOne, stage3Displays[5][0] + 30, stage3Displays[5][1] + 100);


  countDown = (hour*hourToMs) + (min*minToMs) + (sec*secToMs);
}

//Comfirm page
void stage5() {
  noStroke();
  background(0);
  //threeButton();


  fill(127, 127, 127);
  rect(threeButtons[0][0], threeButtons[0][1], 100, 25, 10);
  textSize(20);
  fill(0, 102, 153);
  text(threeButtonText[0], threeButtons[0][0] + 5, threeButtons[0][1] + 23);


  fill(127, 127, 127);
  rect(threeButtons[2][0], threeButtons[2][1], 100, 25, 10);
  textSize(20);
  fill(0, 102, 153);
  text(threeButtonText[2], threeButtons[2][0] + 5, threeButtons[2][1] + 23);

  textSize(36);
  fill(0, 102, 153);
  String textTemp = "Time: " + (hour + "")+ ":" + (min+"") +  ":" +(sec+"");
  text(textTemp, 363, 236);
  if (mode == 6) {
    textTemp = "Temp: " + (temp + "");
    text(textTemp, 363, 276);
  } else {
    if (mode == 1) {
      text("Temp: Bake", 363, 276);
    }
    if (mode == 2) {
      text("Temp: Broil", 363, 276);
    }
    if (mode == 3) {
      text("Temp: Toast", 363, 276);
    }
    if (mode == 4) {
      text("Mode: Pizza", 363, 316);
    }
    if (mode == 5) {
      text("Mode: Bagel", 363, 316);
    }
  }

  if (mode == 1) {
    text("Mode: Bake", 363, 316);
  }
  if (mode == 2) {
    text("Mode: Broil", 363, 316);
  }
  if (mode == 3) {
    text("Mode: Toast", 363, 316);
  }
  if (mode == 4) {
    text("Mode: Pizza", 363, 316);
  }
  if (mode == 5) {
    text("Mode: Bagel", 363, 316);
  }
  if (mode == 6) {
    text("Mode: Custom", 363, 316);
  }
  for (int i = 0; i<stage5Buttons.length; i++) {
    fill(127, 127, 127);
    rect(stage5Buttons[i][0], stage5Buttons[i][1], stage1ButtonX, stage1ButtonY, 10);
    textSize(20);
    fill(0, 102, 153);
    text(stage5Text[i], stage5Buttons[i][0] + 5, stage5Buttons[i][1] + 23);
  }
  subtractor = millis();
}
// Counting cooking
void stage6() {
  noStroke();
  background(221, 44, 44);
  fill(0);
  int twoBS = borderStroke*2;
  rect(borderStroke, borderStroke, width-twoBS, height-twoBS);
  int remainingTime;
  if (stop == true ) {
    stage = 1;
    return;
  }
  if (pause == true) {
    if (firstPause == false) {
      pauseTime = currentTime-pauseSubtractor;
      firstPause = true;
    }
    pauseSubtractor = currentTime - pauseTime;
    remainingTime =  ((countDown) - pauseTime)/1000;
  } else {
    if (pauseSubtractor == currentTime) {
      pauseSubtractor = 0;
    }
    remainingTime =  floor(((countDown) - (currentTime-pauseSubtractor ))/1000);
    firstPause = false;
  }

  int tmp = remainingTime;
  int remainingHour = floor(tmp/3600);
  tmp = tmp - (hour*3600);
  int remainingMin = floor(tmp/60);
  tmp = tmp - (min*60);
  int remainingSec = tmp;


  fill(0, 102, 153);
  textSize(36);
  text("Time Remaining " + (remainingHour+":") +remainingMin+":"+remainingSec+":" , 500, 60);
  if (mode == 6)
    text("Inside Temp " + temp, 500, 100 );
  else {
    text("Inside Temp 300", 500, 100 );
  }
  if (remainingTime  == 0) {
    stage = 7;
    playBeep();
  }
  fill(127, 127, 127);
  rect(threeButtons[0][0], threeButtons[0][1], 100, 25, 10);
  textSize(20);
  fill(0, 102, 153);
  text("Pause", threeButtons[0][0] + 5, threeButtons[0][1] + 23);
  fill(127, 127, 127);
  rect(threeButtons[2][0], threeButtons[2][1], 100, 25, 10);
  textSize(20);
  fill(0, 102, 153);
  text("Stop", threeButtons[2][0] + 5, threeButtons[2][1] + 23);
}
//stage 8 preheat
void preHeat() {
  noStroke();
  background(0);
  threeButton();
  textSize(36);
  fill(0, 102, 153);
  text("Set Preheat Temperature", 500, 105);
  for (int i=0; i<stage2Displays.length; i++) {
    fill(127, 127, 127);

    rect(stage2Displays[i][0], stage2Displays[i][1], stage2DisplayX, stage2DisplayY, 10);

    fill(221, 44, 44+i);
    triangle(stage2Displays[i][0], stage2Displays[i][1] - 20, stage2Displays[i][0] + stage2DisplayX, stage2Displays[i][1] - 20, stage2Displays[i][0] + (stage2DisplayX/2), stage2Displays[i][1] - 50);

    fill(0, 137+i, 229);
    triangle(stage2Displays[i][0], stage2Displays[i][1] + 20 + stage2DisplayY, stage2Displays[i][0] + stage2DisplayX, stage2Displays[i][1] + stage2DisplayY + 20, 
      stage2Displays[i][0] + (stage2DisplayX/2), stage2Displays[i][1] + 50 + stage2DisplayY);
  }
  String one;
  String ten; 
  String hundred;
  int holder = preHeatTemp;
  one = floor(holder%10) + "";  
  holder = holder/10;
  ten = floor(holder%10) + "";  
  holder = holder/10;  
  hundred = floor(holder%10) + "";  
  holder = holder/10;
  textSize(36);
  fill(0, 102, 153);
  text(hundred, stage2Displays[0][0] + 30, stage2Displays[0][1] +100);
  text(ten, stage2Displays[1][0] + 30, stage2Displays[1][1] + 100);
  text(one, stage2Displays[2][0] + 30, stage2Displays[2][1] + 100);
}
//Count Down done
void stage7() {
  noStroke();
  background(221, 44, 44);
  fill(0, 0, 0);
  int twoBS = borderStroke*2;
  rect(borderStroke, borderStroke, width-twoBS, height-twoBS);

  fill(127, 127, 127);
  rect(550, 350, 200, 75, 10);
  fill(0, 102, 153);
  textSize(36);
  fill(0, 102, 153);
  text("Done", 580, 400);
  text("open Door/Push Done", 450, 460);
  if (millis() - time >= 2000) {
    noStroke();
    background(0);
    playBeep();
    time = millis();
  }
}
//After preheat
void stage9() {
  noStroke();
  background(0);
  threeButton();
  fill(0, 102, 153);
  text("PreHeating Done Place in Food", 300, 400);
  if (stage9Enter == false) {
    stage9Enter = true;
    shutoff = millis();
  }
  if (millis() - shutoff >= 10000) {

    playBeep();
    stage = 0;
  }
}
//Custom Mode
void stage10() {

  background(0);
  threeButton();
  fill(127, 127, 127);
  for (int i= 0; i<stage10Buttons.length; i++) {
    if (stage10Selected[i] == true) {
      fill(221, 44, 44);
    } else {
      fill(127, 127, 127);
    }
    rect(stage10Buttons[i][0], stage10Buttons[i][1], stage10Size[i][0], stage10Size[i][1], 10);
  }
}
void threeButton() {
  for (int loopCounter=0; loopCounter < threeButtons.length; loopCounter++) {
    fill(127, 127, 127);
    rect(threeButtons[loopCounter][0], threeButtons[loopCounter][1], 100, 25, 10);
    textSize(20);
    fill(0, 102, 153);
    text(threeButtonText[loopCounter], threeButtons[loopCounter][0] + 5, threeButtons[loopCounter][1] + 23);
  }
}
void oneButton() {
  fill(127, 127, 127);
  rect(threeButtons[2][0], threeButtons[2][1], 100, 25, 10);

  textSize(20);
  fill(0, 102, 153);
  text("Cancel", threeButtons[2][0] + 5, threeButtons[2][1] + 23);


  if (mute == true) {
    fill(0, 102, 153);
  } else {
    fill(127, 127, 127);
  }
  rect(threeButtons[0][0], threeButtons[0][1], 100, 25, 10);
  textSize(20);

  fill(244, 215, 66);


  text("Mute", threeButtons[0][0] + 5, threeButtons[0][1] + 23);
}


void mouseReleased() {
  if (stage == 0 && overCircle(640, 400, 300)) {
    playBeep();
    stage = 1;
  }
  if (stage == 1) {
    if (overRec(threeButtons[2][0], threeButtons[2][1], threeButtonX, threeButtonY)) {
      playBeep();
      stage = 0;
    }
    if (overRec(threeButtons[0][0], threeButtons[0][1], threeButtonX, threeButtonY)) {
      mute = !mute;
      playBeep();
    }
    if (overRec(stage1Buttons[0][0], stage1Buttons[0][1], stage1ButtonX, stage1ButtonY)) {
      playBeep();
      stage = 2;
    }
    if (overRec(stage1Buttons[1][0], stage1Buttons[1][1], stage1ButtonX, stage1ButtonY)) {
      playBeep();
      int tmp = preSetTime[0];
      hour = floor(tmp/3600);
      timeCounter[0] = floor(hour/10);
      timeCounter[1] = floor(hour%10);
      tmp = tmp - (hour*3600);
      min = floor(tmp/60);
      timeCounter[2] = floor(min/10);
      timeCounter[3] = floor(min%10);
      tmp = tmp - (min*60);
      sec = tmp;

      timeCounter[4] = floor(sec/10);
      timeCounter[5] = floor(sec%10);

      countDown = (hour*hourToMs) + (min*minToMs) + (sec*secToMs);
      mode = 3;
      stage = 5;
    }
    if (overRec(stage1Buttons[1][0], stage1Buttons[1][1]+150, stage1ButtonX, stage1ButtonY)) {
      playBeep();
      int tmp = preSetTime[1];
      hour = floor(tmp/3600);
      timeCounter[0] = floor(hour/10);
      timeCounter[1] = floor(hour%10);
      tmp = tmp - (hour*3600);
      min = floor(tmp/60);
      timeCounter[2] = floor(min/10);
      timeCounter[3] = floor(min%10);
      tmp = tmp - (min*60);
      sec = tmp;
      timeCounter[4] = floor(sec/10);
      timeCounter[5] = floor(sec%10);

      countDown = (hour*hourToMs) + (min*minToMs) + (sec*secToMs);
      mode = 3;
      stage = 5;
    }
    if (overRec(stage1Buttons[1][0], stage1Buttons[1][1]+300, stage1ButtonX, stage1ButtonY)) {
      playBeep();
      int tmp = preSetTime[2];
      hour = floor(tmp/3600);
      timeCounter[0] = floor(hour/10);
      timeCounter[1] = floor(hour%10);
      tmp = tmp - (hour*3600);
      min = floor(tmp/60);
      timeCounter[2] = floor(min/10);
      timeCounter[3] = floor(min%10);
      tmp = tmp - (min*60);
      sec = tmp;
      timeCounter[4] = floor(sec/10);
      timeCounter[5] = floor(sec%10);

      countDown = (hour*hourToMs) + (min*minToMs) + (sec*secToMs);
      mode = 3;
      stage = 5;
    }
  }

  if (stage !=1 && stage != 0 && stage != 6 && stage != 5 && stage != 7 && stage != 8) {
    if (overRec(threeButtons[2][0], threeButtons[2][1], threeButtonX, threeButtonY)) {
      playBeep();
      stage = 0;
    }
    if (overRec(threeButtons[1][0], threeButtons[1][1], threeButtonX, threeButtonY)) {
      playBeep();
      if (stage == 3) {
        if (temp != 0 || (mode >0 && mode < 6))
          stage++;
      } else if (stage == 4) {
        if (countDown != 0)
          stage++;
      } else if (stage == 2) {
        if (mode != 0)
          if (mode == 6)
            stage++;
          else
            stage = 4;
      } else if (stage == 8) {
        if (preHeatTemp != 0)
          stage++;
      } else if (stage == 9) {
        stage = 6;
      } else if (stage == 10) {
        stage = 3;
      } else {
        stage++;
      }
    }
    if (overRec(threeButtons[0][0], threeButtons[0][1], threeButtonX, threeButtonY)) {
      playBeep();
      if (stage == 10) {
        stage = 2;
        mode = 0;
      } else {
        stage--;
      }
    }
  }

  if (stage == 3) {
    //increase by 100
    if (overColor(221, 44, 44)) {
      playBeep();
      temp = temp + 100;
      counter[0]++;
      if (counter[0] == 10) {
        counter[0] = 0;
        temp = temp - 1000;
      }
    }
    //increase by 10
    if (overColor(221, 44, 45)) {
      playBeep();
      temp = temp + 10;
      counter[1]++;
      if (counter[1] == 10) {
        counter[1] = 0;
        temp = temp - 100;
      }
    }
    //increase by 1
    if (overColor(221, 44, 46)) {
      playBeep();
      temp = temp + 1;
      counter[2]++;
      if (counter[2] == 10) {
        counter[2] = 0;
        temp = temp - 10;
      }
    }
    //decrease by 100
    if (overColor(0, 137, 229)) {
      playBeep();
      temp = temp - 100;
      counter[0]--;
      if (counter[0] == -1) {
        counter[0] = 9;
        temp = temp + 1000;
      }
    }
    //decrease by 10
    if (overColor(0, 138, 229)) {
      playBeep();
      temp = temp - 10;
      counter[1]--;
      if (counter[1] == -1) {
        counter[1] = 9;
        temp = temp + 100;
      }
    }
    //decrease by 1
    if (overColor(0, 139, 229)) {
      playBeep();
      temp = temp - 1;
      counter[2]--;
      if (counter[2] == -1) {
        counter[2] = 9;
        temp = temp + 10;
      }
    }

    //if(temp > 999){
    // temp = 999;
    //}
    if (temp < 0) {
      temp = 0;
    }

    if (overRec(900, 280, stage2DisplayX, stage2DisplayY/2)) {
      celsius = false;
      playBeep();
    }
    if (overRec(900, 280 + (stage2DisplayY/2), stage2DisplayX, stage2DisplayY/2)) {
      celsius = true;
      playBeep();
    }
  }
  if (stage == 4) {
    //hour + 10 
    if (overColor(221, 44, 44)) {
      playBeep();
      hour = hour + 10;
      timeCounter[0]++;
      if (timeCounter[0] == 10) {
        hour = hour - 100;
        timeCounter[0] = 0;
      }
    } 
    if (overColor(0, 137, 229)) {
      playBeep();
      hour = hour - 10;
      timeCounter[0]--;
      if (timeCounter[0] == -1) {
        hour = hour + 100;
        timeCounter[0] = 9;
      }
    }
    //hour + 1
    if (overColor(221, 44, 45)) {
      playBeep();
      hour = hour + 1;
      timeCounter[1]++;
      if ( timeCounter[1] == 10) {
        hour = hour - 10;
        timeCounter[1] = 0;
      }
    }
    //hour - 1
    if (overColor(0, 138, 229)) {
      playBeep();
      hour = hour - 1;
      timeCounter[1]--;
      if ( timeCounter[1] == -1) {
        hour = hour + 10;
        timeCounter[1] = 9;
      }
    }
    //min + 10
    if (overColor(221, 44, 46)) {
      playBeep();
      min = min + 10;
      timeCounter[2]++;
      if ( timeCounter[2] == 6) {
        min = min - 60;
        timeCounter[2] = 0;
      }
    }
    //min - 10
    if (overColor(0, 139, 229)) {
      playBeep();
      min = min - 10;
      timeCounter[2]--;
      if ( timeCounter[2] == -1) {
        min = min + 60;
        timeCounter[2] = 5;
      }
    }
    //min + 1
    if (overColor(221, 44, 47)) {
      playBeep();
      min = min + 1;
      timeCounter[3]++;
      if ( timeCounter[3] == 10) {
        min = min - 10;
        timeCounter[3] = 0;
      }
    }
    if (overColor(0, 140, 229)) {
      playBeep();
      min = min - 1;
      timeCounter[3]--;
      if ( timeCounter[3] == -1) {
        min = min + 10;
        timeCounter[3] = 9;
      }
    }
    //sec +10
    if (overColor(221, 44, 48)) {
      playBeep();
      sec = sec + 10;
      timeCounter[4]++;
      if ( timeCounter[4] == 6) {
        sec = sec - 60;
        timeCounter[4] = 0;
      }
    }
    if (overColor(0, 141, 229)) {
      playBeep();
      sec = sec - 10;
      timeCounter[4]--;
      if ( timeCounter[4] == -1) {
        sec = sec + 60;
        timeCounter[4] = 5;
      }
    }
    //sec + 1
    if (overColor(221, 44, 49)) {
      playBeep();
      sec = sec + 1;
      timeCounter[5]++;
      if ( timeCounter[5] == 10) {
        sec = sec - 10;
        timeCounter[5] = 0;
      }
    }
    if (overColor(0, 142, 229)) {
      playBeep();
      sec = sec - 1;
      timeCounter[5]--;
      if ( timeCounter[5] == -1) {
        sec = sec + 10;
        timeCounter[5] = 9;
      }
    }
  }
  if (stage == 2) {
    if (overRec(stage4Buttons[0][0], stage4Buttons[0][1], stage4ButtonsX, stage4ButtonsY)) {
      mode = 1;
    }
    if (overRec(stage4Buttons[1][0], stage4Buttons[1][1], stage4ButtonsX, stage4ButtonsY)) {
      mode = 2;
    }
    if (overRec(stage4Buttons[2][0], stage4Buttons[2][1], stage4ButtonsX, stage4ButtonsY)) {
      mode = 3;
    }
    if (overRec(stage4Buttons[3][0], stage4Buttons[3][1], stage4ButtonsX, stage4ButtonsY)) {
      mode = 4;
    }
    if (overRec(stage4Buttons[4][0], stage4Buttons[4][1], stage4ButtonsX, stage4ButtonsY)) {
      mode = 5;
    }
    if (overRec(stage4Buttons[5][0], stage4Buttons[5][1], stage4ButtonsX, stage4ButtonsY)) {
      mode = 6;
      stage = 10;
    }
  }

  if (stage == 5 ) {
    if (overRec(stage5Buttons[0][0], stage5Buttons[0][1], stage1ButtonX, stage1ButtonY)) {
      stage = 8;
    }
    if (overRec(stage5Buttons[1][0], stage5Buttons[1][1], stage1ButtonX, stage1ButtonY)) {
      stage++;
    }
    if (overRec(threeButtons[0][0], threeButtons[0][1], threeButtonX, threeButtonY)) {
      stage--;
    }
    if (overRec(threeButtons[2][0], threeButtons[2][1], threeButtonX, threeButtonY)) {
      stage = 0;
    }
  }
  if (stage == 6) {
    if (overRec(threeButtons[0][0], threeButtons[0][1], threeButtonX, threeButtonY)) {
      playBeep();
      pause = !pause;
    }

    if (overRec(threeButtons[2][0], threeButtons[2][1], threeButtonX, threeButtonY)) {
      playBeep();
      stop = !stop;
    }
  }

  if (stage == 8) {
    //increase by 100
    if (overColor(221, 44, 44)) {
      playBeep();
      preHeatTemp = preHeatTemp + 100;
      preHeatCounter[0]++;
      if (preHeatCounter[0] == 10) {
        preHeatCounter[0] = 0;
        preHeatTemp = preHeatTemp - 1000;
      }
    }
    //increase by 10
    if (overColor(221, 44, 45)) {
      playBeep();
      preHeatTemp = preHeatTemp + 10;
      preHeatCounter[1]++;
      if (preHeatCounter[1] == 10) {
        preHeatCounter[1] = 0;
        preHeatTemp = preHeatTemp - 100;
      }
    }
    //increase by 1
    if (overColor(221, 44, 46)) {
      playBeep();
      preHeatTemp = preHeatTemp + 1;
      preHeatCounter[2]++;
      if (preHeatCounter[2] == 10) {
        preHeatCounter[2] = 0;
        preHeatTemp = preHeatTemp - 10;
      }
    }
    //decrease by 100
    if (overColor(0, 137, 229)) {
      playBeep();
      preHeatTemp = preHeatTemp - 100;
      preHeatCounter[0]--;
      if (preHeatCounter[0] == -1) {
        preHeatCounter[0] = 9;
        preHeatTemp = preHeatTemp + 1000;
      }
    }
    //decrease by 10
    if (overColor(0, 138, 229)) {
      playBeep();
      preHeatTemp = preHeatTemp - 10;
      preHeatCounter[1]--;
      if (preHeatCounter[1] == -1) {
        preHeatCounter[1] = 9;
        preHeatTemp = preHeatTemp + 100;
      }
    }
    //decrease by 1
    if (overColor(0, 139, 229)) {
      playBeep();
      preHeatTemp = preHeatTemp - 1;
      preHeatCounter[2]--;
      if (preHeatCounter[2] == -1) {
        preHeatCounter[2] = 9;
        preHeatTemp = preHeatTemp + 10;
      }
    }

    //if(temp > 999){
    // temp = 999;
    //}
    if (preHeatTemp < 0) {
      preHeatTemp = 0;
    }
    if (overRec(threeButtons[2][0], threeButtons[2][1], threeButtonX, threeButtonY)) {
      playBeep();
      stage = 0;
    }
    if (overRec(threeButtons[1][0], threeButtons[1][1], threeButtonX, threeButtonY)) {
      playBeep();
      if (preHeatTemp != 0)
        stage = 9;
    }
    if (overRec(threeButtons[0][0], threeButtons[0][1], threeButtonX, threeButtonY)) {
      playBeep();
      stage = 5;
    }
  }
  if (stage == 7) {
    if (overRec(550, 350, 200, 75)) {
      stage = 0;
    }
  }

  if (stage == 10) {
    if (overRec(stage10Buttons[0][0], stage10Buttons[0][1], stage10Size[0][0], stage10Size[0][1])) {
      stage10Selected[0] = !stage10Selected[0];
      playBeep();
    }
    if (overRec(stage10Buttons[1][0], stage10Buttons[1][1], stage10Size[1][0], stage10Size[1][1])) {
      stage10Selected[1] = !stage10Selected[1];
      playBeep();
    }
    if (overRec(stage10Buttons[2][0], stage10Buttons[2][1], stage10Size[2][0], stage10Size[2][1])) {
      stage10Selected[2] = !stage10Selected[2];
      playBeep();
    }
    if (overRec(stage10Buttons[3][0], stage10Buttons[3][1], stage10Size[3][0], stage10Size[3][1])) {
      stage10Selected[3] = !stage10Selected[3];
      playBeep();
    }
  }
}

boolean overRec(int x, int y, int w, int h) {
  if ((mouseX > x) && (mouseX < x+w)
    && (mouseY > y) && (mouseY <y+h)) {
    return true;
  }
  return false;
}

boolean overColor(int r, int g, int b) {
  if (this.get(mouseX, mouseY)== color(r, g, b))
    return true;

  return false;
}


//https://processing.org/examples/button.html
boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}