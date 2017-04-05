

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


// some buttons
int buttonX = 33;
int buttonY = 30;
//

//0 = start screen
//1 = profile selection
//2 = login 
//3 = Exsitng User display
//4 = Guess User display
int stage = 0;
// evl monitor size
//float canvasWidth = 2732;
//float canvasHeight = 1536;

// scale down for home monitors
float canvasWidth = 1366;
float canvasHeight = 768;

//pin
boolean isPressed = false;



class Button2

{

  int x, y;

  int w, h;

  color basecolor, highlightcolor;

  color currentcolor;

  boolean over = false;

  boolean pressed = false;   

  

  
  
  void mousePressed() 
  {
    if(over && mousePressed) {
      
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


class ImageButtons extends Button2 

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

    mousePressed();

    if(pressed) {
      currentimage = down;
      isPressed = true;

    } else if (over){
      
      currentimage = roll;
      if(isPressed == true)
      {
      isPressed = false; 
      if(number == "back" && pinFlag > 0)
      {  
        pinFlag = pinFlag-1;
        pin = pin.substring (  0, pin.length()-1 );
        println(pin);  //Testing purpose
        pinRep = pinRep.substring( 0, pinRep.length()-1 );
        pinSpace = pinSpace - 15;
        fill(102);
        text("*",(290+pinSpace),70);
        println(pinRep);    //Testing purpose
      }
      else if(pinFlag < 4 && number != "back" && number!= "ok")
      {
        textFont(f,16);                  
        fill(0);
        pinRep = pinRep + "*";
        textSize(40);
        text("*",(290+pinSpace),70);
        pinSpace = pinSpace + 15;
        pin = pin + number;
        println(pin);  //Testing purpose
        pinFlag = pinFlag+1;
      }
      if(number == "ok" && pinFlag < 4)
      {
        showMessageDialog(null, "Pin requires four numbers!", "Alert", ERROR_MESSAGE);
      }
      if(number == "ok" && pinFlag == 4)
      {
        showMessageDialog(null, "PIN successfully added", "Info", INFORMATION_MESSAGE);
        textSize(40);
        fill(102);
        pinFlag = 0;
        pinSpace = 0;
        for(int i = 0; i < 4; i++)
        {
        text("*",(290+pinSpace),70);
        pinSpace = pinSpace+15;
        }
        pin = "";
        pinRep = "";
        pinSpace = 0;
      }
      }
    } else {
      
      currentimage = base;

    }

  }

  

  void over() 

  {

    if( overRect(x, y, w, h) ) {

      over = true;

    } else {

      over = false;

    }

  }

  

  void display() 

  {

    image(currentimage, x, y);

  }

}



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
  
  Popup(int x, int y , int w , int h, int f){
    x_Axis = x;
    y_Axis = y;
    width = w;
    height = h;
    //0 for function menu
    //1 for setting
    function = f;
  }
  
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
  boolean isHidden;
  
  User(String usr, String pass){
    name = usr;
    pin = pass;
    hid = new Button(int((canvasWidth - buttonX) - ((canvasWidth/100) *2)),int((canvasHeight- buttonY) - ((canvasHeight/100) *2)),buttonX,buttonY,-1);
    isHidden = false;
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
   
   for (int i=2; i < buttonSet.size(); i = i+2){
      temp  = buttonSet.get(i);
      temp2 = buttonSet.get(i+1);
      
      temp.changeX( ((buttonSet.get(i-1)).x_Axis) - int(buttonX + (canvasWidth/100)) );
      temp2.changeX( ((buttonSet.get(i-2)).x_Axis) + int(buttonX + (canvasWidth/100)) );
      
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

   for (int i=1; i < buttonSet.size(); i = i+2){
      temp  = buttonSet.get(i);
      temp2 = buttonSet.get(i+1);
      
      temp.changeX( ((buttonSet.get(i-1)).x_Axis) - int(buttonX + (canvasWidth/100)) );
      temp2.changeX( ((buttonSet.get(i-1)).x_Axis) + int(buttonX + (canvasWidth/100)) );
      
   }
 }
 
}
}
// placeholder for future image
PImage img;
PImage bgroundimg;


int xLocation = int((canvasWidth/100)*40);
int yLocation = int((canvasHeight/100)*40); 

//Size of popup or popups
int popUpX = int((canvasWidth/100)*20);
int popUpY = int((canvasHeight/100)*20);

// Old code before creating user class
/////////////////////////////////////////////////////////////////////////
//Hide button
//boolean isHidden = false;
//Button hid = new Button(int((canvasWidth - buttonX) - ((canvasWidth/100) *2)),int((canvasHeight- buttonY) - ((canvasHeight/100) *2)),buttonX,buttonY,-1);
//ArrayList<Button> buttons = new ArrayList<Button>();
//ArrayList<Integer> functionActive = new ArrayList<Integer>();

/////////////////////////////////////////////////////////////////////////
int currentTime;
boolean boxInUse = false;
int functionInUse;
PFont f;


//Profiles
ArrayList<Button> profile = new ArrayList<Button>();
CircleButton newUserButton;
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

User guess = new User("guess","0000");

void setup() {
  // set the canvas size
  
  // Use for HTML(processing.js) and DEMO
  //size(canvasWidth,canvasHeight);
  
  //Use for processing and testing 
  size( 1366 ,768);
  
  //Old code before creating a User class
  ////////////////////////////////////////////////////////////////////////////
  ////setting button
  //Button temp = new Button(int((canvasWidth/100)*49.5 - buttonX), int((canvasHeight/100)*90) ,buttonX,buttonY,0);
  //buttons.add(temp);
  //functionActive.add(temp.function);
  ////function button
  //temp = new Button(int((canvasWidth/100)*50.5), int((canvasHeight/100)*90) ,buttonX,buttonY,1);
  //buttons.add(temp);
  //functionActive.add(temp.function);
  
  //println("Debug pre" + functionActive.get(0));
  
  //addButton(2,buttons,functionActive,buttonX,buttonY);
  //addButton(3,buttons,functionActive,buttonX,buttonY);
  
  ////Collections.sort(functionActive);
  //for (Button item : buttons) {
  //  println(item.function);
  //}
  
  //fixOrderofButton(buttons,functionActive);
  
  ////////////////////////////////////////////////////////////////////////////////////
  // grab an image to use later
  // as with sounds Processing likes files in the data directory, Processing.js outside that directory
  //stroke(0);
  //rect(0, 0, 683, 384);
  //bgroundimg = loadImage("silver.jpg", "jpg");
  //bgroundimg.loadPixels();
  //bgroundimg.resize(683, 384);
  //img = loadImage("sketch2.gif", "gif");
  //img.loadPixels();
  
  
  //f = createFont("Arial",24,true);
  //background(255);
  //loadSounds();
  //stroke(126);

  
  ////////////////////////////////////
  
  
  fixOrderofButton(guess.buttonSet,guess.usrFunctionActive);
  guess.addButton(4);
  f = createFont("Arial",24,true);
  background(255);
  loadSounds();
  stroke(126);
  
  
  //Profile Setup
  //////////////////////////////////////////////////
  
  Button temp = new Button(int((canvasWidth/100)*49.5 - buttonX), int((canvasHeight/100)*90) ,66,30,0);
  profile.add(temp);
  int index = findMostRight(profile);
  newUserButton = new CircleButton(int(index+66+(2*(canvasWidth/100))),temp.y_Axis+15, 30, 30);
  
  
  //addButton(profile,66,30,-2);
  //////////////////////////////////////////////////
  
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
    loginDraw();
  }
  else if(stage == 3){
    loginDraw();
  }
  else if(stage == 4){
    //change to genric displayDraw 
    guessDraw();
  }

}

void startDraw(){
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
  
  text("Touch Screen to Start", (canvasWidth/100)*50 , (canvasHeight/100)*90);

}


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

void loginDraw(){
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
}

void guessDraw(){
  String timeString;

  background(255); 
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  drawGrid();
  noStroke();
  

 
  if(guess.isHidden){
    textFont(f);
    textSize(36);
    fill(127,127,127);
    textAlign(CENTER);
  
    timeString = getCurrentTime();
    text(timeString, (canvasWidth/100)*5 , 50);
    rect(guess.hid.x_Axis,guess.hid.y_Axis,guess.hid.width,guess.hid.height, 10);
    return;
  }
 
  fill(127,127,127);
  Button temp;
  for (int loopCounter=0; loopCounter < guess.buttonSet.size(); loopCounter++){
    temp = guess.buttonSet.get(loopCounter);
    rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
  } 
  rect(guess.hid.x_Axis,guess.hid.y_Axis,guess.hid.width,guess.hid.height, 10);
  // need to change to so that it popup the correct function
  if(boxInUse == true){
   pop_up_box(xLocation, yLocation);
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


//Mouse handlers
void mousePressed() {
  
  if(stage == 0){
    stage = 1;
    
    return;
  }
  if(stage == 1){
    stage2MousePressed();
    
    return;
  }
  if(stage == 2){
    stage = 3;
    return;
  }
  if(stage == 3){
    stage = 4;
    return;
  }
  if(stage == 4){
    stage4MousePressed();
    return;
  }
  
  
}
void stage2MousePressed(){
  Button temp;
  
  //ellipse((index+66+(2*(canvasWidth/100))),temp.y_Axis+15, 30, 30);
  if(insideCircle(newUserButton.x_Axis,newUserButton.y_Axis,newUserButton.width)){
    println("DEBUG(9): New user");
    // new the stage for that
    
  }
  
  
  for (int loopCounter=0; loopCounter < profile.size(); loopCounter++){
    temp = profile.get(loopCounter);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height)){
      stage = 3;
      return;
    }
  }
  

}

void stage4MousePressed(){
  if(insideBox(guess.hid.x_Axis,guess.hid.y_Axis,guess.hid.width,guess.hid.height)){
    guess.isHidden = !guess.isHidden;
    return;
  }
  
  if(boxInUse && outsideBox(xLocation, yLocation, popUpX, popUpY)) {
    println("DEBUG(3): BoxInUse: " + boxInUse + " Clicked");
    background(255);
    boxInUse = false;
    if(clickOtherButton()){
      boxInUse = true;
      pop_up_box(xLocation, yLocation);
    }
    println("DEBUG(4): BoxInUse: " + boxInUse + " Delete Box");
    println("===========");
    return;
      
    
  }
    if(loopInsideBox() && !boxInUse){
    println("DEBUG(1): BoxInUse: " + boxInUse + " Clicked");
    pop_up_box(xLocation, yLocation);
    
    println("DEBUG(2): BoxInUse: " + boxInUse + " Created Box");
    println("===========");
    return;
  }

}


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
  for(int i = 0;i<guess.buttonSet.size();i++){
    
    temp = guess.buttonSet.get(i);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height)){
      functionInUse = temp.function;
      println("Button "+ temp.function  + " Clicked" );
      return true;
    }
  }
  return false;
}

int findButton(){
  Button temp;
  for(int i = 0;i<guess.buttonSet.size();i++){
    
    temp = guess.buttonSet.get(i);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height)){
      println("Button "+ temp.function + " Clicked" );
      return temp.function;
    }
  }
  return -1;
}
boolean insideCircle(int x, int y,int d){
 if( dist(mouseX,mouseY,x,y)<d/2){
   return true;
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
void fixOrderofButton(ArrayList<Button> blist,ArrayList<Integer> funcList){
  int size = funcList.size();

  for (Button item : blist) {
    println("Debug(8) "+ item.function);
  }
  fixedLocation(blist,funcList);
  for(int i = 0;i<size;i++){
    if((funcList.get(i) != (blist.get(i)).function)){
      int index = findButtonIndex(blist,funcList.get(i));
      if(index != -1){
        Button temp = blist.get(index);
        Button temp2 = blist.get(i);
        int holder = temp.function;
        
        temp.function = temp2.function;
        temp2.function = holder;
        
      }
    }
  }
}

int findButtonIndex(ArrayList<Button> blist,int fun){
  int size = blist.size();

  for(int i = 0;i<size;i++){
    if((blist.get(i)).function == fun){
      return i;
    }
  }
  return -1;
}

int findFunctionIndex(ArrayList<Button> blist,ArrayList<Integer> funcList,int fun){
  int size = blist.size();

  for(int i = 0;i<size;i++){
    if((funcList.get(i)) == fun){
      return i;
    }
  }
  return -1;
}

void fixedLocation(ArrayList<Button> blist,ArrayList<Integer> funcList){
  int setting = findFunctionIndex(blist,funcList,0);
  int menu = findFunctionIndex(blist,funcList,1);
  
  buttonSwap(blist,setting,blist.size()-1);
  buttonSwap(blist,menu,blist.size()-2);
  for (Button item : blist) {
    println("Debug(7) "+ item.function);
  }
  
}

void buttonSwap(ArrayList<Button> blist,int index1 , int index2){
  int temp = blist.get(index1).function;
  int temp2 = blist.get(index2).function;
  int tempX = blist.get(index1).x_Axis;
  int tempX2 =  blist.get(index2).x_Axis;
  int tempY = blist.get(index1).y_Axis;
  int tempY2 = blist.get(index2).y_Axis;
  
  blist.get(index1).changeFunction(temp2);
  blist.get(index1).changeLocation(tempX2,tempY2);
  
  blist.get(index2).changeFunction(temp);
  blist.get(index2).changeLocation(tempX,tempY);
  
  
}
void drawFunctionIcons(ArrayList<Button>blist){
   Button temp;
  for (int loopCounter=0; loopCounter < blist.size(); loopCounter++){
    temp = blist.get(loopCounter);
    rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
  } 
}

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
void addButton(ArrayList<Button> blist , int X, int Y,int f){

 // odd number of functions before add new
 if(blist.size()%2 == 1){
   
   Button temp; 
   Button temp2; 
   temp = new Button(0, int((canvasHeight/100)*90) ,X,Y,f);
   blist.add(temp);
   temp = blist.get(0);
   temp.changeX(int((canvasWidth/100)*50.5));
   temp = blist.get(1);
   temp.changeX(int(((canvasWidth/100)*49.5) - X));
   
   for (int i=2; i < blist.size(); i = i+2){
      temp  = blist.get(i);
      temp2 = blist.get(i+1);
      
      temp.changeX( ((blist.get(i-1)).x_Axis) - int(X + (canvasWidth/100)) );
      temp2.changeX( ((blist.get(i-2)).x_Axis) + int(X + (canvasWidth/100)) );
      
   }
 }
 // even number of functions before add new
 else{
   Button temp; 
   Button temp2; 
   temp = new Button(0, int((canvasHeight/100)*90) ,X,Y,f);
   blist.add(temp);
  
   temp = blist.get(0);
   temp.changeX(int((canvasWidth/100)*50)-(X/2));

   for (int i=1; i < blist.size(); i = i+2){
      temp  = blist.get(i);
      temp2 = blist.get(i+1);
      
      temp.changeX( ((blist.get(i-1)).x_Axis) - int(X + (canvasWidth/100)) );
      temp2.changeX( ((blist.get(i-1)).x_Axis) + int(X + (canvasWidth/100)) );
      
   }
 }
 
}