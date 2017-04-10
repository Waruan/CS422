

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// sample simple processing / processing.js file from Andy Johnson - CS 422 - Spring 2017

// one current issue is dealing with sounds between Processing and Processing.js
// without cbompiler directives its hard to easily comment in and out the two different versions

// the external sound library (Sketch / Import Library / Sound) will work in processing but not in processing.js
// uncomment these two lines to get audio in Processing
import processing.sound.*;
SoundFile beepSound;
//@pjs preload="silver.jpg";
// here is a processing.js solution from http://aaron-sherwood.com/processingjs/circleSound.html
// uncomment this line to get audio in Processing.js
//Audio beepSound = new Audio();

// also note the soundfile needs to be in the data folder for processing and outside that folder for Processing.js
// sounds are also a bit slowerer to start up in Processing.js


//Variable for general infomation
////////////////////////////////////////////////////////////

//buttons size for icons
int buttonX = 33;
int buttonY = 30;



//0 = start screen
//1 = profile selection
//2 = login 
//3 = Exsitng User display
//4 = guest User display
int stage = 3;

// evl monitor size
float canvasWidth = 2732;
float canvasHeight = 1536;

// scale down for home monitors
//float canvasWidth = 1366;
//float canvasHeight = 768;

int currentTime;

PFont f;

Popup currentPopup;

//by default 0 is guest user

int whichUser = 0;
//////////////////////////////////////////////////////////////////


//Variable relate to dragging of popup
/////////////////////////////////////////////////////////////////////////

boolean boxInUse = false;
int functionInUse;


float dragX;
float dragY;


float dragDifx;
float dragDify;


float originalX;
float originalY;


boolean drag = false;

float x_drag = (canvasWidth/29)*2;
float y_drag = (canvasHeight/29)*3;

float drag_box_width = canvasWidth - ((canvasWidth/29)*4);
float drag_box_height = canvasHeight - ((canvasHeight/29)*7);

Timer timer = new Timer(2000);
//////////////////////////////////////////////////////////////////////////////


//Variable for icon drag
/////////////////////////////////////////////////////////////////////////////////

boolean iconDrag = false;
float iconX_drag = (canvasWidth/29)*2;
float iconY_drag = (canvasHeight/29)*20 + 300;

float iconDrag_box_width = canvasWidth - ((canvasWidth/29)*4);
float iconDrag_box_height = canvasHeight - ((canvasHeight/29)*18);
int iconIndex;

float iconDragDifx;
float iconDragDify;

/////////////////////////////////////////////////////////////////////////////////
//Variable relate to Pin
//////////////////////////////////////////////////////////////////////////////////////
ImageButtons button0;
ImageButtons button1;
ImageButtons button2;
ImageButtons button3;
ImageButtons button4;
ImageButtons button5;
ImageButtons button6;
ImageButtons button7;
ImageButtons button8;
ImageButtons button9;
ImageButtons buttonpinBack;
ImageButtons buttonpinOk;
int buttonSize = 90;
int pinFlag = 0;  //A flag that you keep to track how many buttons are pressed.
int pinSpace = 0; //The space of the stars when they are printed
String pin = ""; //Keeps track of the pins and stores them
String pinRep = ""; //Represents the stars in the pin and how many there are by storing the number
boolean isPressed = false;

/////////////////////////////////////////////////////////////////////////////////////////////


// placeholder for future image
PImage img;
PImage bgroundimg;


float xLocation = int((canvasWidth/100)*40);
float yLocation = int((canvasHeight/100)*40); 

//Size of popup or popups
int popUpX = int((canvasWidth/100)*20);
int popUpY = int((canvasHeight/100)*20);

//Size for 9gag display
int gagWidth = int((canvasWidth/100)*20);
int gagHeight = int((canvasHeight/100)*40);

// Old code before creating user class
/////////////////////////////////////////////////////////////////////////
//Hide button
boolean isHidden = false;
//Button hid = new Button(int((canvasWidth - buttonX) - ((canvasWidth/100) *2)),int((canvasHeight- buttonY) - ((canvasHeight/100) *2)),buttonX,buttonY,-1);
//ArrayList<Button> buttons = new ArrayList<Button>();
//ArrayList<Integer> functionActive = new ArrayList<Integer>();

/////////////////////////////////////////////////////////////////////////



//Profiles
//////////////////////////////////////////////////////////////////////////
ArrayList<Button> profile = new ArrayList<Button>();
CircleButton newUserButton;

ArrayList<User> userList = new ArrayList<User>();



//////////////////////////////////////////////////////////////////////////




//Sounds
/////////////////////////////////////////////////////

void loadSounds(){
  // beep soundfile shortened from http://soundbible.com/2158-Text-Message-Alert-5.html
  
  //Processing load sound
  //beepSound = new SoundFile(this, "bing.mp3");
  
  // processing.js load sound
  //beepSound.setAttribute("src","bing.mp3");
}

void playBeep() {
  // play audio in processing or processing.js
  //beepSound.play();
}

/////////////////////////////////////////////////////

// Setup the image and button location for pin input
void pinSetup()

{

  

  background(102, 102, 102);
  
  // Define and create image button

  PImage but0 = loadImage("Data/pin0.png");
  
  but0.resize(66, 30);
  
  PImage but1 = loadImage("Data/pin1.png");
  
  but1.resize(66, 30);

  PImage but2 = loadImage("Data/pin2.png");
  
  but2.resize(66, 30);

  PImage but3 = loadImage("Data/pin3.png");
  
  but3.resize(66, 30);
  
  PImage but4 = loadImage("Data/pin4.png");
  
  but4.resize(66, 30);
  
  PImage but5 = loadImage("Data/pin5.png");
  
  but5.resize(66, 30);
  
  PImage but6 = loadImage("Data/pin6.png");
  
  but6.resize(66, 30);
  
  PImage but7 = loadImage("Data/pin7.png");
  
  but7.resize(66, 30);
  
  PImage but8 = loadImage("Data/pin8.png");
  
  but8.resize(66, 30);
  
  PImage but9 = loadImage("Data/pin9.png");
  
  but9.resize(66, 30);
  
  PImage butpinBack = loadImage("Data/pinback.png");
  
  butpinBack.resize(66, 30);
  
  PImage butpinOk = loadImage("Data/pinok.png");
  
  butpinOk.resize(66, 30);
  
  PImage butpin0Changed = loadImage("Data/pin0changed.gif");
  
  butpin0Changed.resize(66, 30);
  
  PImage butpin1Changed = loadImage("Data/pin1changed.gif");
  
  butpin1Changed.resize(66, 30);
  
  PImage butpin2Changed = loadImage("Data/pin2changed.gif");
  
  butpin2Changed.resize(66, 30);
  
  PImage butpin3Changed = loadImage("Data/pin3changed.gif");
  
  butpin3Changed.resize(66, 30);
  
  PImage butpin4Changed = loadImage("Data/pin4changed.gif");
  
  butpin4Changed.resize(66, 30);
  
  PImage butpin5Changed = loadImage("Data/pin5changed.gif");
  
  butpin5Changed.resize(66, 30);
  
  PImage butpin6Changed = loadImage("Data/pin6changed.gif");
  
  butpin6Changed.resize(66, 30);
  
  PImage butpin7Changed = loadImage("Data/pin7changed.gif");
  
  butpin7Changed.resize(66, 30);
  
  PImage butpin8Changed = loadImage("Data/pin8changed.gif");
  
  butpin8Changed.resize(66, 30);
  
  PImage butpin9Changed = loadImage("Data/pin9changed.gif");
  
  butpin9Changed.resize(66, 30);
  
  PImage butpinbackChanged = loadImage("Data/pinbackchanged.gif");
  
  butpinbackChanged.resize(66, 30);
  
  PImage butpinokChanged = loadImage("Data/pinokchanged.gif");
  
  butpinokChanged.resize(66, 30);
  
  int x0 = (int)canvasWidth/3 + buttonSize/2+158;
  
  int x = (int)canvasWidth/3 + buttonSize/2+78;
  
  int x2 = (int)canvasWidth/3 + buttonSize/2+158;

  int x3 = (int)canvasWidth/3 + buttonSize/2+238;
  
  int x4 = (int)canvasWidth/3 + buttonSize/2+78;
  
  int x5 = (int)canvasWidth/3 + buttonSize/2+158;
  
  int x6 = (int)canvasWidth/3 + buttonSize/2+238;
  
  int x7 = (int)canvasWidth/3 + buttonSize/2+78;
  
  int x8 = (int)canvasWidth/3 + buttonSize/2+158;
  
  int x9 = (int)canvasWidth/3 + buttonSize/2+238;
  
  int x10 = (int)canvasWidth/3 + buttonSize/2+78;
  
  int x11 = (int)canvasWidth/3 + buttonSize/2+238;
  
  int y0 = (int)canvasHeight/4+buttonSize+200;
  
  int y = (int)canvasHeight/4+buttonSize+80;
  
  int y2 = (int)canvasHeight/4+buttonSize+80;
  
  int y3 = (int)canvasHeight/4+buttonSize+80;
  
  int y4 = (int)canvasHeight/4+buttonSize+120;
  
  int y5 = (int)canvasHeight/4+buttonSize+120;
  
  int y6 = (int)canvasHeight/4+buttonSize+120;
  
  int y7 = (int)canvasHeight/4+buttonSize+160;
  
  int y8 = (int)canvasHeight/4+buttonSize+160;
  
  int y9 = (int)canvasHeight/4+buttonSize+160;
  
  int y10 = (int)canvasHeight/4+buttonSize+200;
  
  int y11 = (int)canvasHeight/4+buttonSize+200;

  int w0 = 66;
 
  int w = 66;

  int w2 = 66;
  
  int w3 = 66;
  
  int w4 = 66;
  
  int w5 = 66;
  
  int w6 = 66;
  
  int w7 = 66;
  
  int w8 = 66;
  
  int w9 = 66;
  
  int w10 = 66;
  
  int w11 = 66;

  int h0 = 30;
  
  int h =  30;

  int h2 = 30;
  
  int h3 = 30;
  
  int h4 = 30;
  
  int h5 = 30;
  
  int h6 = 30;
  
  int h7 = 30;
  
  int h8 = 30;
  
  int h9 = 30;
  
  int h10 = 30;
  
  int h11 = 30;
  
  button0 = new ImageButtons(x0, y0, w0, h0, but0, but0, butpin0Changed, "0");
  button1 = new ImageButtons(x, y, w, h, but1, but1, butpin1Changed, "1");
  button2 = new ImageButtons(x2, y2, w2, h2, but2, but2, butpin2Changed, "2");
  button3 = new ImageButtons(x3, y3, w3, h3, but3, but3, butpin3Changed, "3");
  button4 = new ImageButtons(x4, y4, w4, h4, but4, but4, butpin4Changed, "4");
  button5 = new ImageButtons(x5, y5, w5, h5, but5, but5, butpin5Changed, "5");
  button6 = new ImageButtons(x6, y6, w6, h6, but6, but6, butpin6Changed, "6");
  button7 = new ImageButtons(x7, y7, w7, h7, but7, but7, butpin7Changed, "7");
  button8 = new ImageButtons(x8, y8, w8, h8, but8, but8, butpin8Changed, "8");
  button9 = new ImageButtons(x9, y9, w9, h9, but9, but9, butpin9Changed, "9");
  buttonpinBack = new ImageButtons(x10, y10, w10, h10, butpinBack, butpinBack, butpinbackChanged, "back");
  buttonpinOk = new ImageButtons(x11, y11, w11, h11, butpinOk, butpinOk, butpinokChanged, "ok");
  f = createFont("Arial",16,true);
  textSize(20);
  fill(102);
  rect((int)canvasWidth/4 + 300,(int)canvasHeight/3,95,40);
  fill(0);
  text("Please Enter Pin:", (int)canvasWidth/4 + 265, (int)canvasHeight/3 - 20);
 
}





void setup() {
  
  size(canvasWidth, canvasHeight);
  //size( 1366 ,768);

  
  //fixOrderofButton(guest.buttonSet,guest.usrFunctionActive);
  
  
  User guest = new User("guest","0000");
  userList.add(guest);
  userList.get(0).addButton(4);
  f = createFont("Arial",24,true);
  background(255);
  loadSounds();
  stroke(126);
  
  
  //Profile Setup
  //////////////////////////////////////////////////
  
  Button temp = new Button(int((canvasWidth/100)*49.5 - buttonX), int((canvasHeight/100)*90) ,66,30,0);
  profile.add(temp);
  addProfileButton(profile,66,30,1);
  int index = findMostRight(profile);
  newUserButton = new CircleButton(int(index+66+(2*(canvasWidth/100))),temp.y_Axis+15, 30, 30);
  
  
  addProfileButton(profile,66,30,-2);
  //////////////////////////////////////////////////
  pinSetup();
}

/////////////////////////////////////////////////////


void draw() {
  if(stage == 0){
    startDraw();
  }
  else if(stage == 1){
    profileDraw();
  }
  else if(stage == 2){
    pinDraw();
  }
  else if(stage == 3){
    
    userScreenDraw(userList.get(whichUser));
    
  }
  else if(stage == 4){
    //change to genric displayDraw 
   
  }

}
// Draw the pin on to the canvas
void pinDraw()
{
  String timeString;

  background(255); 
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  drawGrid();
  noStroke();
  
  
  // draw the active button in a different color
  fill(127,127,0);

  textFont(f);
  textSize(36);
  fill(127,127,127);
  textAlign(CENTER);
  
  timeString = getCurrentTime();
  text(timeString, (canvasWidth/100)*5 , 50);
  fill(0);
  for(int i = 0;i<pinFlag ;i++){
    
    text("*",(int)canvasWidth/4 + 315 + pinSpace - (15 * i), (int)canvasHeight/3 + 45);
   
  }
  
  button0.update();
  
  button1.update();
  
  button2.update();
  
  button3.update();
  
  button4.update();
  
  button5.update();
  
  button6.update();
  
  button7.update();
  
  button8.update();
  
  button9.update();
  
  buttonpinBack.update();
  
  buttonpinOk.update();
  
  button0.display();

  button1.display();
  
  button2.display();
  
  button3.display();
  
  button4.display();
  
  button5.display();
  
  button6.display();
  
  button7.display();
  
  button8.display();
  
  button9.display();
  
  buttonpinBack.display();
  
  buttonpinOk.display();
  
  fill(127,127,127);
  
   text("Enter Pin ", (canvasWidth/100)*50 , (canvasHeight/100)*40);
  
  Button temp;
  for (int loopCounter=0; loopCounter < profile.size(); loopCounter++){
    temp = profile.get(loopCounter);
    rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
  } 
  temp = profile.get(profile.size()-1);
  
   
  ellipse(newUserButton.x_Axis,newUserButton.y_Axis,newUserButton.width, newUserButton.height);
  
  
}


// Drawing the starting Screen
void startDraw(){
  String timeString;

  background(255); 
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  //drawGrid();
  noStroke();
  
  
  // draw the active button in a different color
  fill(127,127,0);

  textFont(f);
  textSize(36);
  fill(127,127,127);
  textAlign(CENTER);
  
  timeString = getCurrentTime();
  text(timeString, (canvasWidth/100)*5 , 50);
  
  text("Touch Screen to Start ", (canvasWidth/100)*50 , (canvasHeight/100)*90);

}

//Draw the profile Selection Screen
void profileDraw(){
  String timeString;

  background(255); 
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  drawGrid();
  noStroke();
  
  
  // draw the active button in a different color
  fill(127,127,0);

  textFont(f);
  textSize(36);
  fill(127,127,127);
  textAlign(CENTER);
  
  timeString = getCurrentTime();
  text(timeString, (canvasWidth/100)*5 , 50);
  
  //add new user
  Button temp;
  for (int loopCounter=0; loopCounter < profile.size(); loopCounter++){
    temp = profile.get(loopCounter);
    rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
  } 
  temp = profile.get(profile.size()-1);
  
   
  ellipse(newUserButton.x_Axis,newUserButton.y_Axis,newUserButton.width, newUserButton.height);
  
}

//Draw the User Screen 
void userScreenDraw(User current){
  String timeString;
  background(255); 
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  //drawGrid();
  noStroke();
  

 
  if(isHidden){
    textFont(f);
    textSize(36);
    fill(127,127,127);
    textAlign(CENTER);
  
    timeString = getCurrentTime();
    text(timeString, (canvasWidth/100)*5 , 50);
    rect(current.hid.x_Axis,current.hid.y_Axis,current.hid.width,current.hid.height, 10);
    return;
  }
 

  Button temp;
  if(iconDrag) {
      fill(192,192,192);
      rect(iconX_drag, iconY_drag, iconDrag_box_width,iconDrag_box_height -500, 10);
  }
  fill(127,127,127);
  for (int loopCounter=0; loopCounter < current.buttonSet.size(); loopCounter++){
    temp = current.buttonSet.get(loopCounter);
    if(loopCounter == iconIndex && iconDrag){
      rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
    }
    else{
      rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
    }
  } 
  rect(current.hid.x_Axis,current.hid.y_Axis,current.hid.width,current.hid.height, 10);
  
  
  // need to change to so that it popup the correct function
  if(boxInUse == true){
    println("Inside boxInUse True area");
    if(drag) {
      fill(192,192,192);
      rect(x_drag, y_drag, drag_box_width, drag_box_height, 10);
    }
    image(currentPopup.img, currentPopup.x_Axis, currentPopup.y_Axis, gagWidth, gagHeight);
    
    //pop_up_box(xLocation, yLocation);
  }
  // draw the active button in a different color
  fill(127,127,0);

  

  textFont(f);
  textSize(36);
  fill(127,127,127);
  textAlign(CENTER);
  
  timeString = getCurrentTime();
  text(timeString, (canvasWidth/100)*5 , 50);


}

// Draw a grid 
void drawGrid(){
  int xLocation = 0;
  while(xLocation < canvasWidth){
    line(xLocation,0,xLocation,canvasHeight );
    xLocation = xLocation + int(canvasWidth/29);
  }
  int yLocation = 0;
  while(yLocation < canvasHeight){
    line(0,yLocation,canvasWidth,yLocation );
    yLocation = yLocation + int(canvasWidth/29);
  }
}
// Draw Custom grid
void drawGrid(int xSize,int ySize){
  int xLocation = 0;
  while(xLocation < canvasWidth){
    line(xLocation,0,xLocation,canvasHeight );
    xLocation = xLocation + xSize;
  }
  int yLocation = 0;
  while(yLocation < canvasHeight){
    line(0,yLocation,canvasWidth,yLocation );
    yLocation = yLocation + ySize;
  }
}

/////////////////////////////////////////////////////

void mouseDragged() {

  if(drag == false && isHidden == false){
     originalX = xLocation;
    originalY = yLocation;
    dragDifx = mouseX-xLocation;
    dragDify = mouseY-yLocation;
  }
  
  
  if(insideBox(xLocation, yLocation, currentPopup.width, currentPopup.height )&& isHidden ==false ){
    drag = true;
    PopUpDrag();
    iconDrag = false;
    return;
  }
  
  if(iconDrag == false && isHidden == false){
    loopInsideBox() ;
     int x = userList.get(whichUser).buttonSet.get(iconIndex).x_Axis;
     iconDragDifx = mouseX-x;
  }
  

  
  if(loopInsideBox() && isHidden ==false  ){
    iconDrag = true;
    drag = false;
    IconsDrag();
    return;
  }

  
  //else if(iconDrag)
  //IconsDrag();
  
}


void PopUpDrag(){
/*
  if( mouseX-dragDifx < x_drag || mouseX-dragDifx+popUpX > x_drag + drag_box_width || mouseY-dragDify < y_drag || mouseY-dragDify+popUpY > y_drag + drag_box_height) {

      //Do nothing.
      if(xLocation < x_drag){
        xLocation = x_drag;
        currentPopup.x_Axis = int(xLocation);
      }
      if( xLocation+popUpX > x_drag + drag_box_width){
         xLocation = x_drag + drag_box_width - popUpX;
         currentPopup.x_Axis = int(xLocation);
      }
      if( yLocation < y_drag){
        yLocation = y_drag;
        currentPopup.y_Axis = int(yLocation);
      }
       if(yLocation+popUpY > y_drag + drag_box_height){
        yLocation = y_drag + drag_box_height - popUpY;
        currentPopup.y_Axis = int(yLocation);
      }
*/
  if( mouseX-dragDifx < x_drag || mouseX-dragDifx+currentPopup.width > x_drag + drag_box_width || mouseY-dragDify < y_drag || mouseY-dragDify+currentPopup.height > y_drag + drag_box_height) {

      //Do nothing.
      if(xLocation < x_drag){
        xLocation = x_drag;
        currentPopup.x_Axis = int(xLocation);
      }
      if( xLocation+currentPopup.width > x_drag + drag_box_width){
         xLocation = x_drag + drag_box_width - currentPopup.width;
         currentPopup.x_Axis = int(xLocation);
      }
      if( yLocation < y_drag){
        yLocation = y_drag;
        currentPopup.y_Axis = int(yLocation);
      }
       if(yLocation+currentPopup.height > y_drag + drag_box_height){
        yLocation = y_drag + drag_box_height - currentPopup.height;
        currentPopup.y_Axis = int(yLocation);
      }

  }


  else if(drag) {

    xLocation = mouseX-dragDifx;
    yLocation = mouseY-dragDify;
    
    currentPopup.x_Axis = int(xLocation);
    currentPopup.y_Axis = int(yLocation);
  }

}


void IconsDrag(){
  if( mouseX-iconDragDifx < iconX_drag || mouseX-iconDragDifx+buttonX > iconX_drag+ iconDrag_box_width ){//|| mouseY-dragDify < iconY_drag || mouseY-dragDify+buttonY > iconY_drag + iconDrag_box_height) {

      //Do nothing.
      if(xLocation < x_drag){
        userList.get(whichUser).buttonSet.get(iconIndex).x_Axis = int(x_drag);
      }
      if( xLocation+popUpX > x_drag + drag_box_width){
         userList.get(whichUser).buttonSet.get(iconIndex).x_Axis = int(x_drag + drag_box_width - buttonX);
      }
      //if( yLocation < y_drag){
      //  yLocation = y_drag;
      //}
      // if(yLocation+popUpY > y_drag + drag_box_height){
      //  yLocation = y_drag + drag_box_height - popUpY;
      //}


  }


  else if(iconDrag) {

    userList.get(whichUser).buttonSet.get(iconIndex).x_Axis = int(mouseX-iconDragDifx);
    //yLocation = mouseY-dragDify;
  }

}


//void mouseReleased() {

//}

//void mouseClicked() {
//  if(stage == 3){
//    UserScreen_MouseClicked();
//    return;
//  }

//}

//Mouse handlers
void mouseReleased() {
      
  //Start Screen to Profile Selection Screen
  if(stage == 0){
    stage = 1;
    return;
  }
  
  //Profile Selection Screen to Pin
  if(stage == 1){
    profileSelect_MouseReleased();
    drag = false;
    iconDrag = false;
    return;
  }
  
  // Check if pin is correct or not 
  // If pin is correct go to display Screen
  // else go to incorrect Screen
  // image button has it own mousePressed 
  // remove this if statement later
  if(stage == 2){
    //stage = 3;
    
    return;
  }
  
  if(stage == 3){
    UserScreen_MouseReleased();
    return;
  }

  
  
}

void profileSelect_MouseReleased(){
  Button temp;
  
  //ellipse((index+66+(2*(canvasWidth/100))),temp.y_Axis+15, 30, 30);
  if(insideCircle(newUserButton.x_Axis,newUserButton.y_Axis,newUserButton.width)){
    println("DEBUG(9): New user");
    // new the stage for that
    
  }
  
  
  for (int loopCounter=0; loopCounter < profile.size(); loopCounter++){
    temp = profile.get(loopCounter);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height)){
      stage = 2;
      return;
    }
  }
  

}

void UserScreen_MouseReleased(){
  
  
  User guest = userList.get(0);
  drag = false;
  iconDrag = false;
  
  if(insideBox(guest.hid.x_Axis,guest.hid.y_Axis,guest.hid.width,guest.hid.height)){
    isHidden = !isHidden;

    return;
  }
  if(isHidden){

    return;
  }
  
  
  if(boxInUse && outsideBox(xLocation, yLocation, popUpX, popUpY)) {
    println("DEBUG(1)");
    background(255);
    boxInUse = false;
    if(clickOtherButton()){
      boxInUse = true;   
      //pop_up_box(xLocation, yLocation);
    }

    return;
      
    
  }
    if(loopInsideBox() && !boxInUse){
    //pop_up_box(xLocation, yLocation);
    currentPopup = new Popup("Data/9gag_desktop.png", int(xLocation), int(yLocation), int(gagWidth), int(gagHeight));
    boxInUse = true;
    println("LINE 925");

    return;
  }
  
  if (loopInsideBox() ){
    User u = userList.get(whichUser);
    Button b = u.buttonSet.get(iconIndex);
    int x = userList.get(whichUser).buttonSet.get(iconIndex).x_Axis;
    
    //iconDrag = true;
    iconDragDifx = mouseX-x;
     //dragDify = mouseY-yLocation;
  }
  else if(insideBox(xLocation, yLocation, currentPopup.width, currentPopup.height) ) {
    //drag = true;
    originalX = xLocation;
    originalY = yLocation;
    dragDifx = mouseX-xLocation;
    dragDify = mouseY-yLocation;
  }
  else {
    drag = false;
    iconDrag = false;
  }
  
  
  
 
  

}

// Check if a different function button has been press
boolean clickOtherButton(){
  int temp = findButton();
  if(temp != -1 && temp != functionInUse ){
    functionInUse = temp;
    //println("DEBUG(5): functionInUse: " + functionInUse );
    return true;
  } 
  return false;
}

boolean loopInsideBox(){
  Button temp;
  User guest = userList.get(0);
  for(int i = 0;i<guest.buttonSet.size();i++){
    
    temp = guest.buttonSet.get(i);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height)){
      functionInUse = temp.function;
      println("Button "+ temp.function  + " Clicked" );
      iconIndex = i;
      return true;
    }
  }
  return false;
}

// Need to be rewritten
int findButton(){
  Button temp;
  User guest = userList.get(0);
  for(int i = 0;i<guest.buttonSet.size();i++){
    
    temp = guest.buttonSet.get(i);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height)){
      println("Button "+ temp.function + " Clicked" );
      return temp.function;
    }
  }
  return -1;
}

//Function to check if click inside circle button
boolean insideCircle(int x, int y,int d){
 if( dist(mouseX,mouseY,x,y)<d/2){
   return true;
 }
 return false;
}

//Function to check if mouse cursor is INSIDE the specified box
boolean insideBox(float x, float y, int popUpX, int popUpY) {

  if((mouseX >= x && mouseX <= (x+popUpX)) && ((mouseY >= y) && mouseY <= (y+popUpY)))  {
    
    return true;
  }
  else {
    return false;
  }
  
}

//Function to check if mouse cursor is OUTSIDE the specified box
boolean outsideBox(float x,float y, int popUpX, int popUpY) {

   if((mouseX < x || mouseX >= (x+popUpX)) || ((mouseY < y) || mouseY > (y+popUpY))) {
   
     return true;
   }
   else {
     return false;
   }

}
//Function to create a new box/window
void pop_up_box(float x, float y) {

  rect(x, y, popUpX, popUpY, 7);
  boxInUse = true;
  
}



//Function to get current Time
String getCurrentTime(){
    
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  String min;
  String hr;
  String timeString;

  if(m < 10)
    min = "0"+str(m); 
  else
    min =str(m);
  if(h%12 == 0){
    hr = "12";
  }
  else{
    hr = str(h%12);
  }
  if(h > 12){
     timeString = hr +":"+ min+ "PM";
  }
  else{
     timeString = hr +":"+ min+ "AM";
  }
  return timeString;
  
}



//Function to find a button index base on the what the button.function
int findButtonIndex(ArrayList<Button> blist,int fun){
  int size = blist.size();

  for(int i = 0;i<size;i++){
    if((blist.get(i)).function == fun){
      return i;
    }
  }
  return -1;
}


// remove later
int findFunctionIndex(ArrayList<Button> blist,ArrayList<Integer> funcList,int fun){
  int size = blist.size();

  for(int i = 0;i<size;i++){
    if((funcList.get(i)) == fun){
      return i;
    }
  }
  return -1;
}



// Function to draw buttons
void drawFunctionIcons(ArrayList<Button>blist){
   Button temp;
  for (int loopCounter=0; loopCounter < blist.size(); loopCounter++){
    temp = blist.get(loopCounter);
    rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
  } 
}

//Function to find the Right most Button
int findMostRight(ArrayList<Button> blist){
  Button temp;
  temp = blist.get(0);
  int index = temp.x_Axis;
  
  for (int loopCounter=0; loopCounter < blist.size(); loopCounter++){
    temp = blist.get(loopCounter);
    if(index < temp.x_Axis){
      index = temp.x_Axis;
    }
  } 
  return index;
}


// add the button to the Profile
void addProfileButton(ArrayList<Button> blist , int X, int Y,int f){
  
  if(blist.size()%2 == 1){
   
   Button temp; 
   temp = new Button(0, int((canvasHeight/100)*90) ,X,Y,f);
   blist.add(temp);
   temp = blist.get(0);
   temp.changeX(int((canvasWidth/100)*50.5));
   
   temp = blist.get(1);
   temp.changeX(int(((canvasWidth/100)*49.5) - X));
   int tempx = int(((canvasWidth/100)*49.5)- X);

   for (int i=2; i < blist.size(); i = i+2){
      tempx = tempx - int(X + (canvasWidth/100));
   }
   temp = blist.get(0);
   temp.changeX(tempx);
   for (int i=1; i < blist.size(); i++){
     temp = blist.get(i);
     temp.changeX(tempx +(i* int(X + (canvasWidth/100))));
  
   }
   
   
 }
 // even number of functions before add new
 else{
   Button temp; 
   temp = new Button(0, int((canvasHeight/100)*90) ,X,Y,f);
   blist.add(temp);

   temp = blist.get(0);
   temp.changeX(int((canvasWidth/100)*50)-(X/2));
   int tempx = int((canvasWidth/100)*50)-(X/2);
   
   for (int i=1; i < blist.size(); i = i+2){
      //temp  = buttonSet.get(i);
      //temp2 = buttonSet.get(i+1);
      tempx = tempx  - int(X + (canvasWidth/100));
      
      //temp.changeX( ((buttonSet.get(i-1)).x_Axis) - int(buttonX + (canvasWidth/100)) );
      //temp2.changeX( ((buttonSet.get(i-1)).x_Axis) + int(buttonX + (canvasWidth/100)) );
      
   }
   temp = blist.get(0);
   temp.changeX(tempx);
   for (int i=1; i < blist.size(); i++){
     temp = blist.get(i);
     temp.changeX(tempx +(i* int(X + (canvasWidth/100))));
     
     println("DEBUG 10 tempx " +i+ ": " + tempx);
   }
 } 
 int index = findMostRight(profile);
 Button temp =  profile.get(0); 
 newUserButton = new CircleButton(int(index+66+(2*(canvasWidth/100))),temp.y_Axis+15, 30, 30);

}



//Classes
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// class use for icon buttons
class Button{
  int x_Axis;
  int y_Axis;
  int width;
  int height;
  int function;
  Button(int x, int y,int w,int h, int f){
    x_Axis = x;
    y_Axis = y;
    width = w;
    height = h;
    //0 for function menu
    //1 for setting
    function = f;
  }
 
  void changeFunction(int f){
    function = f;
  }
  void changeLocation(int x, int y){
    x_Axis = x;
    y_Axis = y;
  }
  void changeX(int x){
    x_Axis = x;
  }
  
}
// Learning Processing
// Daniel Shiffman


class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
   }
   
 }
//class for Pin button 
class PinButton

{

  int x, y;

  int w, h;

  color basecolor, highlightcolor;

  color currentcolor;

  boolean isOver = false;

  boolean pressed = false;   

  

  
  
  void mouseReleased() 
  {
    if(isOver && mousePressed) {
      
      pressed = true;

    } else {

      pressed = false;

    }
  }

  

  boolean overRect(int x, int y, int width, int height) {

  if (mouseX >= x && mouseX <= x+width && 

      mouseY >= y && mouseY <= y+height) {

    return true;

  } else {

    return false;

  }

}

}



class ImageButtons extends PinButton 

{

  PImage base;

  PImage roll;

  PImage down;

  PImage currentimage;
  
  String number = "";


  ImageButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown, String num) 

  {

    x = ix;

    y = iy;

    w = iw;

    h = ih;

    base = ibase;

    roll = iroll;

    down = idown;

    currentimage = base;
    
    number = num;

  }

  

  void update() 

  {

    over();
    
    mouseReleased();
    
    if(pressed) {
     
      currentimage = down;
      isPressed = true;

    } 
    else if (isOver){
     
      currentimage = roll;
      if(isPressed == true){
        isPressed = false; 
        
        if(number == "back" && pinFlag > 0){  
          pinFlag = pinFlag-1;
          pin = pin.substring (  0, pin.length()-1 );
          println(pin);  //Testing purpose
          pinRep = pinRep.substring( 0, pinRep.length()-1 );
          pinSpace = pinSpace - 15;
          textSize(40);
          fill(255);
          //text("*", (int)canvasWidth/4 + 315 + pinSpace, (int)canvasHeight/3 + 45);
          println(pinRep);    //Testing purpose
        }
        
        else if(pinFlag < 4 && number != "back" && number!= "ok"){                 
          fill(0);
          pinRep = pinRep + "*";
          textSize(40);
          //text("*",(int)canvasWidth/4 + 315 + pinSpace, (int)canvasHeight/3 + 45);
          pinSpace = pinSpace + 15;
          pin = pin + number;
          println(pin);  //Testing purpose
          pinFlag = pinFlag+1;
        }
        
      if(number == "ok" && pinFlag < 4)
      {
        //Print in red text say require 4 number
        
      }
      
      if(number == "ok" && pinFlag == 4){
        //showMessageDialog(null, "PIN successfully added", "Info", INFORMATION_MESSAGE);
        
        if(comparePin(pin) ){
          stage = 3;
        }
        
        textSize(40);
        fill(102);
        pinFlag = 0;
        pinSpace = 0;
        
        for(int i = 0; i < 4; i++){
         // text("*",(int)canvasWidth/4 + 315 + pinSpace,(int)canvasHeight/3 + 45);
          pinSpace = pinSpace+15;
        }
        pin = "";
        pinRep = "";
        pinSpace = 0;
      }
     }
    }
    else {
    
      currentimage = base;

    }

  }

  boolean comparePin(String pinString){
    User currentUser = userList.get(whichUser);
    if(pinString.equals(currentUser.pin)){
      return true;
    }
    return false;
  }

  void over() 

  {
    
     //println("DEBUG 0");
     //println("x: "+x);
     //println("y: "+y);
     //println("w: "+w);
     //println("h: "+h);
     //println("mouseX: " + mouseX);
     //println("mouseX: " + mouseY);
     //println("//////////////////////////////////////////////////////");
     
    if( overRect(x, y, w, h) ) {

      isOver = true;
     
    } else {
      
      isOver = false;

    }

  }

  

  void display() 

  {

    image(currentimage, x, y, w, h);

  }

}

// class for circle buttons
class CircleButton{
  int x_Axis;
  int y_Axis;
  int width;
  int height;
  CircleButton(int x, int y,int w,int h){
    x_Axis = x;
    y_Axis = y;
    width = w;
    height = h;
  }
}

class Popup{
  int x_Axis;
  int y_Axis;
  int width;
  int height;
  int function;
  PImage img;
  // save the location of the function where it clickable
  ArrayList<Button> clickable = new ArrayList<Button>();
  
  Popup(String file, int x, int y, int w, int h) {
    x_Axis = x;
    y_Axis = y;
    width = w;
    height = h;
    
    img = loadImage(file);
    
  }
/*  
  Popup(int x, int y , int w , int h, int f){
    x_Axis = x;
    y_Axis = y;
    width = w;
    height = h;
    //0 for function menu
    //1 for setting
    function = f;
  }
*/
  void PopupAddClickable(int x, int y , int w , int h, int f){
    // x and y is the location with respect to the popup
    Button temp = new Button(x_Axis + x,y_Axis + y,w,h,f);
    clickable.add(temp);
   
  }
}

class User{

  String name;
  ArrayList<Button> buttonSet = new ArrayList<Button>();
  ArrayList<Integer> usrFunctionActive = new ArrayList<Integer>();
  Button hid;
  
  //Saved Setting info
  ////////////////////////
  
  
  ////////////////////////
  // some buttons
  int iconSizeX = 33;
  int iconSizeY = 30;
  String pin;
  
  // Change to gobal variable instead
  //boolean isHidden;
  
  User(String usr, String pass){
    name = usr;
    pin = pass;
    hid = new Button(int((canvasWidth - buttonX) - ((canvasWidth/100) *2)),int((canvasHeight- buttonY) - ((canvasHeight/100) *2)),buttonX,buttonY,-1);
    //isHidden = false;
    //Create the Default buttons
    ///////////////////////////////////////////////////
    
    //setting button
    Button temp = new Button(int((canvasWidth/100)*49.5 - buttonX), int((canvasHeight/100)*90) ,iconSizeX,iconSizeY,0);
    buttonSet.add(temp);
    usrFunctionActive.add(temp.function);
    //function button
    temp = new Button(int((canvasWidth/100)*50.5), int((canvasHeight/100)*90) ,iconSizeX,iconSizeY,1);
    buttonSet.add(temp);
    usrFunctionActive.add(temp.function);
    
    ///////////////////////////////////////////////////
    
  }
 
 
  
 void addButton(int f){

   // odd number of functions before add new
   if(usrFunctionActive.size()%2 == 1){
     
     Button temp; 
     Button temp2; 
     temp = new Button(0, int((canvasHeight/100)*90) ,buttonX,buttonY,f);
     buttonSet.add(temp);
     usrFunctionActive.add(temp.function);
     temp = buttonSet.get(0);
     temp.changeX(int((canvasWidth/100)*50.5));
     
     temp = buttonSet.get(1);
     temp.changeX(int(((canvasWidth/100)*49.5) - buttonX));
     int tempx = int(((canvasWidth/100)*49.5)- buttonX);
  
     for (int i=2; i < buttonSet.size(); i = i+2){
        tempx = tempx - int(buttonX + (canvasWidth/100));
     }
     temp = buttonSet.get(0);
     temp.changeX(tempx);
     for (int i=1; i < buttonSet.size(); i++){
       temp = buttonSet.get(i);
       temp.changeX(tempx +(i* int(buttonX + (canvasWidth/100))));
    
     }
     
     
   }
   // even number of functions before add new
   else{
     Button temp; 
     Button temp2; 
     temp = new Button(0, int((canvasHeight/100)*90) ,buttonX,buttonY,f);
     buttonSet.add(temp);
     usrFunctionActive.add(temp.function);
     temp = buttonSet.get(0);
     temp.changeX(int((canvasWidth/100)*50)-(buttonX/2));
     int tempx = int((canvasWidth/100)*50)-(buttonX/2);
     
     for (int i=1; i < buttonSet.size(); i = i+2){
        //temp  = buttonSet.get(i);
        //temp2 = buttonSet.get(i+1);
        tempx = tempx  - int(buttonX + (canvasWidth/100));
        
        //temp.changeX( ((buttonSet.get(i-1)).x_Axis) - int(buttonX + (canvasWidth/100)) );
        //temp2.changeX( ((buttonSet.get(i-1)).x_Axis) + int(buttonX + (canvasWidth/100)) );
        
     }
     temp = buttonSet.get(0);
     temp.changeX(tempx);
     for (int i=1; i < buttonSet.size(); i++){
       temp = buttonSet.get(i);
       temp.changeX(tempx +(i* int(buttonX + (canvasWidth/100))));
       
       println("DEBUG 10 tempx " +i+ ": " + tempx);
     }
   }
   
  }
}