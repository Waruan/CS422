

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

int stage = 0;

// scale down for home monitors
//float canvasWidth ;
//float canvasHeight;

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

int whichUser = -1;
int numberOfUser = 0;
//////////////////////////////////////////////////////////////////


//Variable relate to keyboard
//////////////////////////////////////////////////////////////////

//Image for each key
ImageKeyButtons buttonLowA;
ImageKeyButtons buttonLowB;
ImageKeyButtons buttonLowC;
ImageKeyButtons buttonLowD;
ImageKeyButtons buttonLowE;
ImageKeyButtons buttonLowF;
ImageKeyButtons buttonLowG;
ImageKeyButtons buttonLowH;
ImageKeyButtons buttonLowI;
ImageKeyButtons buttonLowJ;
ImageKeyButtons buttonLowK;
ImageKeyButtons buttonLowL;
ImageKeyButtons buttonLowM;
ImageKeyButtons buttonLowN;
ImageKeyButtons buttonLowO;
ImageKeyButtons buttonLowP;
ImageKeyButtons buttonLowQ;
ImageKeyButtons buttonLowR;
ImageKeyButtons buttonLowS;
ImageKeyButtons buttonLowT;
ImageKeyButtons buttonLowU;
ImageKeyButtons buttonLowV;
ImageKeyButtons buttonLowW;
ImageKeyButtons buttonLowX;
ImageKeyButtons buttonLowY;
ImageKeyButtons buttonLowZ;
ImageKeyButtons buttonBack;
ImageKeyButtons buttonGo;
ImageKeyButtons buttonSpace;


int keyButtonSize = 90;
int keyFlag = 0;  //A flag that you keep to track how many buttons are pressed.
int keySpace = 0; //The space of the stars when they are printed
String keyTracker = ""; //Keeps track of the pins and stores them
String keyRep = ""; //Represents the stars in the pin and how many there are by storing the number
String eraseKey = "";
boolean isKeyPressed = false;
boolean iskeybaord = true; // use for stage 4

//////////////////////////////////////////////////////////////////


//Variable relate to Pin
//////////////////////////////////////////////////////////////////
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
int buttonXSize = 66;
int buttonYSize = 30;
int pinFlag = 0;  //A flag that you keep to track how many buttons are pressed.
int pinSpace = 0; //The space of the stars when they are printed
String pin = ""; //Keeps track of the pins and stores them
String comfirmPin;
String pinRep = ""; //Represents the stars in the pin and how many there are by storing the number
boolean isPressed = false;
boolean userSelected = false; // If a user is select to enter Pin set to true
boolean isPinPressed = false;
boolean wrongPin = false;
boolean wrongConfirmPin = false;
int stage4Part = 1;
//////////////////////////////////////////////////////////////////////////



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

// huge gray box
float x_drag = (canvasWidth/29)*2;
float y_drag = (canvasHeight/29)*3;

float drag_box_width = canvasWidth - ((canvasWidth/29)*4);
float drag_box_height = canvasHeight - ((canvasHeight/29)*7);

Timer timer = new Timer(2000);
//////////////////////////////////////////////////////////////////////////////


//Variable for icon drag
/////////////////////////////////////////////////////////////////////////////

boolean iconDrag = false;
float iconX_drag = (canvasWidth/29)*2;
float iconY_drag = (canvasHeight/29)*25.5;

float iconDrag_box_width = canvasWidth - ((canvasWidth/29)*4);
float iconDrag_box_height = canvasHeight - ((canvasHeight/29)*26.5);
int iconIndex;

float iconDragDifx;
float iconDragDify;

int selectedIconX_axis;
int selectedIconY_axis;

int draggingIndex;




// placeholder for future image
PImage img;
PImage bgroundimg;

//Globals for image popup icons/locations
////////////////////////////////////////////////////////////////

ArrayList<Popup> popups = new ArrayList<Popup>();

//Size of popup or popups
int popUpX = int((canvasWidth/100)*20);
int popUpY = int((canvasHeight/100)*20);

//Image x and y locations
float xLocation = int((canvasWidth/100)*40);
float yLocation = int((canvasHeight/100)*40); 

int permXLocation = int((canvasWidth/100)*40);
int permYLocation = int((canvasHeight/100)*40);

//Size for 9gag display
int gagWidth = int((canvasWidth/100)*20);
int gagHeight = int((canvasHeight/100)*40);

//Size for Health display
int healthWidth = int((canvasWidth/100)*50);
int healthHeight = int((canvasHeight/100)*40);

//Size for Weather display
int weatherWidth = int((canvasWidth/100)*50);
int weatherHeight = int((canvasHeight/100)*40);

//Test variables for box within images
int xtest = int((xLocation/100)*125);
int ytest = int((yLocation/100)*180);

int width_test = int((healthWidth/100)*20);
int height_test = int((healthHeight/100)*15);



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
String newUserName;


//////////////////////////////////////////////////////////////////////////




//Sounds
/////////////////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////////////////

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
  
  int x0 = int(((canvasWidth/100)*50));
  
  int x = int(((canvasWidth/100)*51) - buttonXSize - (canvasWidth/100)*1.5);
  
  int x2 = int(((canvasWidth/100)*50));
  
  int x3 = int( ((canvasWidth/100)*49) + buttonXSize +  (canvasWidth/100)*1.5) ;
  
  int x4 = int(((canvasWidth/100)*51) - buttonXSize - (canvasWidth/100)*1.5);
  
  int x5 = int(((canvasWidth/100)*50));
  
  int x6 = int( ((canvasWidth/100)*49) + buttonXSize +  (canvasWidth/100)*1.5) ;
  
  int x7 = int(((canvasWidth/100)*51) - buttonXSize - (canvasWidth/100)*1.5);
  
  int x8 = int(((canvasWidth/100)*50));
  
  int x9 = int( ((canvasWidth/100)*49) + buttonXSize +  (canvasWidth/100)*1.5) ;
  
  int x10 = int(((canvasWidth/100)*51) - buttonXSize - (canvasWidth/100)*1.5);
 
  int x11 = int( ((canvasWidth/100)*49) + buttonXSize +  (canvasWidth/100)*1.5) ;
  
  
  int y0 = int(((canvasHeight/100)*59)+ buttonYSize*1.5 );

  
  int y = int(((canvasHeight/100)*50));
  
  int y2 = int(((canvasHeight/100)*50));
  int y3 = int(((canvasHeight/100)*50));
  
  int y4 = int(((canvasHeight/100)*53)+ buttonYSize*.5 );
  
  int y5 = int(((canvasHeight/100)*53)+ buttonYSize*.5);
  
  int y6 = int(((canvasHeight/100)*53) + buttonYSize*.5 );
  
  int y7 = int(((canvasHeight/100)*56)+ buttonYSize*1 );
  
  int y8 = int(((canvasHeight/100)*56)+ buttonYSize*1);
  
  int y9 = int(((canvasHeight/100)*56)+ buttonYSize*1 );
  
  int y10 = int(((canvasHeight/100)*59)+ buttonYSize*1.5 );
  
  int y11 = int(((canvasHeight/100)*59)+ buttonYSize*1.5 );
  
  

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

void keyBoardSetup()

{


  
  // Define and create image button

  PImage butA = loadImage("Data/a.png");
  
  butA.resize(40, 40);
  
  PImage butB = loadImage("Data/b.png");
  
  butB.resize(40, 40);

  PImage butC = loadImage("Data/c.png");
  
  butC.resize(40, 40);

  PImage butD = loadImage("Data/d.png");
  
  butD.resize(40, 40);
  
  PImage butE = loadImage("Data/e.png");
  
  butE.resize(40, 40);
  
  PImage butF = loadImage("Data/f.png");
  
  butF.resize(40, 40);
  
  PImage butG = loadImage("Data/g.png");
  
  butG.resize(40, 40);
  
  PImage butH = loadImage("Data/h.png");
  
  butH.resize(30, 30);
  
  PImage butI = loadImage("Data/i.png");
  
  butI.resize(30, 30);
  
  PImage butJ = loadImage("Data/j.png");
  
  butJ.resize(30, 30);
  
  PImage butK = loadImage("Data/k.png");
  
  butK.resize(30, 30);
  
  PImage butL = loadImage("Data/l.png");
  
  butL.resize(30, 30);
  
  PImage butM = loadImage("Data/m.png");
  
  butM.resize(30, 30);
  
  PImage butN = loadImage("Data/n.png");
  
  butN.resize(30, 30);
  
  PImage butO = loadImage("Data/o.png");
  
  butO.resize(30, 30);
  
  PImage butP = loadImage("Data/p.png");
  
  butP.resize(30, 30);
  
  PImage butQ = loadImage("Data/q.png");
  
  butQ.resize(30, 30);
  
  PImage butR = loadImage("Data/r.png");
  
  butR.resize(30, 30);
  
  PImage butS = loadImage("Data/s.png");
  
  butS.resize(30, 30);
  
  PImage butT = loadImage("Data/t.png");
  
  butT.resize(30, 30);
  
  PImage butU = loadImage("Data/u.png");
  
  butU.resize(30, 30);
  
  PImage butV = loadImage("Data/v.png");
  
  butV.resize(30, 30);
  
  PImage butW = loadImage("Data/w.png");
  
  butW.resize(30, 30);
  
  PImage butX = loadImage("Data/x.png");
  
  butX.resize(30, 30);
  
  PImage butY = loadImage("Data/y.png");
  
  butY.resize(30, 30);
  
  PImage butZ = loadImage("Data/z.png");
  
  butZ.resize(30, 30);
  
  PImage butBack = loadImage("Data/back.png");
  
  butBack.resize(80, 30);
  
  PImage butGo = loadImage("Data/go.png");
  
  butGo.resize(80, 30);
  
  PImage butSpace = loadImage("Data/space.png");
  
  butSpace.resize(80, 30);
  
  int boardLeft1 = (int)canvasWidth/2 - 340;
  
  int boardLeft2 = (int)canvasWidth/2 - 280;
  
  int boardLeft3 = (int)canvasWidth/2 - 220;
  
  int boardLeft4 = (int)canvasWidth/2 - 160;
  
  int boardLeft5 = (int)canvasWidth/2 - 100;

  int boardLeft6 = (int)canvasWidth/2 - 40;
  
  int boardLeft7 = (int)canvasWidth/2 + 20;
  
  int boardLeft8 = (int)canvasWidth/2 + 80;
  
  int boardLeft9 = (int)canvasWidth/2 + 140;
  
  int boardLeft10 = (int)canvasWidth/2 + 200;
  
  int boardLeft11 = (int)canvasWidth/2 + 260;
  
  int boardyTop = (int)canvasHeight/2 + 340;
  
  int boardyMiddle = (int)canvasHeight/2 + 390;
  
  int boardyBottom = (int)canvasHeight/2 + 440;
  
  int boardyLast = (int)canvasHeight/2 + 490;
  
  int keyboardWidth = 40;
  
  int backWidth = 80;
  
  int spaceBarWidth = 200;
  
  int keyboardHeight = 40;
  //First Row
  buttonLowQ = new ImageKeyButtons(boardLeft1, boardyTop, keyboardWidth, keyboardHeight, butQ, butQ, butQ, "q"); //done
  buttonLowW = new ImageKeyButtons(boardLeft2, boardyTop, keyboardWidth, keyboardHeight, butW, butW, butW, "w"); //done
  buttonLowE = new ImageKeyButtons(boardLeft3, boardyTop, keyboardWidth, keyboardHeight, butE, butE, butE, "e");//done
  buttonLowR = new ImageKeyButtons(boardLeft4, boardyTop, keyboardWidth, keyboardHeight, butR, butR, butR, "r"); //done
  buttonLowT = new ImageKeyButtons(boardLeft5, boardyTop, keyboardWidth, keyboardHeight, butT, butT, butT, "t");//done
  buttonLowY = new ImageKeyButtons(boardLeft6, boardyTop, keyboardWidth, keyboardHeight, butY, butY, butY, "y"); //done
  buttonLowU = new ImageKeyButtons(boardLeft7, boardyTop, keyboardWidth, keyboardHeight, butU, butU, butU, "u");//done
  buttonLowI = new ImageKeyButtons(boardLeft8, boardyTop, keyboardWidth, keyboardHeight, butI, butI, butI, "i"); //done
  buttonLowO = new ImageKeyButtons(boardLeft9, boardyTop, keyboardWidth, keyboardHeight, butO, butO, butO, "o"); //done
  buttonLowP = new ImageKeyButtons(boardLeft10, boardyTop, keyboardWidth, keyboardHeight, butP, butP, butP, "p"); //done
  buttonBack = new ImageKeyButtons(boardLeft11, boardyTop, backWidth, keyboardHeight, butBack, butBack, butBack, "back");
  //Second Row
  buttonLowA = new ImageKeyButtons(boardLeft1+10, boardyMiddle, keyboardWidth, keyboardHeight, butA, butA, butA, "a");//done
  buttonLowS = new ImageKeyButtons(boardLeft2+10, boardyMiddle, keyboardWidth, keyboardHeight, butS, butS, butS, "s");//done
  buttonLowD = new ImageKeyButtons(boardLeft3+10, boardyMiddle, keyboardWidth, keyboardHeight, butD, butD, butD, "d");//done
  buttonLowF = new ImageKeyButtons(boardLeft4+10, boardyMiddle, keyboardWidth, keyboardHeight, butF, butF, butF, "f");//done
  buttonLowG = new ImageKeyButtons(boardLeft5+10, boardyMiddle, keyboardWidth, keyboardHeight, butG, butG, butG, "g");//done
  buttonLowH = new ImageKeyButtons(boardLeft6+10, boardyMiddle, keyboardWidth, keyboardHeight, butH, butH, butH, "h");//done
  buttonLowJ = new ImageKeyButtons(boardLeft7+10, boardyMiddle, keyboardWidth, keyboardHeight, butJ, butJ, butJ, "j");//done
  buttonLowK = new ImageKeyButtons(boardLeft8+10, boardyMiddle, keyboardWidth, keyboardHeight, butK, butK, butK, "k");//done
  buttonLowL = new ImageKeyButtons(boardLeft9+10, boardyMiddle, keyboardWidth, keyboardHeight, butL, butL, butL, "l");//done
  buttonGo = new ImageKeyButtons(boardLeft10+10, boardyMiddle, backWidth, keyboardHeight, butGo, butGo, butGo, "go");
  //Third Row
  buttonLowZ = new ImageKeyButtons(boardLeft1, boardyBottom, keyboardWidth, keyboardHeight, butZ, butZ, butZ, "z");
  buttonLowX = new ImageKeyButtons(boardLeft2, boardyBottom, keyboardWidth, keyboardHeight, butX, butX, butX, "x");
  buttonLowC = new ImageKeyButtons(boardLeft3, boardyBottom, keyboardWidth, keyboardHeight, butC, butC, butC, "c");
  buttonLowV = new ImageKeyButtons(boardLeft4, boardyBottom, keyboardWidth, keyboardHeight, butV, butV, butV, "v"); //done
  buttonLowB = new ImageKeyButtons(boardLeft5, boardyBottom, keyboardWidth, keyboardHeight, butB, butB, butB, "b");
  buttonLowN = new ImageKeyButtons(boardLeft6, boardyBottom, keyboardWidth, keyboardHeight, butN, butN, butN, "n");//done
  buttonLowM = new ImageKeyButtons(boardLeft7, boardyBottom, keyboardWidth, keyboardHeight, butM, butM, butM, "m");//done
  
  buttonSpace = new ImageKeyButtons(boardLeft4, boardyLast, spaceBarWidth, keyboardHeight, butSpace, butSpace, butSpace, " ");
  

}




void setup() {

  size(canvasWidth, canvasHeight);
 //size( 1366 ,768);

  initPopups();
  //fixOrderofButton(guest.buttonSet,guest.usrFunctionActive);
  currentPopup = new Popup("Data/9gag_desktop.png", int(xLocation), int(yLocation), int(gagWidth), int(gagHeight), 3);

  User guest = new User("guest","0000");
  userList.add(guest);
  
  /*
  Functions:
    3 = 9gag
    31= 9gag next
    
    4 = health
    41 = health_sleep
    42 = health_steps
    43 = health_weight
    
    5 = weather
    51 = weather_today
    52 = weather_hourly
    53 = weather_weekly
    54 = weather_map
  */
  
  userList.get(0).addButton("Data/9gag_icon.png",2); //9gag
  userList.get(0).addButton("Data/health_icon.png",3); //health
  userList.get(0).addButton("Data/weather_icon.png",4); //weather
  userList.get(0).addButton("Data/news_icon.png",5); //article
  userList.get(0).addButton("Data/facebook_icon.png",6); //facebook
  userList.get(0).addButton("Data/twitter_icon.png", 7);
  
  f = createFont("Arial",24,true);
  background(255);
  loadSounds();
  stroke(126);
  
  
  //Profile Setup
  //////////////////////////////////////////////////
  
  Button temp = new Button(int((canvasWidth/100)*49.5 - buttonX), int((canvasHeight/100)*90) ,66,30,0);
  profile.add(temp);
  numberOfUser++;
  

  //addProfileButton(profile,66,30,1);
  int index = findMostRight(profile);
  newUserButton = new CircleButton(int(index+66+(2*(canvasWidth/100))),temp.y_Axis+15, 30, 30);
  
  
  
  //addProfileButton(profile,66,30,-2);
  //////////////////////////////////////////////////
  pinSetup();
  keyBoardSetup();
  
}

/////////////////////////////////////////////////////


void draw() {
  //Start Screen
  if(stage == 0){
    startDraw();
  }
  //Select Profile Screen
  else if(stage == 1){
    profileDraw();
  }
  //Enter Pin Screen
  else if(stage == 2){
    pinDraw();
  }
  //User Screen
  else if(stage == 3){
    
    userScreenDraw(userList.get(whichUser));
    
  }
  else if(stage == 4){
    //if(iskeybaord == true){
   //   createNewUserKeyBoardDraw();
    //}
   // else{
      createNewUserPinDraw();
   // }  
  }

}
// Draw the pin on to the canvas
void pinDraw()
{
  background(255); 
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  drawGrid();
  noStroke();
  
  
  // draw the active button in a different color
 drawTimeDate();
  for(int i = 0;i<pinFlag ;i++){
    

    text("*",int(((canvasWidth/100)*50  + pinSpace - (15 * i))), int((canvasHeight/100)*49));
   
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
  if(stage == 2){
    text("Enter Pin for User: " + userList.get(whichUser).name, int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*45)));
    if(wrongPin == true){
       textSize(26);
       text("Incorrect Pin Please Try Again", int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*73)));
    }
  }
  else if(stage == 4){
    textSize(36);
    if(stage4Part == 1){
      text("Enter New Pin ", int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*45)));
    }
    else if(stage4Part == 2){
      text("Comfirm New Pin ", int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*45)));
    }
    if(wrongConfirmPin == true){
      textSize(26);
      text("Pin did not match. Please Try Again", int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*73)));
    }
  } 
  
  drawProfileButtons();
  
  
}

void keyBoardDraw()

{
  background(255); 
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  drawGrid();
  noStroke();
  

  drawTimeDate();
  
  text(keyTracker,int(((canvasWidth/100)*50)), int((canvasHeight/100)*49));
  
  buttonLowA.update();
  
  buttonLowB.update();
  
  buttonLowC.update();
  
  buttonLowD.update();
  
  buttonLowE.update();
  
  buttonLowF.update();
  
  buttonLowG.update();
  
  buttonLowH.update();
  
  buttonLowI.update();
  
  buttonLowJ.update();
  
  buttonLowK.update();
  
  buttonLowL.update();
  
  buttonLowM.update();
  
  buttonLowN.update();
  
  buttonLowO.update();
  
  buttonLowP.update();
  
  buttonLowQ.update();
  
  buttonLowR.update();
  
  buttonLowS.update();
  
  buttonLowT.update();
  
  buttonLowU.update();
  
  buttonLowV.update();
  
  buttonLowW.update();
  
  buttonLowX.update();
  
  buttonLowY.update();
   
  buttonLowZ.update();
  
  buttonBack.update();
  
  buttonSpace.update();
  
  buttonGo.update();
  
  buttonLowA.display();

  buttonLowB.display();
  
  buttonLowC.display();
  
  buttonLowD.display();
  
  buttonLowE.display();
  
  buttonLowF.display();
  
  buttonLowG.display();
  
  buttonLowH.display();
  
  buttonLowI.display();
  
  buttonLowJ.display();
  
  buttonLowK.display();
  
  buttonLowL.display();
  
  buttonLowM.display();
  
  buttonLowN.display();
  
  buttonLowO.display();
  
  buttonLowP.display();
  
  buttonLowQ.display();
  
  buttonLowR.display();
  
  buttonLowS.display();
  
  buttonLowT.display();
  
  buttonLowU.display();
  
  buttonLowV.display();
  
  buttonLowW.display();
  
  buttonLowX.display();
  
  buttonLowY.display();
  
  buttonLowZ.display();
  
  buttonBack.display();
  
  buttonSpace.display();
  
  buttonGo.display();
}



// Drawing the starting Screen
void startDraw(){

  background(255); 
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  //drawGrid();
  noStroke();
  text("Touch Screen to Start ", (canvasWidth/100)*50 , (canvasHeight/100)*90);
  
  drawTimeDate();

}

//Draw the profile Selection Screen
void profileDraw(){

  
  background(255); 
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  drawGrid();
  noStroke();
  
  drawTimeDate();
  
  // draw the active button in a different color

  //add new user
  drawProfileButtons();
  
}

void initPopups() {
  println("Init Popup function");
  Popup temp = new Popup("Data/settings_icon.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 0);
  popups.add(temp);
  
  temp = new Popup("Data/settings_icon.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 1);
  popups.add(temp);
  
  temp = new Popup("Data/9gag_desktop.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 2);
  popups.add(temp);
  
  temp = new Popup("Data/Health_Template.png", permXLocation, permYLocation, int(healthWidth), int(healthHeight), 3);
  popups.add(temp);
  
  temp = new Popup("Data/Weather_Template.png", permXLocation, permYLocation, int(weatherWidth), int(weatherHeight), 4);
  popups.add(temp);
  
  temp = new Popup("Data/Article_Template.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 5);
  popups.add(temp);
  
  temp = new Popup("Data/Facebook.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 6);
  popups.add(temp);
  
  temp = new Popup("Data/Twiter.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 7);
  popups.add(temp);
  
}

void updateXYLocation(int popUpFunction) {
  
    popups.get(popUpFunction).x_Axis = int(xLocation);
    popups.get(popUpFunction).y_Axis = int(yLocation);
}

boolean checkLocationChanged(Popup current) {
  if(current.x_Axis != permXLocation || current.y_Axis != permYLocation) {
    return true;
  
  }
  else
    return false;

}

//ISSUES LAST KNOWN POSITION IS NOT SAVING...
void getCurrentButtonPopup(int current) {
  currentPopup = popups.get(current);
}

//Draw the User Screen 
void userScreenDraw(User current){
  
  background(255); 
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  drawGrid();
  noStroke();
  drawTimeDate();

 
  if(isHidden){
    
    return;
  }
 

  Button temp;
  if(iconDrag) {
      fill(192,192,192);
      rect(iconX_drag, iconY_drag, iconDrag_box_width,iconDrag_box_height, 10);
  }
  fill(127,127,127);
  for (int loopCounter=0; loopCounter < current.buttonSet.size(); loopCounter++){
    temp = current.buttonSet.get(loopCounter);
    if(loopCounter == iconIndex && iconDrag){
      image(temp.img, temp.x_Axis, temp.y_Axis, temp.width, temp.height);
      //rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
    }
    else{
      //rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
      image(temp.img, temp.x_Axis, temp.y_Axis, temp.width, temp.height);
    }
  } 
  rect(current.hid.x_Axis,current.hid.y_Axis,current.hid.width,current.hid.height, 10);
  
  
  // need to change to so that it popup the correct function
  if(boxInUse == true){
    //println("Inside boxInUse True area");
    if(drag) {
      fill(192,192,192);
      //Fix
      rect(x_drag, y_drag, drag_box_width, drag_box_height, 10);
    }
    image(currentPopup.img, currentPopup.x_Axis, currentPopup.y_Axis, currentPopup.width, currentPopup.height);
    //rect(xtest,ytest,width_test,height_test);
    //updateClickableBoxes(currentPopup, 4);
    //Button test = currentPopup.clickable.get(0);
    
   // println(test.x_Axis);
    //rect(test.x_Axis, test.y_Axis, test.width, test.height);
    //rect(xtest, ytest, width_test, height_test);
    //pop_up_box(xLocation, yLocation);
  }
  // draw the active button in a different color
  fill(127,127,0);

  

  

}

void createNewUserKeyBoardDraw(){
  keyBoardDraw();
}

void createNewUserPinDraw(){
  pinDraw();
}

void drawTimeDate(){
   String timeString;
  
  // draw the active button in a different color
  fill(127,127,0);

  textFont(f);
  textSize(36);
  fill(127,127,127);
  textAlign(CENTER);
  
  timeString = getCurrentTime();
  text(timeString, (canvasWidth/100)*5 , 50);
  text(month() + "/" + day() + "/" + year(), (canvasWidth/100)*6 , 80);
  fill(0);
  
}

void drawProfileButtons(){
  Button temp;
  for (int loopCounter=0; loopCounter < profile.size(); loopCounter++){
    temp = profile.get(loopCounter);
    textSize(18);
    fill(127,127,127);
    rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
     fill(0);
     String nameHolder = userList.get(loopCounter).name;  
     if(nameHolder.length() > 5){
       nameHolder = nameHolder.substring(0,5);
       nameHolder = nameHolder + "..";
       
     }
    text(nameHolder, temp.x_Axis +30 ,temp.y_Axis + 20 );
  } 
  temp = profile.get(profile.size()-1);
  fill(127,127,127);
   
  ellipse(newUserButton.x_Axis,newUserButton.y_Axis,newUserButton.width, newUserButton.height);
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
  //stage 3 only
  if(stage != 3){
    return;
  }
  
  if(drag == false && isHidden == false){
     originalX = currentPopup.x_Axis;
    originalY = currentPopup.y_Axis;
    dragDifx = mouseX-currentPopup.x_Axis;
    dragDify = mouseY-currentPopup.y_Axis;
  }
  
  
  if(insideBox(currentPopup.x_Axis, currentPopup.y_Axis, currentPopup.width, currentPopup.height )&& isHidden ==false ){
    drag = true;
    PopUpDrag();
    iconDrag = false;
    return;
  }
  
  if(iconDrag == false && isHidden == false){
     dragLoopInsideBox() ;
     int x = userList.get(whichUser).buttonSet.get(iconIndex).x_Axis;
     draggingIndex = iconIndex;
     iconDragDifx = mouseX-x;
     selectedIconX_axis = x;

     //println("DEBUG 2: " + iconIndex + "selected: " + selectedIconX_axis);
     
  }
   

  
  if(loopInsideBoxWithoutSet() && isHidden ==false  ){
    
    swap(userList.get(whichUser).buttonSet.get(draggingIndex));
    
    iconDrag = true;
    drag = false;
    IconsDrag();
    return;
  }

  
}
void swap(Button current){
  
  int tempx;
  ArrayList<Button> blist = userList.get(whichUser).buttonSet;
  int len = blist.size();
  for(int i = 0 ;i<len;i++){
    // right only
    if(current.x_Axis+ buttonX > blist.get(i).x_Axis && current.x_Axis+buttonX < blist.get(i).x_Axis + buttonX){
      
     
      tempx = blist.get(i).x_Axis;
      println("DEBUG 0: " + draggingIndex + " selected: " + selectedIconX_axis + " new Selected" +  tempx );
      
      
      blist.get(i).x_Axis = selectedIconX_axis;
      selectedIconX_axis = tempx;
      
      
      return;
    }
    //else if(current.x_Axis < blist.get(i).x_Axis + buttonX && current.x_Axis > blist.get(i).x_Axis ){
    //  tempx = blist.get(i).x_Axis;
    //  blist.get(i).x_Axis = selectedIconX_axis;
    //  selectedIconX_axis = tempx;
    //  println("DEBUG 1");
    //  return;
      
    //}
  }
  
  
}

void updateClickableBoxes(Popup box, int f) {
  
  if(f == 4) {
      xtest = box.x_Axis + 140;
      ytest = box.y_Axis + 250;
    
       //xtest = int((xLocation/100)*125);
       //ytest = int((yLocation/100)*180);
      
       width_test = int((healthWidth/100)*20);
       height_test = int((healthHeight/100)*15);
       

  }
  
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
      //updateXYLocation(currentPopup.function);

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

  }
  
  //Profile Selection Screen to Pin
  else if(stage == 1){
    profileSelect_MouseReleased();
    drag = false;
    iconDrag = false;

  }
  
  // Check if pin is correct or not 
  // If pin is correct go to display Screen
  // else go to incorrect Screen
  // image button has it own mousePressed 
   
  else if(stage == 2){
    
    if(profileSelect_MouseReleased() == false){
   
      if(outsidePinArea() == true){
        resetPinInfo();
        whichUser = -1;
        stage = 1;
      }
    }
  }
  //General User Screen
  else if(stage == 3){
    UserScreen_MouseReleased();
  } 
  //Create new User Screen
  else if(stage == 4){
    
   if(profileSelect_MouseReleased() == false){
    if(outsidePinArea() == true){
      resetPinInfo();
      whichUser = -1;
      stage = 1;
    }
   }
  }

  return;
  
}

boolean profileSelect_MouseReleased(){
  Button temp;
  
  //ellipse((index+66+(2*(canvasWidth/100))),temp.y_Axis+15, 30, 30);
  if(insideCircle(newUserButton.x_Axis,newUserButton.y_Axis,newUserButton.width)){
    stage = 4;
    whichUser=-1;
    resetPinInfo();
    userSelected = false;
    return true;
  }
  
  
  for (int loopCounter=0; loopCounter < profile.size(); loopCounter++){
    temp = profile.get(loopCounter);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height) && whichUser != loopCounter){
      userSelected = true;
      whichUser = loopCounter;
      resetPinInfo();
      stage = 2;
      return true;
    }
    else if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height) &&whichUser == loopCounter){

      return true;
    }
    
    
    
  }
  return false;
  

}

void UserScreen_MouseReleased(){
  
  //change to general user
  User guest = userList.get(0);

  
  if(insideBox(guest.hid.x_Axis,guest.hid.y_Axis,guest.hid.width,guest.hid.height)){
    isHidden = !isHidden;

    return;
  }
  if(isHidden){

    return;
  }
  if(iconDrag){
      userList.get(whichUser).buttonSet.get(iconIndex).x_Axis = selectedIconX_axis;
  } 

  if(boxInUse && outsideBox(currentPopup.x_Axis, currentPopup.y_Axis, currentPopup.width, currentPopup.height)) {
    
    background(255);
    boxInUse = false;
    if(clickOtherButton()){
      boxInUse = true;   
      User u = userList.get(whichUser);
      Button currentButton = u.buttonSet.get(iconIndex);      
      getCurrentButtonPopup(functionInUse);

    }
    drag = false;
    iconDrag = false;
    return;
      
    
  }
    if((loopInsideBox() || iconDrag== true)  && !boxInUse){
    //pop_up_box(xLocation, yLocation);

    User u = userList.get(whichUser);
    Button currentButton = u.buttonSet.get(iconIndex);
    
    //checkButtonFunction(currentButton);
    getCurrentButtonPopup(functionInUse);
    //currentPopup = new Popup("Data/9gag_desktop.png", int(xLocation), int(yLocation), int(gagWidth), int(gagHeight));

    boxInUse = true;
    //println("LINE 925");
    println("DEBUG 25");
    drag = false;
    iconDrag = false;
    return;
  }
  

  if (loopInsideBox() ){
    User u = userList.get(whichUser);
    Button b = u.buttonSet.get(iconIndex);
    int x = userList.get(whichUser).buttonSet.get(iconIndex).x_Axis;
    //println("DEBUG 1");
    //iconDrag = true;
    iconDragDifx = mouseX-x;
     //dragDify = mouseY-yLocation;
    
  }
  
 
  else if(insideBox(currentPopup.x_Axis, currentPopup.y_Axis, currentPopup.width, currentPopup.height) ) {
    //drag = true;
    originalX = xLocation;
    originalY = yLocation;
    dragDifx = mouseX-xLocation;
    dragDify = mouseY-yLocation;
    println("DEBUG 2");
    drag = false;
    iconDrag = false;
  }
  else {
    drag = false;
    iconDrag = false;
    
  }
  
  
  
 
  

}

// Check if a different function button has been press
boolean clickOtherButton(){
  int temp = findButton();
  println("DEBUG(5): functionInUse: " + functionInUse + "return :"+temp );
  if(temp != -1 && temp != functionInUse ){
    functionInUse = temp;
    return true;
  } 
  return false;
}

//loop through icon button and set the index
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

boolean dragLoopInsideBox(){
  Button temp;
  User guest = userList.get(0);
  for(int i = 0;i<guest.buttonSet.size();i++){
    
    temp = guest.buttonSet.get(i);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height)){
     // functionInUse = temp.function;
      println("Button "+ temp.function  + " Clicked" );
      iconIndex = i;
      return true;
    }
  }
  return false;
}


//loop through icon button and dont set the index
boolean loopInsideBoxWithoutSet(){
  Button temp;
  User guest = userList.get(0);
  for(int i = 0;i<guest.buttonSet.size();i++){
    
    temp = guest.buttonSet.get(i);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height)){
       //functionInUse = temp.function;
       println("Button "+ temp.function  + " Clicked" );
      return true;
    }
  }
  return false;
}



// Need to be rewritten
int findButton(){
  Button temp;
  User guest = userList.get(whichUser);
  for(int i = 0;i<guest.buttonSet.size();i++){
    
    temp = guest.buttonSet.get(i);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height)){
      println("find Button "+ temp.function + " Clicked" );
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

  rect(x, y, currentPopup.width, currentPopup.height, 7);
  boxInUse = true;
  
}

boolean outsidePinArea(){
    
    int x =  int(((canvasWidth/100)*51) - buttonXSize - (canvasWidth/100)*1.5);
    
    int xEnd = int( ((canvasWidth/100)*49) + 2*buttonXSize +  (canvasWidth/100)*1.5) ;
    
    int y = int(((canvasHeight/100)*50));
    
    int yEnd = int(((canvasHeight/100)*59)+ buttonYSize*2.5 );
    
  if((mouseX < x || mouseX >= (xEnd)) || ((mouseY < y) || mouseY > (yEnd))) {
   
     return true;
   }
   else {
     return false;
   }
   
}

void resetPinInfo(){
  pinFlag = 0;  //A flag that you keep to track how many buttons are pressed.
  pinSpace = 0; //The space of the stars when they are printed
  pin = ""; //Keeps track of the pins and stores them
  comfirmPin = pin;
  pinRep = ""; //Represents the stars in the pin and how many there are by storing the number
  isPressed = false;
  userSelected = false; // If a user is select to enter Pin set to true
  isPinPressed = false;
  wrongPin = false;
  wrongConfirmPin = false;
  stage4Part = 1;
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
   temp.changeX(int((canvasWidth/100)*50));
   
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
   temp.changeX(int((canvasWidth/100)*52.5)-(X/2));
   int tempx = int((canvasWidth/100)*52.5)-(X/2);
   
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
     
     //println("DEBUG 10 tempx " +i+ ": " + tempx);
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
  PImage img; 
  Button(String file, int x, int y,int w,int h, int f){
    img = loadImage(file);
    x_Axis = x;
    y_Axis = y;
    width = w;
    height = h;
    //0 for function menu
    //1 for setting
    function = f;
  }
  
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
          //println(pin);  //Testing purpose
          pinRep = pinRep.substring( 0, pinRep.length()-1 );
          pinSpace = pinSpace - 15;
          textSize(40);
          fill(255);
          //text("*", (int)canvasWidth/4 + 315 + pinSpace, (int)canvasHeight/3 + 45);
          //println(pinRep);    //Testing purpose
        }
        
        else if(pinFlag < 4 && number != "back" && number!= "ok"){                 
          fill(0);
          pinRep = pinRep + "*";
          textSize(40);
          //text("*",(int)canvasWidth/4 + 315 + pinSpace, (int)canvasHeight/3 + 45);
          pinSpace = pinSpace + 15;
          pin = pin + number;
          //println(pin);  //Testing purpose
          pinFlag = pinFlag+1;
        }
        
      if(number == "ok" && pinFlag < 4)
      {
        //Print in red text say require 4 number
        
      }
      
      if(number == "ok" && pinFlag == 4){
        //showMessageDialog(null, "PIN successfully added", "Info", INFORMATION_MESSAGE);
        // User login
        if(stage == 2){
          if(comparePin(pin) ){
            stage = 3;
          }
          else{
             wrongPin = true;
          }
        }
        //User create new user
        else if(stage == 4){
          whichUser = -1;
          if(stage4Part == 1){
            comfirmPin = pin;
            wrongConfirmPin = false;
            stage4Part = 2;
          }
          else if(stage4Part == 2){
            if(compareComfirmPin(pin)){
            
              addProfileButton(profile,66,30,numberOfUser);
              User temp = new User(numberOfUser+"PlaceHolder",pin);
              userList.add(temp);
              stage = 1;
              numberOfUser++;
            }
            else{
              wrongConfirmPin = true;
            }
            stage4Part = 1;
          }
         
          
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
  
  boolean compareComfirmPin(String pinString){
    
    if(pinString.equals(comfirmPin)){
      return true;
    }
    
    return false;
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
  
  Popup(String file, int x, int y, int w, int h, int f) {
    x_Axis = x;
    y_Axis = y;
    width = w;
    height = h;
    
    function = f;
    
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
    //Button temp = new Button(x_Axis + x,y_Axis + y,w,h,f);
    //clickable.add(temp);
   
  }
}

class User{

  String name;
  ArrayList<Button> buttonSet = new ArrayList<Button>();
  //ArrayList<Integer> usrFunctionActive = new ArrayList<Integer>();
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
    hid = new Button("Data/hide_icon.png", int((canvasWidth - buttonX) - ((canvasWidth/100) *2)),int((canvasHeight- buttonY) - ((canvasHeight/100) *2)),buttonX,buttonY,-1);
    //isHidden = false;
    //Create the Default buttons
    ///////////////////////////////////////////////////
    
    //setting button
    Button temp = new Button("Data/settings_icon.png", int((canvasWidth/100)*49.5 - buttonX), int((canvasHeight/100)*90) ,iconSizeX,iconSizeY,0);
    buttonSet.add(temp);
    
    //Menu button
    temp = new Button("Data/menu_icon.png", int((canvasWidth/100)*50.5), int((canvasHeight/100)*90) ,iconSizeX,iconSizeY,1);
    buttonSet.add(temp);
    
    ///////////////////////////////////////////////////
    
  }
 
 
  
 void addButton(String file, int f){

   // odd number of functions before add new
   if(buttonSet.size()%2 == 1){
     
     Button temp; 
     Button temp2; 
     temp = new Button(file, 0, int((canvasHeight/100)*90) ,buttonX,buttonY,f);
     buttonSet.add(temp);
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
     temp = new Button(file, 0, int((canvasHeight/100)*90) ,buttonX,buttonY,f);
     buttonSet.add(temp);
     temp = buttonSet.get(0);
     temp.changeX(int((canvasWidth/100)*49.9)-(buttonX/2));
     int tempx = int((canvasWidth/100)*49.9)-(buttonX/2);
     
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

     }
   }
   
  }
  
  
  void removeButton(int f){

   // odd number of functions before add new
   if(buttonSet.size()%2 == 1){
     
     Button temp; 

     buttonSet.remove(f);
     temp = buttonSet.get(0);
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
     buttonSet.remove(f);

     int tempx = int((canvasWidth/100)*49.9)-(buttonX/2);
     
     for (int i=1; i < buttonSet.size(); i = i+2){
        tempx = tempx  - int(buttonX + (canvasWidth/100));
     }
     temp = buttonSet.get(0);
     temp.changeX(tempx);
     for (int i=1; i < buttonSet.size(); i++){
       temp = buttonSet.get(i);
       temp.changeX(tempx +(i* int(buttonX + (canvasWidth/100))));
     }
   }
   
  }
}

class ImageKeyButtons extends PinButton 

{

  PImage base;

  PImage roll;

  PImage down;

  PImage currentimage;
  
  String number = "";


  ImageKeyButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown, String num) 

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
      isKeyPressed = true;

    } else if (isOver){
     
      currentimage = roll;
      if(isKeyPressed == true)
      {
      isKeyPressed = false; 
      if(number == "back" && keyFlag > 0)
      {  
        if(keyFlag > 1) //Do it before drawing the value as you want to draw out the value from -1
        {
        eraseKey = keyTracker.substring (keyTracker.length()-1, keyTracker.length());
        keyTracker = keyTracker.substring(0, keyTracker.length() - 1);
        //keyRep = keyRep.substring(0, keyRep.length()-1);
        //println(eraseKey);
        }
        if(keyFlag == 1) //Have to do it afterwards because theres only 1 value you're overwriting then you erase
        {
        eraseKey = keyTracker.substring (0, keyTracker.length());
        keyTracker = keyTracker.substring(0, keyTracker.length()-1);
        }
        //keySpace = keySpace - 20;
        keySpace = keySpace - (int)textWidth(eraseKey);
        textSize(30);
        fill(102);
        text(eraseKey,(int)canvasWidth/2 - 200 + keySpace, (int)canvasHeight/2 + 310);
        keyFlag = keyFlag-1;
        //if(keyFlag > 1) //Do it before drawing the value as you want to draw out the value from -1
        //{
        //keyTracker = keyTracker.substring (  0, keyTracker.length()-1 );
        //keyRep = keyRep.substring( 0, keyRep.length()-1 );
        //}
        //println(keyTracker);  //Testing purpose
        //keySpace = keySpace - 15;
        //textSize(30);
        //fill(102);
        //text(keyTracker, (int)canvasWidth/2 - 200 + keySpace, (int)canvasHeight/2 + 310);
        //if(keyFlag == 1) //Have to do it afterwards because theres only 1 value you're overwriting then you erase
        //{
        //keyTracker = keyTracker.substring (  0, keyTracker.length()-1 );
        //keyRep = keyRep.substring( 0, keyRep.length()-1 );
        //}
        //println(keyRep);    //Testing purpose
        //keyFlag = keyFlag-1;
      }
      else if(keyFlag < 20 && number != "back" && number != "go" && number != " ")
      {                 
        fill(0);
        keyRep = keyRep + number;
        textSize(30);
        text(number,(int)canvasWidth/2 - 200 + keySpace,(int)canvasHeight/2 + 310);
        //keySpace = keySpace + 20;
        keySpace = keySpace + (int)textWidth(number);export
        keyTracker = keyTracker + number;
        println(keyTracker);  //Testing purpose
        keyFlag = keyFlag+1;
      }
      if(number == " ")
      {
        keyTracker = keyTracker + " ";
        keyFlag++;
        //keySpace = keySpace + 20;
        keySpace = keySpace + (int)textWidth(number);
      }
      //if(number == "ok" && keyFlag < 4)
      //{
      //  showMessageDialog(null, "keyTracker requires four numbers!", "Alert", ERROR_MESSAGE);
      //}
      if(number == "go" && keyFlag > 0)
      {
        //showMessageDialog(null, "keyTracker successfully added", "Info", INFORMATION_MESSAGE);
        for(int i = keyFlag; i >= 1; i--)
        {
        if(i > 1) //Do it before drawing the value as you want to draw out the value from -1
        {
        eraseKey = keyTracker.substring (keyTracker.length()-1, keyTracker.length());
        keyTracker = keyTracker.substring(0, keyTracker.length() - 1);
        //keyRep = keyRep.substring(0, keyRep.length()-1);
        //println(eraseKey);
        }
        if(i == 1) //Have to do it afterwards because theres only 1 value you're overwriting then you erase
        {
        eraseKey = keyTracker.substring (0, keyTracker.length());
        keyTracker = keyTracker.substring(0, keyRep.length());
        }
        //keySpace = keySpace - 20;
        keySpace = keySpace - (int)textWidth(eraseKey);
        textSize(30);
        fill(102);
        text(eraseKey,(int)canvasWidth/2 - 200 + keySpace, (int)canvasHeight/2 + 310);
        }
        keyFlag = 0;
        keyTracker = "";
        keyRep = "";
        keySpace = 0;
      }
      }
    } else {
    
      currentimage = base;

    }

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