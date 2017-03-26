//////////////////////////////////////////////////////////////////////////////////////////////////////////
// sample simple processing / processing.js file from Andy Johnson - CS 422 - Spring 2017

// one current issue is dealing with sounds between Processing and Processing.js
// without compiler directives its hard to easily comment in and out the two different versions

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
// placeholder for future image
PImage img;
PImage bgroundimg;

// some buttons
int buttonX = 33;
int buttonY = 30;

// evl monitor size
//float canvasWidth = 2732;
//float canvasHeight = 1536;

// scale down for home monitors
float canvasWidth = 1366;
float canvasHeight = 768;

int xLocation = int((canvasWidth/100)*40);
int yLocation = int((canvasHeight/100)*40); 

//Size of popup or popups
int popUpX = int((canvasWidth/100)*20);
int popUpY = int((canvasHeight/100)*20);

ArrayList<Button> buttons = new ArrayList<Button>();


//int[][] buttons = { {200, 300}, {250, 300}, {300, 300}, {400, 300}, {450, 300}};
// no buttons / mode currently selected
int selectedOne = -1;
//Atleast 2 one for function list and other for setting

ArrayList functionActive =  new ArrayList();

int currentTime;
boolean boxInUse = false;

PFont f;

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


void setup() {
  // set the canvas size
  
  // Use for HTML(processing.js) and DEMO
  //size(canvasWidth,canvasHeight);
  
  //Use for processing and testing 
  size( 1366 ,768);
  Button temp = new Button(int((canvasWidth/100)*49.5 - buttonX), int((canvasHeight/100)*90) ,buttonX,buttonY,0);
  buttons.add(temp);
  functionActive.add(temp.function);
  
  temp = new Button(int((canvasWidth/100)*50.5), int((canvasHeight/100)*90) ,buttonX,buttonY,1);
  buttons.add(temp);
  functionActive.add(temp.function);
  
  temp = new Button(int((canvasWidth/100)*50.5), int((canvasHeight/100)*90) ,buttonX,buttonY,1);
  buttons.add(temp);
  functionActive.add(temp.function);
  
   addButton(2);
  
  // grab an image to use later
  // as with sounds Processing likes files in the data directory, Processing.js outside that directory
  //stroke(0);
  //rect(0, 0, 683, 384);
  //bgroundimg = loadImage("silver.jpg", "jpg");
  //bgroundimg.loadPixels();
  //bgroundimg.resize(683, 384);
  //img = loadImage("sketch2.gif", "gif");
  //img.loadPixels();
  
  
  f = createFont("Arial",24,true);
  background(255);
  loadSounds();
      stroke(126);
   println((float(1366)/100)*50);
   line((canvasWidth/100)*50,0,(canvasWidth/100)*50,canvasHeight );
   line(683,0,683,canvasHeight );
    line(636,0,636,canvasHeight );
     line(729,0,729,canvasHeight );
}

/////////////////////////////////////////////////////

void draw() {
  String timeString;
  //clear();
  
  noStroke();
  
  //rect(100,100, 100, 100, 7);  
  // draw some buttons
  fill(127,127,127);
  Button temp;
  for (int loopCounter=0; loopCounter < buttons.size(); loopCounter++){
    temp = buttons.get(loopCounter);
    rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
  }  
  // draw the active button in a different color
  fill(127,127,0);
  if (selectedOne >= 0)
   // rect(buttons[selectedOne][0], buttons[selectedOne][1], buttonX, buttonY, 10);
    
    
  // draw the state of the thing that the buttons control
  if (selectedOne == 0){
    //fill(127,0,0);
    //rect (300, 100, 300, 300);
  }
  
  if (selectedOne == 1){
    //fill(0,127,0);
    //ellipse(450,250,300,300);
  }
  
  if (selectedOne == 2){
    //img.resize(300, 300);
    //image(img, 300, 100);
  }
  
  // print out the number of seconds the app has been running
  
  textFont(f);
  textSize(36);
  fill(127,127,127);
  textAlign(CENTER);
  
  timeString = getCurrentTime();
  text(timeString, (canvasWidth/100)*5 , 50);

}

/////////////////////////////////////////////////////

// if the mouse button is released inside a known button keep track of which button was pressed
// and play a confirmation sound

//void mouseReleased() {
  
//  for (int loopCounter=0; loopCounter < buttons.length; loopCounter++){
//      if ((mouseX > buttons[loopCounter][0]) && (mouseX < buttons[loopCounter][0]+buttonX)
//      && (mouseY > buttons[loopCounter][1]) && (mouseY < buttons[loopCounter][1]+buttonY)){
//        selectedOne = loopCounter;
//        //playBeep();
//      }
//  }
//}

//Mouse handlers
void mousePressed() {
  println("DEBUG(0): YOU CLICKED!");
  
  
  if(loopInsideBox() && !boxInUse){
    println("DEBUG(1): BoxInUse: " + boxInUse + " Clicked");
    pop_up_box(xLocation, yLocation);
    println("DEBUG(2): BoxInUse: " + boxInUse + " Created Box");
    println("===========");
    return;
  }
  
  if(boxInUse && outsideBox(xLocation, yLocation, popUpX, popUpY)) {
    println("DEBUG(3): BoxInUse: " + boxInUse + " Clicked");
    background(255);
    boxInUse = false;
    println("DEBUG(4): BoxInUse: " + boxInUse + " Delete Box");
    println("===========");
    return;
      
    
  }
  
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

boolean loopInsideBox(){
  Button temp;
  for(int i = 0;i<buttons.size();i++){
    
    temp = buttons.get(i);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height)){
      return true;
    }
  }
  return false;
}

//Function to check if mouse cursor is INSIDE the specified box
boolean insideBox(int x, int y, int boxWidth, int boxHeight) {

  if((mouseX >= x && mouseX <= (x+boxWidth)) && ((mouseY >= y) && mouseY <= (y+boxHeight)))  {
    return true;
  }
  else {
    return false;
  }
  
}
//Function to check if mouse cursor is OUTSIDE the specified box
boolean outsideBox(int x, int y, int boxWidth, int boxHeight) {

   if((mouseX < x || mouseX >= (x+boxWidth)) || ((mouseY < y) || mouseY > (y+boxHeight))) {
   
     return true;
   }
   else {
     return false;
   }

}
//Function to create a new box/window
void pop_up_box(int x, int y) {

  rect(x, y, popUpX, popUpY, 7);
  boxInUse = true;
  
}
// change the location of button by changing their function value
void addButton(int f){

 // odd number of functions before add new
 if(functionActive.size()%2 == 1){
   
   Button temp; 
   Button temp2; 
   temp = new Button(0, int((canvasHeight/100)*90) ,buttonX,buttonY,f);
   buttons.add(temp);
   functionActive.add(temp.function);
   temp = buttons.get(0);
   temp.changeX(int((canvasWidth/100)*50.5));
   temp = buttons.get(1);
   temp.changeX(int(((canvasWidth/100)*49.5) - buttonX));
   
   for (int i=2; i < buttons.size(); i = i+2){
      temp  = buttons.get(i);
      temp2 = buttons.get(i+1);
      
      temp.changeX( ((buttons.get(i-1)).x_Axis) - int(buttonX + (canvasWidth/100)) );
      temp2.changeX( ((buttons.get(i-2)).x_Axis) + int(buttonX + (canvasWidth/100)) );
      
   }

   
 }
 // even number of functions before add new
 else{
 
   
   
 }
}



void drawFunctionIcons(){
   Button temp;
  for (int loopCounter=0; loopCounter < buttons.size(); loopCounter++){
    temp = buttons.get(loopCounter);
    rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
  } 
}