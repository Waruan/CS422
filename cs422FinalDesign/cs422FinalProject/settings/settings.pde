//Shanil Lobanwala PinCode

class HScrollbar

{

  int swidth, sheight;    // width and height of bar

  int xpos, ypos;         // x and y position of bar

  float spos, newspos;    // x position of slider

  int sposMin, sposMax;   // max and min values of slider

  int loose;              // how loose/heavy

  boolean isOver;           // is the mouse over the slider?

  boolean locked;

  float ratio;



  HScrollbar (int xp, int yp, int sw, int sh, int l) {

    swidth = sw;

    sheight = sh;

    int widthtoheight = sw - sh;

    ratio = (float)sw / (float)widthtoheight;

    xpos = xp;

    ypos = yp-sheight/2;

    spos = xpos + swidth/2 - sheight/2;

    newspos = spos;

    sposMin = xpos;

    sposMax = xpos + swidth - sheight;

    loose = l;

  }



  boolean update() {

    if(over()) {

      isOver = true;

    } else {

      isOver = false;

    }

    if(mousePressed && isOver) {

      locked = true;

    }

    if(!mousePressed) {

      locked = false;

    }

    if(locked) {

      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);

    }

    if(abs(newspos - spos) > 1) {

      spos = spos + (newspos-spos)/loose;
      return true;
    }
    return false;
  }



  int constrain(int val, int minv, int maxv) {

    return min(max(val, minv), maxv);

  }



  boolean over() {

    if(mouseX > xpos && mouseX < xpos+swidth &&

    mouseY > ypos && mouseY < ypos+sheight) {

      return true;

    } else {

      return false;

    }

  }

  void setsPos(int dur){
  
    newspos = constrain(dur-sheight/2, sposMin, sposMax);
    if(abs(newspos - spos) > 1) {

      spos = spos + (newspos-spos)/loose;

    }
    
  }

  void display() {

    fill(255);

    rect(xpos, ypos, swidth, sheight);
    //println(swidth);
    if(isOver || locked) {

      fill(153, 102, 0);

    } else {

      fill(102, 102, 102);

    }

    ellipse(spos, ypos+sheight/2, sheight, sheight);
    //println(spos);
  }



  float getPos() {

    // Convert spos to be values between

    // 0 and the total width of the scrollbar

    return spos * ratio;

  }

}

import static javax.swing.JOptionPane.*;
ImageButtons buttongearIcon;
ImageButtons buttonIconSize;
ImageButtons buttonBluetooth;
ImageButtons buttonTime;
ImageButtons buttonPersonalization;
ImageButtons buttonContrast;
ImageButtons buttonLanguage;
ImageButtons buttonNewsFeed;
ImageButtons buttonLocation;
ImageButtons buttonTransparency;
ImageButtons buttonWifi;
ImageButtons buttonpinOk;
ImageButtons buttonBluetoothOn;
ImageButtons buttonBluetoothOff;
ImageButtons buttonpacificTimeZone;
ImageButtons buttoncentralTimeZone;
ImageButtons buttonmountainTimeZone;
ImageButtons buttoneasternTimeZone;
ImageButtons buttonchangeName;
ImageButtons buttonchangePin;
ImageButtons buttonenglish;
ImageButtons buttonspanish;
ImageButtons buttonarabic;
ImageButtons buttondeutsch;
ImageButtons buttondutch;
ImageButtons buttonfrench;
ImageButtons buttonitalian;
ImageButtons buttonjapanese;
ImageButtons buttonnorwegian;
ImageButtons buttonpolish;
ImageButtons buttonfilter1;
ImageButtons buttonfilter2;
ImageButtons buttonfilter3;
ImageButtons buttonfilter4;
ImageButtons buttonremovefilter1;
ImageButtons buttonremovefilter2;
ImageButtons buttonremovefilter3;
ImageButtons buttonremovefilter4;
ImageButtons buttonwifiOn;
ImageButtons buttonwifiOff;
ImageButtons buttonuicWifi;
ImageButtons buttonuicWifi2;
ImageButtons buttonuicWifi3;
int buttonSize = 90;
int pinFlag = 0;  //A flag that you keep to track how many buttons are pressed.
int pinSpace = 0; //The space of the stars when they are printed
String pin = ""; //Keeps track of the pins and stores them
String pinRep = ""; //Represents the stars in the pin and how many there are by storing the number
String locationDefault = "Chicago, Illinois";
boolean isPressed = false;
PFont f;
int settingFlag = 0;
int displayFlag = 0;
int buttonX = 66 ;
int buttonY = 60;
int languageFlag = 0; //0 for english 1 for spanish
int filterFlag1 = 0;
int filterFlag2 = 0;
int filterFlag3 = 0;
int filterFlag4 = 0;
int addedFilter = 0; //Moving added filter to added column
int wifiFlag = 0; //keep track if its on or off on == 0 and off == 1
// evl monitor size
float canvasWidth = 2732;
float canvasHeight = 1536;
float iconAdjust = 0.5;
PImage butgearIcon;
PImage bluetoothOn;
PImage bluetoothOff;
PImage bluetooth;
PImage pacificTimeZone;
PImage centralTimeZone;
PImage easternTimeZone;
PImage mountainTimeZone;
PImage changeName;
PImage changePin;
PImage arabic;
PImage deutsch;
PImage dutch;
PImage english;
PImage spanish;
PImage french;
PImage italian;
PImage japanese;
PImage norwegian;
PImage polish;
PImage filter1;
PImage filter2;
PImage filter3;
PImage filter4;
PImage removefilter1;
PImage removefilter2;
PImage removefilter3;
PImage removefilter4;
PImage wifiOn;
PImage wifiOff;
PImage uicWifi;
PImage uicWifi2;
PImage uicWifi3;
int filterX = (int)canvasWidth/2 - 215;
int changeX = (int)canvasWidth/2 - 135;
int languageX = (int)canvasWidth/2 - 185;

int filterY1 = (int)canvasHeight/2 + 300;
int filterY2 = (int)canvasHeight/2 + 350;
int filterY3 = (int)canvasHeight/2 + 400;
int filterY4 = (int)canvasHeight/2 + 450;

int network1Y = (int)canvasHeight/2 + 255;
int network2Y = (int)canvasHeight/2 + 355;
int network3Y = (int)canvasHeight/2 + 395;
// scale down for home monitors
//float canvasWidth = 1366;
//float canvasHeight = 768;
float slideOffset = (canvasWidth/2 - 250);
HScrollbar hs1 = new HScrollbar(int(slideOffset), (int)(canvasHeight/2 + 400), 350, 35, 1);

//HScrollbar hs2 = new HScrollbar(0, height-20, width, 10, 1);


void setup()

{

  size(2732, 1536);

  background(102, 102, 102);
  
  // Define and create image button

  butgearIcon = loadImage("Data/gearSetting.png");
  
  butgearIcon.resize(buttonX, buttonY);
  
  PImage butIconSize = loadImage("Data/sizeSetting.png");
  
  butIconSize.resize(buttonX, buttonY);

  PImage butBluetooth = loadImage("Data/bluetoothSetting.png");
  
  butBluetooth.resize(buttonX, buttonY);

  PImage butTime = loadImage("Data/timeSetting.png");
  
  butTime.resize(buttonX, buttonY);
  
  PImage butPersonalization = loadImage("Data/personalizationSetting.png");
  
  butPersonalization.resize(buttonX, buttonY);
  
  PImage butContrast = loadImage("Data/contrastSetting.png");
  
  butContrast.resize(buttonX, buttonY);
  
  PImage butLanguage = loadImage("Data/languageSetting.png");
  
  butLanguage.resize(buttonX, buttonY);
  
  PImage butNewsFeed = loadImage("Data/newsFeedSetting.png");
  
  butNewsFeed.resize(buttonX, buttonY);
  
  PImage butLocation = loadImage("Data/locationSetting.png");
  
  butLocation.resize(buttonX, buttonY);
  
  PImage butTransparency = loadImage("Data/transperencySetting.png");
  
  butTransparency.resize(buttonX, buttonY);
  
  PImage butWifi = loadImage("Data/wifiSetting.png");
  
  butWifi.resize(buttonX, buttonY);
  
  bluetoothOn = loadImage("Data/bluetoothOn.jpg");
  
  bluetoothOn.resize(33, 30);
  
  bluetoothOff = loadImage("Data/bluetoothOff.jpg");
  
  bluetoothOff.resize(33, 30);
  
  bluetooth = loadImage("Data/bluetooth.png");
  
  bluetooth.resize(23, 20);
  
  pacificTimeZone = loadImage("Data/pacificTimeZone.png");
  
  pacificTimeZone.resize(150, 40);
  
  centralTimeZone = loadImage("Data/centralTimeZone.png");
  
  centralTimeZone.resize(150, 40);
  
  easternTimeZone = loadImage("Data/easternTimeZone.png");
  
  easternTimeZone.resize(150, 40);
  
  mountainTimeZone = loadImage("Data/mountainTimeZone.png");
  
  mountainTimeZone.resize(150, 40);
  
  PImage pacificTimeZoneChanged = loadImage("Data/pacificTimeZoneChanged.gif");
  
  pacificTimeZoneChanged.resize(150, 40);
  
  PImage centralTimeZoneChanged = loadImage("Data/centralTimeZoneChanged.gif");
  
  centralTimeZoneChanged.resize(150, 40);
  
  PImage easternTimeZoneChanged = loadImage("Data/easternTimeZoneChanged.gif");
  
  easternTimeZoneChanged.resize(150, 40);
  
  PImage mountainTimeZoneChanged = loadImage("Data/mountainTimeZoneChanged.gif");
  
  mountainTimeZoneChanged.resize(150, 40);
  
  changeName = loadImage("Data/changeName.png");
  
  changeName.resize(150, 40);
  
  changePin = loadImage("Data/changePin.png");
  
  changePin.resize(150, 40);
  
  arabic = loadImage("Data/arabic.jpg");
  arabic.resize(29, 12);
  deutsch = loadImage("Data/deutsch.jpg");
  deutsch.resize(29, 12);
  dutch= loadImage("Data/dutch.jpg");
  dutch.resize(29, 12);
  english= loadImage("Data/english.jpg");
  english.resize(29, 12);
  spanish= loadImage("Data/spanish.jpg");
  spanish.resize(29, 12);
  french= loadImage("Data/french.jpg");
  french.resize(29, 12);
  italian= loadImage("Data/italian.jpg");
  italian.resize(29, 12);
  japanese= loadImage("Data/japanese.jpg");
  japanese.resize(29, 12);
  norwegian= loadImage("Data/norwegian.jpg");
  norwegian.resize(29, 12);
  polish= loadImage("Data/polish.jpg");
  polish.resize(29, 12);
  //filter images
  filter1 = loadImage("Data/filter1.png");
  filter1.resize(120, 40);
  filter2 = loadImage("Data/filter2.png");
  filter2.resize(120, 40);
  filter3 = loadImage("Data/filter3.png");
  filter3.resize(120, 40);
  filter4 = loadImage("Data/filter4.png");
  filter4.resize(120, 40);
  removefilter1 = loadImage("Data/bluetoothOff.jpg");
  removefilter1.resize(30, 30);
  removefilter2 = loadImage("Data/bluetoothOff.jpg");
  removefilter2.resize(30, 30);
  removefilter3 = loadImage("Data/bluetoothOff.jpg");
  removefilter3.resize(30, 30);
  removefilter4 = loadImage("Data/bluetoothOff.jpg");
  removefilter4.resize(30, 30);
  wifiOn = loadImage("Data/wifiOn.png");
  wifiOn.resize(50, 19);
  wifiOff = loadImage("Data/wifiOff.png");
  wifiOff.resize(50, 19);
  uicWifi = loadImage("Data/uicWifi.png");
  uicWifi.resize(270, 40);
  uicWifi2 = loadImage("Data/uicWifi2.png");
  uicWifi2.resize(270, 40);
  uicWifi3 = loadImage("Data/uicWifi3.png");
  uicWifi3.resize(270, 40);
  int x0 = (int)canvasWidth/2 - 100;
  
  //Icons in setting tray x and ys from left to right and up to down
  int iconX1 = (int)canvasWidth/2 - 200;
  int iconX2 = (int)canvasWidth/2 + 20;
  int iconY1 = (int)canvasHeight/2 + 220;
  int iconY2 = (int)canvasHeight/2 + 280;
  int iconY3 = (int)canvasHeight/2 + 340;
  int iconY4 = (int)canvasHeight/2 + 400;
  int iconY5 = (int)canvasHeight/2 + 460;
  //
  //settingButtons for each setting
  //top row
  //Left to right
  
  //bluetooth
  int bluetoothX = (int)canvasWidth/2 - 30;
  int bluetoothY = (int)canvasHeight/2 + 340;
  
  //timezone
  int timezoneX = (int)canvasWidth/2 - 240;
  int timezoneX2 = (int)canvasWidth/2 - 30;
  int timezoneY1 = (int)canvasHeight/2 + 340;
  int timezoneY2 = (int)canvasHeight/2 + 440;
  
  //for gear
  int y0 = (int)canvasHeight/2 + 520;
  
  //For changing name and pin
  int changeY1 = (int)canvasHeight/2 + 300;
  int changeY2 = (int)canvasHeight/2 + 400;
  
  //remove filter locations
  int removeXfilter = (int)canvasWidth/2 + 100;
  int removeYfilter1 = (int)canvasHeight/2 + 325;
  int removeYfilter2 = (int)canvasHeight/2 + 375;
  int removeYfilter3 = (int)canvasHeight/2 + 425;
  int removeYfilter4 = (int)canvasHeight/2 + 475;
  int removefilterWidth = 30;
  int removefilterHeight = 30;
  int filterWidth = 120;
  int filterHeight = 40;
  
  //language flag locations
  int langY1 = (int)canvasHeight/2 + 300;
  int langY2 = (int)canvasHeight/2 + 320;
  int langY3 = (int)canvasHeight/2 + 340;
  int langY4 = (int)canvasHeight/2 + 360;
  int langY5 = (int)canvasHeight/2 + 380;
  int langY6 = (int)canvasHeight/2 + 400;
  int langY7 = (int)canvasHeight/2 + 420;
  int langY8 = (int)canvasHeight/2 + 440;
  int langY9 = (int)canvasHeight/2 + 460;
  int langY10 = (int)canvasHeight/2 + 480;
  int languageWidth = 29;
  int languageHeight = 12;
  
  //Wifi locations
  int wifiX = (int)canvasWidth/2 - 65;
  int networkX = (int)canvasWidth/2 - 205;
  int wifiY = (int)canvasHeight/2 + 205;
  int wifiWidth = 50;
  int wifiHeight = 19;
  int networkWidth = 270;
  int networkHeight = 40;
  
  //icon width
  int w = 33;
  
  //icon height
  int h = 30;
  
  //Setting Icons
  buttongearIcon = new ImageButtons(x0, y0, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butgearIcon, butgearIcon, butgearIcon, 0);
  buttonIconSize = new ImageButtons(iconX1, iconY3, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butIconSize, butIconSize, butIconSize, 1);
  buttonBluetooth = new ImageButtons(iconX2, iconY5, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butBluetooth, butBluetooth, butBluetooth, 2);
  buttonTime = new ImageButtons(iconX2, iconY2, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butTime, butTime, butTime, 3);
  buttonPersonalization = new ImageButtons(iconX2, iconY1, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butPersonalization, butPersonalization, butPersonalization, 10);
  buttonContrast = new ImageButtons(iconX1, iconY1, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butContrast, butContrast, butContrast, 13);
  buttonLanguage = new ImageButtons(iconX1, iconY5, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butLanguage, butLanguage, butLanguage, 14);
  buttonNewsFeed = new ImageButtons(iconX2, iconY3, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butNewsFeed, butNewsFeed, butNewsFeed, 25);
  buttonLocation = new ImageButtons(iconX2, iconY4, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butLocation, butLocation, butLocation, 34);
  buttonTransparency = new ImageButtons(iconX1, iconY2, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butTransparency, butTransparency, butTransparency, 35);
  buttonWifi = new ImageButtons(iconX1, iconY4, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butWifi, butWifi, butWifi, 36);
  //Buttons for each different setting
  buttonBluetoothOn = new ImageButtons(bluetoothX, bluetoothY, w, h, bluetoothOn, bluetoothOn, bluetoothOn, 4);
  buttonBluetoothOff = new ImageButtons(bluetoothX, bluetoothY, w, h, bluetoothOff, bluetoothOff, bluetoothOff, 5);
  //Time Zone buttons
  buttonpacificTimeZone = new ImageButtons(timezoneX, timezoneY1, filterWidth, filterHeight, pacificTimeZone, pacificTimeZone, pacificTimeZoneChanged, 6);
  buttoncentralTimeZone = new ImageButtons(timezoneX, timezoneY2, filterWidth, filterHeight, centralTimeZone, centralTimeZone, centralTimeZoneChanged, 7);
  buttoneasternTimeZone = new ImageButtons(timezoneX2, timezoneY1, filterWidth, filterHeight, easternTimeZone, easternTimeZone, easternTimeZoneChanged, 8);
  buttonmountainTimeZone = new ImageButtons(timezoneX2, timezoneY2, filterWidth, filterHeight, mountainTimeZone, mountainTimeZone, mountainTimeZoneChanged, 9);
  //Personalization buttons
  buttonchangeName = new ImageButtons(changeX, changeY1, filterWidth, filterHeight, changeName, changeName, changeName, 11);
  buttonchangePin = new ImageButtons(changeX, changeY2, filterWidth, filterHeight, changePin, changePin, changePin, 12);
  //Language buttons
  buttonarabic = new ImageButtons(languageX, langY1, languageWidth, languageHeight, arabic, arabic, arabic, 15);
  buttondeutsch= new ImageButtons(languageX, langY2, languageWidth, languageHeight, deutsch, deutsch, deutsch, 16);
  buttondutch= new ImageButtons(languageX, langY3, languageWidth, languageHeight, dutch, dutch, dutch, 17);
  buttonenglish= new ImageButtons(languageX, langY4, languageWidth, languageHeight, english, english, english, 18);
  buttonspanish= new ImageButtons(languageX, langY5, languageWidth, languageHeight, spanish, spanish, spanish, 19);
  buttonfrench= new ImageButtons(languageX, langY6, languageWidth, languageHeight, french, french, french, 20);
  buttonitalian= new ImageButtons(languageX, langY7, languageWidth, languageHeight, italian, italian, italian, 21);
  buttonjapanese= new ImageButtons(languageX, langY8, languageWidth, languageHeight, japanese, japanese, japanese, 22);
  buttonnorwegian= new ImageButtons(languageX, langY9, languageWidth, languageHeight, norwegian, norwegian, norwegian, 23);
  buttonpolish= new ImageButtons(languageX, langY10, languageWidth, languageHeight, polish, polish, polish, 24);
  //Filter news buttons
  buttonfilter1 = new ImageButtons(filterX, filterY1, filterWidth, filterHeight, filter1, filter1, filter1, 26);
  buttonfilter2 = new ImageButtons(filterX, filterY2, filterWidth, filterHeight, filter2, filter2, filter2, 27);
  buttonfilter3 = new ImageButtons(filterX, filterY3, filterWidth, filterHeight, filter3, filter3, filter3, 28);
  buttonfilter4 = new ImageButtons(filterX, filterY4, filterWidth, filterHeight, filter4, filter4, filter4, 29);
  //Remove news filter buttons
  buttonremovefilter1 = new ImageButtons(removeXfilter, removeYfilter1, removefilterWidth, removefilterHeight, removefilter1, removefilter1, removefilter1, 30);
  buttonremovefilter2 = new ImageButtons(removeXfilter, removeYfilter2, removefilterWidth, removefilterHeight, removefilter2, removefilter2, removefilter2, 31);
  buttonremovefilter3 = new ImageButtons(removeXfilter, removeYfilter3, removefilterWidth, removefilterHeight, removefilter3, removefilter3, removefilter3, 32);
  buttonremovefilter4 = new ImageButtons(removeXfilter, removeYfilter4, removefilterWidth, removefilterHeight, removefilter4, removefilter4, removefilter4, 33);
  //Turn Wifi On and Off
  buttonwifiOn = new ImageButtons(wifiX, wifiY, wifiWidth, wifiHeight, wifiOn, wifiOn, wifiOn, 37);
  buttonwifiOff = new ImageButtons(wifiX, wifiY, wifiWidth, wifiHeight, wifiOff, wifiOff, wifiOff, 38);
  buttonuicWifi = new ImageButtons(networkX, network1Y, networkWidth, networkHeight, uicWifi, uicWifi, uicWifi, 39);
  buttonuicWifi2 = new ImageButtons(networkX, network2Y, networkWidth, networkHeight, uicWifi2, uicWifi2, uicWifi2, 40);
  buttonuicWifi3 = new ImageButtons(networkX, network3Y, networkWidth, networkHeight, uicWifi3, uicWifi3, uicWifi3, 41);
  f = createFont("Arial",16,true);
  textSize(20);
  fill(102);
  background(102);
  //rect((int)canvasWidth/2 - 115,(int)canvasHeight/2 + 320,95,40);
  fill(0);
  text("Please Enter Pin:", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 280);
 
}



void draw()

{
  background(102);
  
  buttongearIcon.update();
   
  buttongearIcon.display();
 
  //Selecting setting icons
  if(settingFlag == 1 && displayFlag == 0)
  {
   fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
   
   buttonIconSize.update();
   
   buttonIconSize.display();
   
   buttonBluetooth.update();
   
   buttonBluetooth.display();
   
   buttonTime.update();
   
   buttonTime.display();
   
   buttonPersonalization.update();
   
   buttonPersonalization.display();
   
   buttonContrast.update();
   
   buttonContrast.display();
   
   buttonLanguage.update();
   
   buttonLanguage.display();
   
   buttonNewsFeed.update();
   
   buttonNewsFeed.display();
   
   buttonLocation.update();
   
   buttonLocation.display();
   
   buttonTransparency.update();
   
   buttonTransparency.display();
   
   buttonWifi.update();
   
   buttonWifi.display();
  }
  //Changing Icon Size
  if(settingFlag == 1 && displayFlag == 1)
  {
    
    fill(102);
    rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonIconSize.update();
    
    buttonIconSize.display();

    
    iconAdjust = constrain(((hs1.spos - slideOffset)/(hs1.swidth-10)),0.25,1) ;
    //println( constrain((hs1.spos/(hs1.swidth-10)),0.25,1) );
   //float temp =  constrain(((hs1.spos-slideOffset)/(hs1.swidth-10)),0.25,1);
    println(iconAdjust);
    //println("Debug Xsize "+ buttonX); 
    //println("Debug Yize "+ buttonY); 
   // println("Debug adjust  pos"+ hs1.spos); 
    // println("Debug adjust wid"+ (hs1.swidth-10)); 
     
     //noStroke();
     //fill(0);
     //rect(1200,800,buttonX*iconAdjust,buttonY*iconAdjust);
     //rect(1200+ buttonX,800,buttonX*iconAdjust,buttonY*iconAdjust);
     buttongearIcon.w= int(buttonX*iconAdjust);
     buttongearIcon.h= int(buttonY*iconAdjust);
     buttonIconSize.w= int(buttonX*iconAdjust);
     buttonIconSize.h= int(buttonY*iconAdjust);
     buttonBluetooth.w= int(buttonX*iconAdjust);
     buttonBluetooth.h= int(buttonY*iconAdjust);
     buttonTime.w= int(buttonX*iconAdjust);
     buttonTime.h= int(buttonY*iconAdjust);
     buttonPersonalization.w= int(buttonX*iconAdjust);
     buttonPersonalization.h= int(buttonY*iconAdjust);
     buttonContrast.w= int(buttonX*iconAdjust);
     buttonContrast.h= int(buttonY*iconAdjust);
     buttonLanguage.w= int(buttonX*iconAdjust);
     buttonLanguage.h= int(buttonY*iconAdjust);
     buttonNewsFeed.w= int(buttonX*iconAdjust);
     buttonNewsFeed.h= int(buttonY*iconAdjust);
     buttonLocation.w= int(buttonX*iconAdjust);
     buttonLocation.h= int(buttonY*iconAdjust);
     buttonTransparency.w= int(buttonX*iconAdjust);
     buttonTransparency.h= int(buttonY*iconAdjust);
     buttonWifi.w= int(buttonX*iconAdjust);
     buttonWifi.h= int(buttonY*iconAdjust);
     hs1.update();
     hs1.display();
  
  }
  if(settingFlag == 1 && displayFlag == 2)
  {
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    //Open Bluetooth settings
    buttonBluetooth.update();
    
    buttonBluetooth.display();
    
    buttonBluetoothOn.update();
    
    buttonBluetoothOn.display();
  }
  if(settingFlag == 1 && displayFlag == 3)
  {
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    //open up time settings
    buttonpacificTimeZone.update();
    
    buttonpacificTimeZone.display();
    
    buttoncentralTimeZone.update();
    
    buttoncentralTimeZone.display();
    
    buttoneasternTimeZone.update();
    
    buttoneasternTimeZone.display();
    
    buttonmountainTimeZone.update();
    
    buttonmountainTimeZone.display();
  }
  if(settingFlag == 1 && displayFlag == 4)
  {
    fill(102);
   
    rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    //Bluetooth on
    buttonBluetoothOff.update();
    
    buttonBluetoothOff.display();
  }
  if(settingFlag == 1 && displayFlag == 5)
  {
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    //bluetooth Off
    buttonBluetoothOn.update();
    
    buttonBluetoothOn.display();
  }
    if(settingFlag == 1 && displayFlag == 6)
  {
    fill(102);
   
    rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    //Enter code to change time to pacific
    buttonpacificTimeZone.update();
    
    buttonpacificTimeZone.display();
    
    buttoncentralTimeZone.update();
    
    buttoncentralTimeZone.display();
    
    buttoneasternTimeZone.update();
    
    buttoneasternTimeZone.display();
    
    buttonmountainTimeZone.update();
    
    buttonmountainTimeZone.display();
  }
    if(settingFlag == 1 && displayFlag == 7)
  {
    //Enter code to change time to central
    fill(102);
   
    rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
   
    buttonpacificTimeZone.update();
    
    buttonpacificTimeZone.display();
    
    buttoncentralTimeZone.update();
    
    buttoncentralTimeZone.display();
    
    buttoneasternTimeZone.update();
    
    buttoneasternTimeZone.display();
    
    buttonmountainTimeZone.update();
    
    buttonmountainTimeZone.display();
  }
  if(settingFlag == 1 && displayFlag == 8)
  {
    //Enter code to change time to eastern
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonpacificTimeZone.update();
    
    buttonpacificTimeZone.display();
    
    buttoncentralTimeZone.update();
    
    buttoncentralTimeZone.display();
    
    buttoneasternTimeZone.update();
    
    buttoneasternTimeZone.display();
    
    buttonmountainTimeZone.update();
    
    buttonmountainTimeZone.display();
  }
    if(settingFlag == 1 && displayFlag == 9)
  {
    //Enter code to change time to mountain
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonpacificTimeZone.update();
    
    buttonpacificTimeZone.display();
    
    buttoncentralTimeZone.update();
    
    buttoncentralTimeZone.display();
    
    buttoneasternTimeZone.update();
    
    buttoneasternTimeZone.display();
    
    buttonmountainTimeZone.update();
    
    buttonmountainTimeZone.display();
  }
  if(settingFlag == 1 && displayFlag == 10)
  {
    //personalization
    fill(102);
   
    rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    
    buttonchangeName.update();
    
    buttonchangeName.display();
    
    buttonchangePin.update();
    
    buttonchangePin.display();
  }
  if(settingFlag == 1 && displayFlag == 11)
  {
    //Change Name need keyboard
  }
  if(settingFlag == 1 && displayFlag == 12)
  {
    //Change pin need pin pad
  }
  if(settingFlag == 1 && displayFlag == 13)
  {
    //Contrast
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
  }
  if(settingFlag == 1 && displayFlag == 14)
  {
    //Language
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonarabic.display();
    buttonarabic.update();
    buttondeutsch.display();
    buttondeutsch.update();
    buttondutch.update();
    buttondutch.display();
    buttonenglish.display();
    buttonenglish.update();
    buttonspanish.display();
    buttonspanish.update();
    buttonfrench.update();
    buttonfrench.display();
    buttonitalian.update();
    buttonitalian.display();
    buttonjapanese.update();
    buttonjapanese.display();
    buttonnorwegian.update();
    buttonnorwegian.display();
    buttonpolish.update();
    buttonpolish.display();
  }
  if(settingFlag == 1 && displayFlag == 15)
  {
    //Arabic
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonarabic.display();
    buttonarabic.update();
    buttondeutsch.display();
    buttondeutsch.update();
    buttondutch.update();
    buttondutch.display();
    buttonenglish.display();
    buttonenglish.update();
    buttonspanish.display();
    buttonspanish.update();
    buttonfrench.update();
    buttonfrench.display();
    buttonitalian.update();
    buttonitalian.display();
    buttonjapanese.update();
    buttonjapanese.display();
    buttonnorwegian.update();
    buttonnorwegian.display();
    buttonpolish.update();
    buttonpolish.display();
  }
  if(settingFlag == 1 && displayFlag == 16)
  {
    //Deutsch
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonarabic.display();
    buttonarabic.update();
    buttondeutsch.display();
    buttondeutsch.update();
    buttondutch.update();
    buttondutch.display();
    buttonenglish.display();
    buttonenglish.update();
    buttonspanish.display();
    buttonspanish.update();
    buttonfrench.update();
    buttonfrench.display();
    buttonitalian.update();
    buttonitalian.display();
    buttonjapanese.update();
    buttonjapanese.display();
    buttonnorwegian.update();
    buttonnorwegian.display();
    buttonpolish.update();
    buttonpolish.display();
  }
  if(settingFlag == 1 && displayFlag == 17)
  {
    //dutch
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonarabic.display();
    buttonarabic.update();
    buttondeutsch.display();
    buttondeutsch.update();
    buttondutch.update();
    buttondutch.display();
    buttonenglish.display();
    buttonenglish.update();
    buttonspanish.display();
    buttonspanish.update();
    buttonfrench.update();
    buttonfrench.display();
    buttonitalian.update();
    buttonitalian.display();
    buttonjapanese.update();
    buttonjapanese.display();
    buttonnorwegian.update();
    buttonnorwegian.display();
    buttonpolish.update();
    buttonpolish.display();
  }
  if(settingFlag == 1 && displayFlag == 18)
  {
    //english
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonarabic.display();
    buttonarabic.update();
    buttondeutsch.display();
    buttondeutsch.update();
    buttondutch.update();
    buttondutch.display();
    buttonenglish.display();
    buttonenglish.update();
    buttonspanish.display();
    buttonspanish.update();
    buttonfrench.update();
    buttonfrench.display();
    buttonitalian.update();
    buttonitalian.display();
    buttonjapanese.update();
    buttonjapanese.display();
    buttonnorwegian.update();
    buttonnorwegian.display();
    buttonpolish.update();
    buttonpolish.display();
  }
  if(settingFlag == 1 && displayFlag == 19)
  {
    //spanish
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonarabic.display();
    buttonarabic.update();
    buttondeutsch.display();
    buttondeutsch.update();
    buttondutch.update();
    buttondutch.display();
    buttonenglish.display();
    buttonenglish.update();
    buttonspanish.display();
    buttonspanish.update();
    buttonfrench.update();
    buttonfrench.display();
    buttonitalian.update();
    buttonitalian.display();
    buttonjapanese.update();
    buttonjapanese.display();
    buttonnorwegian.update();
    buttonnorwegian.display();
    buttonpolish.update();
    buttonpolish.display();
  }
  if(settingFlag == 1 && displayFlag == 20)
  {
    //french
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonarabic.display();
    buttonarabic.update();
    buttondeutsch.display();
    buttondeutsch.update();
    buttondutch.update();
    buttondutch.display();
    buttonenglish.display();
    buttonenglish.update();
    buttonspanish.display();
    buttonspanish.update();
    buttonfrench.update();
    buttonfrench.display();
    buttonitalian.update();
    buttonitalian.display();
    buttonjapanese.update();
    buttonjapanese.display();
    buttonnorwegian.update();
    buttonnorwegian.display();
    buttonpolish.update();
    buttonpolish.display();
  }
  if(settingFlag == 1 && displayFlag == 21)
  {
    //italian
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonarabic.display();
    buttonarabic.update();
    buttondeutsch.display();
    buttondeutsch.update();
    buttondutch.update();
    buttondutch.display();
    buttonenglish.display();
    buttonenglish.update();
    buttonspanish.display();
    buttonspanish.update();
    buttonfrench.update();
    buttonfrench.display();
    buttonitalian.update();
    buttonitalian.display();
    buttonjapanese.update();
    buttonjapanese.display();
    buttonnorwegian.update();
    buttonnorwegian.display();
    buttonpolish.update();
    buttonpolish.display();
  }
  if(settingFlag == 1 && displayFlag == 22)
  {
    //japanese
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonarabic.display();
    buttonarabic.update();
    buttondeutsch.display();
    buttondeutsch.update();
    buttondutch.update();
    buttondutch.display();
    buttonenglish.display();
    buttonenglish.update();
    buttonspanish.display();
    buttonspanish.update();
    buttonfrench.update();
    buttonfrench.display();
    buttonitalian.update();
    buttonitalian.display();
    buttonjapanese.update();
    buttonjapanese.display();
    buttonnorwegian.update();
    buttonnorwegian.display();
    buttonpolish.update();
    buttonpolish.display();
  }
  if(settingFlag == 1 && displayFlag == 23)
  {
    //norwegian
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonarabic.display();
    buttonarabic.update();
    buttondeutsch.display();
    buttondeutsch.update();
    buttondutch.update();
    buttondutch.display();
    buttonenglish.display();
    buttonenglish.update();
    buttonspanish.display();
    buttonspanish.update();
    buttonfrench.update();
    buttonfrench.display();
    buttonitalian.update();
    buttonitalian.display();
    buttonjapanese.update();
    buttonjapanese.display();
    buttonnorwegian.update();
    buttonnorwegian.display();
    buttonpolish.update();
    buttonpolish.display();
  }
  if(settingFlag == 1 && displayFlag == 24)
  {
    //polish
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonarabic.display();
    buttonarabic.update();
    buttondeutsch.display();
    buttondeutsch.update();
    buttondutch.update();
    buttondutch.display();
    buttonenglish.display();
    buttonenglish.update();
    buttonspanish.display();
    buttonspanish.update();
    buttonfrench.update();
    buttonfrench.display();
    buttonitalian.update();
    buttonitalian.display();
    buttonjapanese.update();
    buttonjapanese.display();
    buttonnorwegian.update();
    buttonnorwegian.display();
    buttonpolish.update();
    buttonpolish.display();
  }
  if(settingFlag == 1 && displayFlag == 25)
  {
    //News filter
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonfilter1.update();
    buttonfilter1.display();
    buttonfilter2.update();
    buttonfilter2.display();
    buttonfilter3.update();
    buttonfilter3.display();
    buttonfilter4.update();
    buttonfilter4.display();
  }
  if(settingFlag == 1 && displayFlag == 26)
  {
    //Filter1(gaming)
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    if(filterFlag1 == 1)
    {
    buttonfilter1.x = filterX + 180;
    buttonfilter1.y = filterY1 + 20;
    buttonremovefilter1.update();
    buttonremovefilter1.display();
    }
    
    if(filterFlag2 == 1)
    {
    buttonfilter2.x = filterX + 180;
    buttonfilter2.y = filterY2 + 20;
    buttonremovefilter2.update();
    buttonremovefilter2.display();
    }
    if(filterFlag3 == 1)
    {
    buttonfilter3.x = filterX + 180;
    buttonfilter3.y = filterY3 + 20;
    buttonremovefilter3.update();
    buttonremovefilter3.display();
    }
    if(filterFlag4 == 1)
    {
    buttonfilter4.x = filterX + 180;
    buttonfilter4.y = filterY4 + 20;
    buttonremovefilter4.update();
    buttonremovefilter4.display();
    }
    buttonfilter1.update();
    buttonfilter1.display();
    buttonfilter2.update();
    buttonfilter2.display();
    buttonfilter3.update();
    buttonfilter3.display();
    buttonfilter4.update();
    buttonfilter4.display();
  }
  if(settingFlag == 1 && displayFlag == 27)
  {
    //Filter2(Business)
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    if(filterFlag1 == 1)
    {
    buttonfilter1.x = filterX + 180;
    buttonfilter1.y = filterY1 + 20;
    buttonremovefilter1.update();
    buttonremovefilter1.display();
    }
    if(filterFlag2 == 1)
    {
    buttonfilter2.x = filterX + 180;
    buttonfilter2.y = filterY2 + 20;
    buttonremovefilter2.update();
    buttonremovefilter2.display();
    }
    if(filterFlag3 == 1)
    {
    buttonfilter3.x = filterX + 180;
    buttonfilter3.y = filterY3 + 20;
    buttonremovefilter3.update();
    buttonremovefilter3.display();
    }
    if(filterFlag4 == 1)
    {
    buttonfilter4.x = filterX + 180;
    buttonfilter4.y = filterY4 + 20;
    buttonremovefilter4.update();
    buttonremovefilter4.display();
    }
    buttonfilter1.update();
    buttonfilter1.display();
    buttonfilter2.update();
    buttonfilter2.display();
    buttonfilter3.update();
    buttonfilter3.display();
    buttonfilter4.update();
    buttonfilter4.display();
  }
  if(settingFlag == 1 && displayFlag == 28)
  {
    //Filter3(Politics)
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    if(filterFlag1 == 1)
    {
    buttonfilter1.x = filterX + 180;
    buttonfilter1.y = filterY1 + 20;
    buttonremovefilter1.update();
    buttonremovefilter1.display();
    }
    if(filterFlag2 == 1)
    {
    buttonfilter2.x = filterX + 180;
    buttonfilter2.y = filterY2 + 20;
    buttonremovefilter2.update();
    buttonremovefilter2.display();
    }
    if(filterFlag3 == 1)
    {
    buttonfilter3.x = filterX + 180;
    buttonfilter3.y = filterY3 + 20;
    buttonremovefilter3.update();
    buttonremovefilter3.display();
    }
    if(filterFlag4 == 1)
    {
    buttonfilter4.x = filterX + 180;
    buttonfilter4.y = filterY4 + 20;
    buttonremovefilter4.update();
    buttonremovefilter4.display();
    }
    buttonfilter1.update();
    buttonfilter1.display();
    buttonfilter2.update();
    buttonfilter2.display();
    buttonfilter3.update();
    buttonfilter3.display();
    buttonfilter4.update();
    buttonfilter4.display();
  }
  if(settingFlag == 1 && displayFlag == 29)
  {
    //Filter4(Technology)
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    if(filterFlag1 == 1)
    {
    buttonfilter1.x = filterX + 180;
    buttonfilter1.y = filterY1 + 20;
    buttonremovefilter1.update();
    buttonremovefilter1.display();
    }
    if(filterFlag2 == 1)
    {
    buttonfilter2.x = filterX + 180;
    buttonfilter2.y = filterY2 + 20;
    buttonremovefilter2.update();
    buttonremovefilter2.display();
    }
    if(filterFlag3 == 1)
    {
    buttonfilter3.x = filterX + 180;
    buttonfilter3.y = filterY3 + 20;
    buttonremovefilter3.update();
    buttonremovefilter3.display();
    }
    if(filterFlag4 == 1)
    {
    buttonfilter4.x = filterX + 180;
    buttonfilter4.y = filterY4 + 20;
    buttonremovefilter4.update();
    buttonremovefilter4.display();
    }
    buttonfilter1.update();
    buttonfilter1.display();
    buttonfilter2.update();
    buttonfilter2.display();
    buttonfilter3.update();
    buttonfilter3.display();
    buttonfilter4.update();
    buttonfilter4.display();
  }
  if(settingFlag == 1 && displayFlag == 30)
  {
    //Remove filter1
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonfilter1.x = filterX;
    buttonfilter1.y = filterY1;
    if(filterFlag2 == 1)
    {
    buttonfilter2.x = filterX + 180;
    buttonfilter2.y = filterY2 + 20;
    buttonremovefilter2.update();
    buttonremovefilter2.display();
    }
    if(filterFlag3 == 1)
    {
    buttonfilter3.x = filterX + 180;
    buttonfilter3.y = filterY3 + 20;
    buttonremovefilter3.update();
    buttonremovefilter3.display();
    }
    if(filterFlag4 == 1)
    {
    buttonfilter4.x = filterX + 180;
    buttonfilter4.y = filterY4 + 20;
    buttonremovefilter4.update();
    buttonremovefilter4.display();
    }
    buttonfilter1.update();
    buttonfilter1.display();
    buttonfilter2.update();
    buttonfilter2.display();
    buttonfilter3.update();
    buttonfilter3.display();
    buttonfilter4.update();
    buttonfilter4.display();
  }
  if(settingFlag == 1 && displayFlag == 31)
  {
    //Remove filter2
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonfilter2.x = filterX;
    buttonfilter2.y = filterY2;
    if(filterFlag1 == 1)
    {
    buttonfilter1.x = filterX + 180;
    buttonfilter1.y = filterY1 + 20;
    buttonremovefilter1.update();
    buttonremovefilter1.display();
    }
    if(filterFlag3 == 1)
    {
    buttonfilter3.x = filterX + 180;
    buttonfilter3.y = filterY3 + 20;
    buttonremovefilter3.update();
    buttonremovefilter3.display();
    }
    if(filterFlag4 == 1)
    {
    buttonfilter4.x = filterX + 180;
    buttonfilter4.y = filterY4 + 20;
    buttonremovefilter4.update();
    buttonremovefilter4.display();
    }
    buttonfilter1.update();
    buttonfilter1.display();
    buttonfilter2.update();
    buttonfilter2.display();
    buttonfilter3.update();
    buttonfilter3.display();
    buttonfilter4.update();
    buttonfilter4.display();
  }
  if(settingFlag == 1 && displayFlag == 32)
  {
    //Remove filter3
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonfilter3.x = filterX;
    buttonfilter3.y = filterY3;
    if(filterFlag1 == 1)
    {
    buttonfilter1.x = filterX + 180;
    buttonfilter1.y = filterY1 + 20;
    buttonremovefilter1.update();
    buttonremovefilter1.display();
    }
    if(filterFlag2 == 1)
    {
    buttonfilter2.x = filterX + 180;
    buttonfilter2.y = filterY2 + 20;
    buttonremovefilter2.update();
    buttonremovefilter2.display();
    }
    if(filterFlag4 == 1)
    {
    buttonfilter4.x = filterX + 180;
    buttonfilter4.y = filterY4 + 20;
    buttonremovefilter4.update();
    buttonremovefilter4.display();
    }
    buttonfilter1.update();
    buttonfilter1.display();
    buttonfilter2.update();
    buttonfilter2.display();
    buttonfilter3.update();
    buttonfilter3.display();
    buttonfilter4.update();
    buttonfilter4.display();
  }
  if(settingFlag == 1 && displayFlag == 33)
  {
    //Remove filter4
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonfilter4.x = filterX;
    buttonfilter4.y = filterY4;
    if(filterFlag1 == 1)
    {
    buttonfilter1.x = filterX + 180;
    buttonfilter1.y = filterY1 + 20;
    buttonremovefilter1.update();
    buttonremovefilter1.display();
    }
    if(filterFlag2 == 1)
    {
    buttonfilter2.x = filterX + 180;
    buttonfilter2.y = filterY2 + 20;
    buttonremovefilter2.update();
    buttonremovefilter2.display();
    }
    if(filterFlag3 == 1)
    {
    buttonfilter3.x = filterX + 180;
    buttonfilter3.y = filterY3 + 20;
    buttonremovefilter3.update();
    buttonremovefilter3.display();
    }
    buttonfilter1.update();
    buttonfilter1.display();
    buttonfilter2.update();
    buttonfilter2.display();
    buttonfilter3.update();
    buttonfilter3.display();
    buttonfilter4.update();
    buttonfilter4.display();
  }
  if(settingFlag == 1 && displayFlag == 34)
  {
    //Location use keyboard
  }
  if(settingFlag == 1 && displayFlag == 35)
  {
    //Transperency
  }
  if(settingFlag == 1 && displayFlag == 36)
  {
    //WiFI
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    if(wifiFlag == 0)
    {
    buttonwifiOn.update();
    buttonwifiOn.display();
    }
    if(wifiFlag == 1)
    {
    buttonwifiOff.update();
    buttonwifiOff.display();
    }
    buttonuicWifi.update();
    buttonuicWifi.display();
    buttonuicWifi2.update();
    buttonuicWifi2.display();
    buttonuicWifi3.update();
    buttonuicWifi3.display();
  }
  if(settingFlag == 1 && displayFlag == 37)
  {
    //click turned on wifi to turn it off
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonwifiOff.update();
    buttonwifiOff.display();
  }
  if(settingFlag == 1 && displayFlag == 38)
  {
    //click turned off wifi to turn it on
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonwifiOn.update();
    buttonwifiOn.display();
    buttonuicWifi.update();
    buttonuicWifi.display();
    buttonuicWifi2.update();
    buttonuicWifi2.display();
    buttonuicWifi3.update();
    buttonuicWifi3.display();
  }
  if(settingFlag == 1 && displayFlag == 39)
  {
    //uicWifi pressed dont do anything as that is the default account
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonuicWifi.y = network1Y;
    buttonuicWifi2.y = network2Y;
    buttonuicWifi3.y = network3Y;
    buttonwifiOn.update();
    buttonwifiOn.display();
    buttonuicWifi.update();
    buttonuicWifi.display();
    buttonuicWifi2.update();
    buttonuicWifi2.display();
    buttonuicWifi3.update();
    buttonuicWifi3.display();
  }
  if(settingFlag == 1 && displayFlag == 40)
  {
    //uicWifi2 pressed change default
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonuicWifi.y = network2Y;
    buttonuicWifi2.y = network1Y;
    buttonuicWifi3.y = network3Y;
    buttonwifiOn.update();
    buttonwifiOn.display();
    buttonuicWifi.update();
    buttonuicWifi.display();
    buttonuicWifi2.update();
    buttonuicWifi2.display();
    buttonuicWifi3.update();
    buttonuicWifi3.display();
  }
  if(settingFlag == 1 && displayFlag == 41)
  {
    //uicWifi3 pressed change default
    fill(102);
   
   rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    buttonuicWifi.y = network3Y;
    buttonuicWifi2.y = network2Y;
    buttonuicWifi3.y = network1Y;
    buttonwifiOn.update();
    buttonwifiOn.display();
    buttonuicWifi.update();
    buttonuicWifi.display();
    buttonuicWifi2.update();
    buttonuicWifi2.display();
    buttonuicWifi3.update();
    buttonuicWifi3.display();
  }
}

class Button

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



class ImageButtons extends Button 

{

  PImage base;

  PImage roll;

  PImage down;

  PImage currentimage;
  
  int number = 0;


  ImageButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown, int num) 

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

    } else if (isOver){
     
      currentimage = roll;
      if(isPressed == true)
      {
      isPressed = false; 
      displayFlag = number;
      /*if(number == 1)
      {
        //IconSize
        if(displayFlag == 1)
        {
        fill(0);  
        //text("Change Icon Size", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 280);
        //println("Debug 0");
        }
        //Bluetooth
        
      }*/
      /*if(number == 2)
      {
        if(displayFlag == 2)
        {
        fill(0);  
        text("Bluetooth", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 280);  
        }
      }*/
      //Settings icon
      if(number == 0)
      {
        fill(102);
        rect((int)canvasWidth/2 - 215,(int)canvasHeight/2 + 320,300,200);
        settingFlag = 1;
      }
      /*if(number == "back" && pinFlag > 0)
      {  
        pinFlag = pinFlag-1;
        pin = pin.substring (  0, pin.length()-1 );
        println(pin);  //Testing purpose
        pinRep = pinRep.substring( 0, pinRep.length()-1 );
        pinSpace = pinSpace - 15;
        textSize(40);
        fill(102);
        text("*", (int)canvasWidth/2 - 100 + pinSpace, (int)canvasHeight/2 + 360);
        //(int)canvasWidth/2 % 2 + 630,(int)canvasHeight/3 - 25
        println(pinRep);    //Testing purpose
      }*/
      /*else if(pinFlag < 4 && number != "back" && number!= "ok")
      {                 
        fill(0);
        pinRep = pinRep + "*";
        textSize(40);
        text("*",(int)canvasWidth/2 - 100 + pinSpace,(int)canvasHeight/2 + 360);
        pinSpace = pinSpace + 15;
        pin = pin + number;
        println(pin);  //Testing purpose
        pinFlag = pinFlag+1;
      }*/
      //if(number == "ok" && pinFlag < 4)
      //{
      //  showMessageDialog(null, "Pin requires four numbers!", "Alert", ERROR_MESSAGE);
      //}
      /*if(number == "ok" && pinFlag == 4)
      {
        //showMessageDialog(null, "PIN successfully added", "Info", INFORMATION_MESSAGE);
        textSize(40);
        fill(102);
        pinFlag = 0;
        pinSpace = 0;
        for(int i = 0; i < 4; i++)
        {
        text("*",(int)canvasWidth/2 - 100 + pinSpace, (int)canvasHeight/2 + 360);
        pinSpace = pinSpace+15;
        }
        pin = "";
        pinRep = "";
        pinSpace = 0;
      }*/
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
    if(number == 0)
    {
    image(currentimage, x, y, w, h);
    }
    if(displayFlag == 1)
    {
        fill(0);  
        text("Select icon size", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 280);
        //println("Debug 0");
    }
    if(displayFlag == 2)
    {
      fill(0);  
      text("Bluetooth", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 280);  
      stroke(0);
      fill(102);
      rect((int)canvasWidth/2 - 200, (int)canvasHeight/2 + 320, 220, 60);
      fill(0);
      text("HTC One", (int)canvasWidth/2 - 150, (int)canvasHeight/2 + 360);
      bluetooth.resize(23,20);
      image(bluetooth, (int)canvasWidth/2 - 190, (int)canvasHeight/2 + 343);
    }
    if(displayFlag == 3)
    {
      fill(0);  
      text("Select Time Zone", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 230);
    }
     if(displayFlag == 4)
    {
      fill(0);  
      text("Bluetooth", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 280);  
      stroke(0);
      fill(102);
      rect((int)canvasWidth/2 - 200, (int)canvasHeight/2 + 320, 220, 60);
      fill(0);
      text("HTC One", (int)canvasWidth/2 - 150, (int)canvasHeight/2 + 360);
      bluetooth.resize(23,20);
      image(bluetooth, (int)canvasWidth/2 - 190, (int)canvasHeight/2 + 343);
    }
    if(displayFlag == 5)
    {
      fill(0);  
      text("Bluetooth", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 280);  
      stroke(0);
      fill(102);
      rect((int)canvasWidth/2 - 200, (int)canvasHeight/2 + 320, 220, 60);
      fill(0);
      text("HTC One", (int)canvasWidth/2 - 150, (int)canvasHeight/2 + 360);
      bluetooth.resize(23,20);
      image(bluetooth, (int)canvasWidth/2 - 190, (int)canvasHeight/2 + 343);
    }
    if(displayFlag == 6)
    {
      fill(0);  
      text("Select Time Zone", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 230);
      fill(102);
      rect((int)canvasWidth/2 - 230, (int)canvasHeight/2 + 300, 330, 30);
      fill(0);
      text("Time changed to Pacific Zone Time", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 320);
    }
    if(displayFlag == 7)
    {
      fill(0);  
      text("Select Time Zone", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 230);
      fill(102);
      rect((int)canvasWidth/2 - 240, (int)canvasHeight/2 + 300, 330, 30);
      fill(0);
      text("Time changed to Central Zone Time", (int)canvasWidth/2 - 230, (int)canvasHeight/2 + 320);
    }
    if(displayFlag == 8)
    {
      fill(0);  
      text("Select Time Zone", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 230);
      fill(102);
      rect((int)canvasWidth/2 - 250, (int)canvasHeight/2 + 300, 350, 30);
      fill(0);
      text("Time changed to Eastern Zone Time", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 320);
    }
    if(displayFlag == 9)
    {
      fill(0);  
      text("Select Time Zone", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 230);
      fill(102);
      rect((int)canvasWidth/2 - 260, (int)canvasHeight/2 + 300, 370, 30);
      fill(0);
      text("Time changed to Mountain Zone Time", (int)canvasWidth/2 - 260, (int)canvasHeight/2 + 320);
    }
    if(displayFlag == 10)
    {
      
      text("personalization", (int)canvasWidth/2 - 150, (int)canvasHeight/2 + 230);
    }
    if(displayFlag == 11)
    {
      fill(102);
      rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
      fill(0);  
      text("Enter Name", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 230);
    }
    if(displayFlag == 12)
    {
      fill(102);
      rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
      fill(0);  
      text("Enter your Pin number", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 230);
    }
    if(displayFlag == 14)
    {
      fill(0);
      textSize(20);
      text("Select Language by touching the Flag", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 230);
      textSize(16);
      text("Arabic(Saudi Arabia) - عربى", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 310);
      text("Deutsch(Deutschland)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 332);
      text("Dutch(Netherlands)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 352);
      text("English(United States)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 372);
      text("Spanish(Internacional) - Español", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 392);
      text("French(Standard) - français", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 412);
      text("Italian(Standard) - italiano", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 432);
      text("Japanese - 日本語", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 452);
      text("Norwegian(Bokmal) - norsk", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 472);
      text("Polish(Polski) - Polskie", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 492);
      textSize(20);
    }
    if(displayFlag == 15 )
    {
      //arabic
      fill(0);  
      textSize(20);
      text("Select Language by touching the Flag", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 230);
      text("Language changed to Arabic", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      textSize(16);
      text("Arabic(Saudi Arabia) - عربى", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 310);
      text("Deutsch(Deutschland)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 332);
      text("Dutch(Netherlands)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 352);
      text("English(United States)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 372);
      text("Spanish(Internacional) - Español", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 392);
      text("French(Standard) - français", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 412);
      text("Italian(Standard) - italiano", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 432);
      text("Japanese - 日本語", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 452);
      text("Norwegian(Bokmal) - norsk", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 472);
      text("Polish(Polski) - Polskie", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 492);
      textSize(20);
    }
    if(displayFlag == 16 )
    {
      //deutsch
      fill(0);  
      textSize(20);
      text("Select Language by touching the Flag", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 230);
      text("Language changed to Deutsch", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      textSize(16);
        text("Arabic(Saudi Arabia) - عربى", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 310);
      text("Deutsch(Deutschland)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 332);
      text("Dutch(Netherlands)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 352);
      text("English(United States)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 372);
      text("Spanish(Internacional) - Español", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 392);
      text("French(Standard) - français", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 412);
      text("Italian(Standard) - italiano", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 432);
      text("Japanese - 日本語", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 452);
      text("Norwegian(Bokmal) - norsk", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 472);
      text("Polish(Polski) - Polskie", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 492);
      textSize(20);
    }
    if(displayFlag == 17 )
    {
      //dutch
      fill(0);  
      textSize(20);
      text("Select Language by touching the Flag", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 230);
      text("Language changed to Dutch", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      textSize(16);
      text("Arabic(Saudi Arabia) - عربى", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 310);
      text("Deutsch(Deutschland)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 332);
      text("Dutch(Netherlands)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 352);
      text("English(United States)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 372);
      text("Spanish(Internacional) - Español", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 392);
      text("French(Standard) - français", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 412);
      text("Italian(Standard) - italiano", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 432);
      text("Japanese - 日本語", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 452);
      text("Norwegian(Bokmal) - norsk", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 472);
      text("Polish(Polski) - Polskie", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 492);
      textSize(20);
    }
    if(displayFlag == 18 )
    {
      //english
      languageFlag = 0;
      fill(0);  
      textSize(20);
      text("Select Language by touching the Flag", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 230);
      text("Language changed to English", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      textSize(16);
    text("Arabic(Saudi Arabia) - عربى", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 310);
      text("Deutsch(Deutschland)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 332);
      text("Dutch(Netherlands)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 352);
      text("English(United States)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 372);
      text("Spanish(Internacional) - Español", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 392);
      text("French(Standard) - français", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 412);
      text("Italian(Standard) - italiano", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 432);
      text("Japanese - 日本語", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 452);
      text("Norwegian(Bokmal) - norsk", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 472);
      text("Polish(Polski) - Polskie", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 492);
      textSize(20);
    }
    if(displayFlag == 19 )
    {
      //spanish
      languageFlag = 1;
      fill(0);  
      textSize(20);
      text("Select Language by touching the Flag", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 230);
      text("Language changed to Spanish", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      textSize(16);
      text("Arabic(Saudi Arabia) - عربى", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 310);
      text("Deutsch(Deutschland)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 332);
      text("Dutch(Netherlands)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 352);
      text("English(United States)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 372);
      text("Spanish(Internacional) - Español", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 392);
      text("French(Standard) - français", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 412);
      text("Italian(Standard) - italiano", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 432);
      text("Japanese - 日本語", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 452);
      text("Norwegian(Bokmal) - norsk", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 472);
      text("Polish(Polski) - Polskie", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 492);
      textSize(20);
    }
    if(displayFlag == 20 )
    {
      //french
      fill(0);  
      textSize(20);
      text("Select Language by touching the Flag", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 230);
      text("Language changed to French", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      textSize(16);
    text("Arabic(Saudi Arabia) - عربى", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 310);
      text("Deutsch(Deutschland)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 332);
      text("Dutch(Netherlands)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 352);
      text("English(United States)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 372);
      text("Spanish(Internacional) - Español", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 392);
      text("French(Standard) - français", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 412);
      text("Italian(Standard) - italiano", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 432);
      text("Japanese - 日本語", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 452);
      text("Norwegian(Bokmal) - norsk", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 472);
      text("Polish(Polski) - Polskie", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 492);
      textSize(20);
    }
    if(displayFlag == 21 )
    {
      //italian
      fill(0);  
      textSize(20);
      text("Select Language by touching the Flag", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 230);
      text("Language changed to Italian", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      textSize(16);
       text("Arabic(Saudi Arabia) - عربى", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 310);
      text("Deutsch(Deutschland)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 332);
      text("Dutch(Netherlands)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 352);
      text("English(United States)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 372);
      text("Spanish(Internacional) - Español", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 392);
      text("French(Standard) - français", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 412);
      text("Italian(Standard) - italiano", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 432);
      text("Japanese - 日本語", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 452);
      text("Norwegian(Bokmal) - norsk", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 472);
      text("Polish(Polski) - Polskie", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 492);
      textSize(20);
    }
    if(displayFlag == 22 )
    {
      //japanese
      fill(0);  
      textSize(20);
      text("Select Language by touching the Flag", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 230);
      text("Language changed to Japanese", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      textSize(16);
   text("Arabic(Saudi Arabia) - عربى", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 310);
      text("Deutsch(Deutschland)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 332);
      text("Dutch(Netherlands)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 352);
      text("English(United States)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 372);
      text("Spanish(Internacional) - Español", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 392);
      text("French(Standard) - français", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 412);
      text("Italian(Standard) - italiano", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 432);
      text("Japanese - 日本語", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 452);
      text("Norwegian(Bokmal) - norsk", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 472);
      text("Polish(Polski) - Polskie", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 492);
      textSize(20);
    }
    if(displayFlag == 23 )
    {
      //norwegian
      fill(0);  
      textSize(20);
      text("Select Language by touching the Flag", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 230);
      text("Language changed to norwegian", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      textSize(16);
    text("Arabic(Saudi Arabia) - عربى", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 310);
      text("Deutsch(Deutschland)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 332);
      text("Dutch(Netherlands)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 352);
      text("English(United States)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 372);
      text("Spanish(Internacional) - Español", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 392);
      text("French(Standard) - français", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 412);
      text("Italian(Standard) - italiano", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 432);
      text("Japanese - 日本語", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 452);
      text("Norwegian(Bokmal) - norsk", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 472);
      text("Polish(Polski) - Polskie", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 492);
      textSize(20);
    }
    if(displayFlag == 24 )
    {
      //polish
      fill(0);  
      textSize(20);
      text("Select Language by touching the Flag", (int)canvasWidth/2 - 240, (int)canvasHeight/2 + 230);
      text("Language changed to Polish", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      textSize(16);
     text("Arabic(Saudi Arabia) - عربى", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 310);
      text("Deutsch(Deutschland)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 332);
      text("Dutch(Netherlands)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 352);
      text("English(United States)", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 372);
      text("Spanish(Internacional) - Español", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 392);
      text("French(Standard) - français", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 412);
      text("Italian(Standard) - italiano", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 432);
      text("Japanese - 日本語", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 452);
      text("Norwegian(Bokmal) - norsk", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 472);
      text("Polish(Polski) - Polskie", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 492);
      textSize(20);
    }
    if(displayFlag == 25)
    {
    fill(0);  
    textSize(20);
    text("Select your filter for the News Feed", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 230);
    fill(102);
    rect((int)canvasWidth/2 - 30, (int)canvasHeight/2 + 260, 100, 40);
    fill(0);
    text("Added:", (int)canvasWidth/2 - 10, (int)canvasHeight/2 + 290);
    }
    if(displayFlag == 26)
    {
    filterFlag1 = 1; //add
    //set filter1(gaming) to on
    //filterFlag1 = 1; 
    fill(0);  
    textSize(20);
    text("Select your filter for the News Feed", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 230);
    fill(102);
    rect((int)canvasWidth/2 - 30, (int)canvasHeight/2 + 260, 100, 40);
    fill(0);
    text("Added:", (int)canvasWidth/2 - 10, (int)canvasHeight/2 + 290);
    
    }
    if(displayFlag == 27)
    {
      filterFlag2 = 1; //add
     //set filter2(Business) to on
    //filterFlag2 = 1;
    fill(0);  
    textSize(20);
    text("Select your filter for the News Feed", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 230);
    fill(102);
    rect((int)canvasWidth/2 - 30, (int)canvasHeight/2 + 260, 100, 40);
    fill(0);
    text("Added:", (int)canvasWidth/2 - 10, (int)canvasHeight/2 + 290);
    }
    if(displayFlag == 28)
    {
    filterFlag3 = 1; //add
    //filterFlag3 = 1; //set filter3(Politics) to on
    fill(0);  
    textSize(20);
    text("Select your filter for the News Feed", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 230);
    fill(102);
    rect((int)canvasWidth/2 - 30, (int)canvasHeight/2 + 260, 100, 40);
    fill(0);
    text("Added:", (int)canvasWidth/2 - 10, (int)canvasHeight/2 + 290);
    }
    if(displayFlag == 29)
    {
    filterFlag4 = 1; //add
    //filterFlag4 = 1; //set filter4(Technology) to on
    fill(0);  
    textSize(20);
    text("Select your filter for the News Feed", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 230);
    fill(102);
    rect((int)canvasWidth/2 - 30, (int)canvasHeight/2 + 260, 100, 40);
    fill(0);
    text("Added:", (int)canvasWidth/2 - 10, (int)canvasHeight/2 + 290);
    }
    if(displayFlag == 30)
    {
     //removeFilter1
    filterFlag1 = 0;
    fill(0);  
    textSize(20);
    text("Select your filter for the News Feed", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 230);
    fill(102);
    rect((int)canvasWidth/2 - 30, (int)canvasHeight/2 + 260, 100, 40);
    fill(0);
    text("Added:", (int)canvasWidth/2 - 10, (int)canvasHeight/2 + 290);
    }
    if(displayFlag == 31)
    {
     //removeFilter2
    filterFlag2 = 0;
    fill(0);  
    textSize(20);
    text("Select your filter for the News Feed", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 230);
    fill(102);
    rect((int)canvasWidth/2 - 30, (int)canvasHeight/2 + 260, 100, 40);
    fill(0);
    text("Added:", (int)canvasWidth/2 - 10, (int)canvasHeight/2 + 290);
    }
    if(displayFlag == 32)
    {
     //removeFilter3
    filterFlag3 = 0;
    fill(0);  
    textSize(20);
    text("Select your filter for the News Feed", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 230);
    fill(102);
    rect((int)canvasWidth/2 - 30, (int)canvasHeight/2 + 260, 100, 40);
    fill(0);
    text("Added:", (int)canvasWidth/2 - 10, (int)canvasHeight/2 + 290);
    }
    if(displayFlag == 33)
    {
     //removeFilter4
    filterFlag4 = 0;
    fill(0);  
    textSize(20);
    text("Select your filter for the News Feed", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 230);
    fill(102);
    rect((int)canvasWidth/2 - 30, (int)canvasHeight/2 + 260, 100, 40);
    fill(0);
    text("Added:", (int)canvasWidth/2 - 10, (int)canvasHeight/2 + 290);
    }
    if(displayFlag == 34)
    {
    //location
    fill(102);
    rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    fill(0);  
    textSize(20);
    //text("Location", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 280);
    //Change String in next box
    text("Current Location:" + locationDefault, (int)canvasWidth/2 - 235, (int)canvasHeight/2 + 240);
    text("Enter your Location using the Keyboard", (int)canvasWidth/2 - 255, (int)canvasHeight/2 + 290);
    fill(102);
    rect((int)canvasWidth/2 - 205, (int)canvasHeight/2 + 310, 260, 40);
    }
    if(displayFlag == 35)
    {
    //Transperency
    fill(102);
    rect((int)canvasWidth/2 - 265,(int)canvasHeight/2 + 200,380,310);
    fill(0);  
    textSize(20);
    text("Transperency", (int)canvasWidth/2 - 145, (int)canvasHeight/2 + 230);
    }
    if(displayFlag == 36)
    {
    //WiFI
    fill(0);  
    textSize(20);
    text("WiFI", (int)canvasWidth/2 - 145, (int)canvasHeight/2 + 220);
    text("Other Networks...", (int)canvasWidth/2 - 205, (int)canvasHeight/2 + 325);
    }
    if(displayFlag == 37)
    {
    //clicked WiFI on to turn it off
    wifiFlag = 1;
    fill(0);  
    textSize(20);
    text("WiFI", (int)canvasWidth/2 - 145, (int)canvasHeight/2 + 220);
    text("Other Networks...", (int)canvasWidth/2 - 205, (int)canvasHeight/2 + 325);
    }
    if(displayFlag == 38)
    {
    //clicked WiFI off to turn it on
    wifiFlag = 0;
    fill(0);  
    textSize(20);
    text("WiFI", (int)canvasWidth/2 - 145, (int)canvasHeight/2 + 220);
    text("Other Networks...", (int)canvasWidth/2 - 205, (int)canvasHeight/2 + 325);
    }
    if(displayFlag == 39)
    {
    //clicked on uicWifi do nothing because its default
    fill(0);  
    textSize(20);
    text("WiFI", (int)canvasWidth/2 - 145, (int)canvasHeight/2 + 220);
    text("Other Networks...", (int)canvasWidth/2 - 205, (int)canvasHeight/2 + 325);
    }
    if(displayFlag == 40)
    {
    //clicked on uicWifi2
    fill(0);  
    textSize(20);
    text("WiFI", (int)canvasWidth/2 - 145, (int)canvasHeight/2 + 220);
    text("Other Networks...", (int)canvasWidth/2 - 205, (int)canvasHeight/2 + 325);
    }
    if(displayFlag == 41)
    {
    //clicked on uicWifi3
    fill(0);  
    textSize(20);
    text("WiFI", (int)canvasWidth/2 - 145, (int)canvasHeight/2 + 220);
    text("Other Networks...", (int)canvasWidth/2 - 205, (int)canvasHeight/2 + 325);
    }
    if(displayFlag != number)
    {
    image(currentimage, x, y, w, h);
    }
    if(displayFlag == 6 || displayFlag == 7 || displayFlag == 8 || displayFlag == 9)
    {
    image(currentimage, x, y, w, h);  
    }
    if(displayFlag == 15 || displayFlag == 16 || displayFlag == 17 || displayFlag == 18 || displayFlag ==19 || displayFlag ==20 || displayFlag ==21 || displayFlag ==22 
    || displayFlag ==23 || displayFlag ==24)
    {
    image(currentimage, x, y, w, h);  
    }
    if(displayFlag == 26 ||displayFlag == 27 || displayFlag == 28 || displayFlag == 29 || displayFlag == 30 || displayFlag == 31 || displayFlag == 32 || displayFlag == 33)
    {
    image(currentimage, x, y, w, h); 
    }
    if(displayFlag == 39 || displayFlag == 40 || displayFlag == 41)
    {
      image(currentimage, x, y, w, h); 
    }
  }

}