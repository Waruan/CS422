// GROUP: Tran Dao, Weiheng Ruan, Jason Lee

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// sample simple processing / processing.js file from Andy Johnson - CS 422 - Spring 2017

// one current issue is dealing with sounds between Processing and Processing.js
// without compiler directives its hard to easily comment in and out the two different versions

// the external sound library (Sketch / Import Library / Sound) will work in processing but not in processing.js
// uncomment these two lines to get audio in Processing
import processing.sound.*;
SoundFile beepSound;

// here is a processing.js solution from http://aaron-sherwood.com/processingjs/circleSound.html
// uncomment this line to get audio in Processing.js
// Audio beepSound = new Audio();

// also note the soundfile needs to be in the data folder for processing and outside that folder for Processing.js
// sounds are also a bit slowerer to start up in Processing.js

// placeholder for future image
PImage img[] = new PImage[10];

// some buttons
int[][] buttons = { {50, 100}, {50, 200}, {50, 300}, {50, 400}, {50, 500}};
int buttonX = 100;
int buttonY = 50;
int allstagebuttonX = 100;
int allstagebuttonY = 25;
int stage = 0;
int[][] allstagebuttons={ {0, 700},{560, 700}, {1180, 700}};
String[] allstagebuttonText = {"back","OK","cancel" };
int[][] stage1buttons = { {124, 83},{415,83}};
int[][] stage2buttons = { {640, 400}};

// no buttons / mode currently selected
int selectedOne = -1;


/////////////////////////////////////////////////////

void loadSounds() {
  // beep soundfile shortened from http://soundbible.com/2158-Text-Message-Alert-5.html

  //Processing load sound
  beepSound = new SoundFile(this, "bing.mp3");

  // processing.js load sound
  //beepSound.setAttribute("src","bing.mp3");
}

void playBeep() {
  // play audio in processing or processing.js
  beepSound.play();
}


void setup() {
  size(1280, 800);
  loadSounds();
}

void draw() {
  if (stage == 0) {
    turnOn();
  }
  if(stage == 1){
    stage1();
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

void stage1() {
  noStroke();
  background(0);
  allstage();
  for (int loopCounter=0; loopCounter < stage1buttons.length; loopCounter++){
    fill(127, 127, 127);
    rect(stage1buttons[loopCounter][0], stage1buttons[loopCounter][1], 150, 75, 10);
  }
}

void allstage(){
  for (int loopCounter=0; loopCounter < allstagebuttons.length; loopCounter++){
    fill(127, 127, 127);
    rect(allstagebuttons[loopCounter][0], allstagebuttons[loopCounter][1], 100, 25, 10);
    textSize(20);
    fill(0, 102, 153);
    text(allstagebuttonText[loopCounter], allstagebuttons[loopCounter][0] + 5, allstagebuttons[loopCounter][1] + 23);
  }
}

void mouseReleased() {
  if (stage == 0 && overCircle(640, 400, 300)) {
    playBeep();
    stage = 1;
  }
  if(stage == 1){
    for(int i=0;i< allstagebuttons.length;i++){
      if(overRec(allstagebuttons[i][0],allstagebuttons[i][1],allstagebuttonX,allstagebuttonY)){
        playBeep();
        if(i == 0 || i == 2){
          stage = 0;
        }
        else if(i == 1){
          stage = 2;
        }
        
      }
    }
  }
}

boolean overRec(int x,int y,int w, int h){
  if ((mouseX > x) && (mouseX < x+w)
      && (mouseY > y) && (mouseY <y+h)){
        return true;
  }
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