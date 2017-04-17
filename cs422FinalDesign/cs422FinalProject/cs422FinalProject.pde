
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
int gobal_buttonX = 66;
int gobal_buttonY = 60;
int profileButtonX = int(1.8*66);
int profileButtonY = int(1.8*30);


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
boolean firstReleased = true;
ArrayList<String> storeName = new ArrayList<String>();
boolean inSetup = true;
//////////////////////////////////////////////////////////////////


//Shanil Variable for Setting
////////////////////////////////////////////////////////////

//SettingImageButtons buttongearIcon;
SettingImageButtons buttonIconSize;
SettingImageButtons buttonBluetooth;
SettingImageButtons buttonTime;
SettingImageButtons buttonPersonalization;
SettingImageButtons buttonContrast;
SettingImageButtons buttonLanguage;
SettingImageButtons buttonNewsFeed;
SettingImageButtons buttonLocation;
SettingImageButtons buttonTransparency;
SettingImageButtons buttonWifi;
SettingImageButtons buttonBluetoothOn;
SettingImageButtons buttonBluetoothOff;
SettingImageButtons buttonpacificTimeZone;
SettingImageButtons buttoncentralTimeZone;
SettingImageButtons buttonmountainTimeZone;
SettingImageButtons buttoneasternTimeZone;
SettingImageButtons buttonchangeName;
SettingImageButtons buttonchangePin;
SettingImageButtons buttonenglish;
SettingImageButtons buttonspanish;
SettingImageButtons buttonarabic;
SettingImageButtons buttondeutsch;
SettingImageButtons buttondutch;
SettingImageButtons buttonfrench;
SettingImageButtons buttonitalian;
SettingImageButtons buttonjapanese;
SettingImageButtons buttonnorwegian;
SettingImageButtons buttonpolish;
SettingImageButtons buttonfilter1;
SettingImageButtons buttonfilter2;
SettingImageButtons buttonfilter3;
SettingImageButtons buttonfilter4;
SettingImageButtons buttonremovefilter1;
SettingImageButtons buttonremovefilter2;
SettingImageButtons buttonremovefilter3;
SettingImageButtons buttonremovefilter4;
SettingImageButtons buttonwifiOn;
SettingImageButtons buttonwifiOff;
SettingImageButtons buttonuicWifi;
SettingImageButtons buttonuicWifi2;
SettingImageButtons buttonuicWifi3;
int buttonSize = 90;
int settingFlag = 0;
int displayFlag = 0;
String locationDefault = "Chicago, Illinois";
int buttonX = 66;
int buttonY = 60;
int languageFlag = 0; //0 for english 1 for spanish
int filterFlag1 = 0;
int filterFlag2 = 0;
int filterFlag3 = 0;
int filterFlag4 = 0;
int addedFilter = 0; //Moving added filter to added column
int wifiFlag = 0; //keep track if its on or off on == 0 and off == 1

//float iconAdjust = 0.5;
float imageAdjust = 1;
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
int changeX = (int)canvasWidth/2 - 90;
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

//HScrollbar hs2 = new HScrollbar(0, height-20, width, 10, 1);
 

/////////////////////////////////////////////////////////////


//Variable for Setting
/////////////////////////////////////////////////////////////


int settingXaxis = int(canvasWidth/2 - 265);
float slideOffset = int(canvasWidth/2 - 245)+ 50;
int settingYaxis = int(canvasHeight/2 + 100);
int settingWidth = 480;
int settingHeight = 410;
HScrollbar hs1 = new HScrollbar(int(slideOffset), (int)(canvasHeight/2 + 400), 350, 35, 1);
HScrollbar hs2 = new HScrollbar(int(slideOffset), (int)(canvasHeight/2 + 400), 350, 35, 1);

////////////////////////////////////////////////////////////

//Variable for Music
////////////////////////////////////////////////////////////



//make a new HTML5 audio object named audio
Audio audio = new Audio();
// make string that will house the audio extension

//100 100 before resize


float offset =0 ;
String fileExt;
var  seek;
//make a variable for volume and set it to 0
//(volume runs between 0 and 1)
float vol=0;
boolean fadeOut=false;

int col=0;
ArrayList<String> songNames = new ArrayList<String>();
int current = 0;


 HScrollbar   volu;

 HScrollbar  seeker;
boolean isMusic = false;
boolean activeSmallMusic  = false;
////////////////////////////////////////////////////////////









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
ImageKeyButtons buttonApostrophe;
ImageKeyButtons buttonComma;
ImageKeyButtons buttonCom;
ImageKeyButtons buttonPeriod;
ImageKeyButtons buttonQuestionMark;
ImageKeyButtons buttonSlash;

int keyButtonSize = 90;
int keyFlag = 0;  //A flag that you keep to track how many buttons are pressed.
int keySpace = 0; //The space of the stars when they are printed
String keyTracker = ""; //Keeps track of the pins and stores them
String keyRep = ""; //Represents the stars in the pin and how many there are by storing the number
String eraseKey = "";
boolean isKeyPressed = false;
boolean iskeyboard = true; // use for stage 4
String inputName = "";
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
boolean updateText = false;
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


//Varaiable for menu
////////////////////////////////////////////////////////////////

boolean inMenu = false;
boolean inSetting = false;
int menuXaxis = int((canvasWidth/100)*40);
int menuYaxis = int((canvasHeight/100)*60);
int menuWidth = int((canvasWidth/100)*20);
int menuHeight = int((canvasWidth/100)*10);

///////////////////////////////////////////////////////////////

//Globals for image popup icons/locations
////////////////////////////////////////////////////////////////

ArrayList<Popup> popups = new ArrayList<Popup>();

Popup miniPlayer;
Popup miniTimer;
//Current Popup being used
int popup_function = 0;

Button currentButton;

boolean imageBox = false;
boolean readingArticle = false;
boolean evl_on = true;

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

int calWidth = int((canvasWidth/100)*30);
int calHeight = int((canvasHeight/100)*30);

//Size for Health display
int healthWidth = int((canvasWidth/100)*50);
int healthHeight = int((canvasHeight/100)*40);

//Size for Weather display
int weatherWidth = int((canvasWidth/100)*50);
int weatherHeight = int((canvasHeight/100)*40);

//Size for music display
int music_width = int((canvasWidth/100)*30);
int music_height = int((canvasHeight/100)*15);

//Size for Article Display
int articleWidth = int((canvasWidth/100)*20);
int articleHeight = int((canvasHeight/100)*40);

//Size for Timer Display
int timerWidth = int((canvasWidth/100)*20);
int timerHeight = int((canvasHeight/100)*40);

//Size for Small Timer Display
int timerWidth_small = int((canvasWidth/100)*10);
int timerHeight_small = int((canvasHeight/100)*10);

//Timer Buttons
int timer_start_x_axis;
int timer_start_y_axis;

int timer_set_x_axis;
int timer_set_y_axis; 

int timer_button_width = int((timerWidth/100)*83);
int timer_button_height = int((timerHeight/100)*15);

//Cal Buttons/Dats
int cal_x_axis;
int cal_y_axis;

int cal_date_width = int((calWidth/100)*14);
int cal_date_height = int((calHeight/100)*15);

//Article Buttons
int article1_type_x_axis;
int article1_type_y_axis;

int article2_type_x_axis;
int article2_type_y_axis;

int article3_type_x_axis;
int article3_type_y_axis;

int article1_select_x_axis;
int article1_select_y_axis;

int article2_select_x_axis;
int article2_select_y_axis;

int article3_select_x_axis;
int article3_select_y_axis;

int article4_select_x_axis;
int article4_select_y_axis;

int article5_select_x_axis;
int article5_select_y_axis;

int article_back_x_axis;
int article_back_y_axis;

int article_back_width = int((articleWidth/100)*35);
int article_back_height = int((articleHeight/100)*10);

int article_type_width = int((articleWidth/100)*27);
int article_type_height= int((articleHeight/100)*13);

int article_select_width = int((articleWidth/100)*92);
int article_select_height= int((articleHeight/100)*12);

//Music playlist Buttons
int playlist1_x_axis;
int playlist1_y_axis;

int playlist2_x_axis;
int playlist2_y_axis;

int playlist3_x_axis;
int playlist3_y_axis;

int playlist4_x_axis;
int playlist4_y_axis;

int playlist_width = int((music_width/100)*30);;
int playlist_height = int((music_height/100)*25);;

//Music buttons
int music_reverse_x_axis;
int music_reverse_y_axis;

int music_forward_x_axis;
int music_forward_y_axis;

int music_volume_x_axis;
int music_volume_y_axis;

int music_seek_x_axis;
int music_seek_y_axis;

int music_mid_x_axis;
int music_mid_y_axis;

int small_music_reverse_x_axis;
int small_music_reverse_y_axis;

int small_music_mid_x_axis;
int small_music_mid_y_axis;

int small_music_forward_x_axis;
int small_music_forward_y_axis;

int small_music_box_width = 200;
int small_music_box_height = 100;

int music_box_width = int((music_width/100)*10);
int music_box_height = int((music_height/100)*20);

int vol_box_width = int((music_width/100)*53);
int vol_box_height = int((music_height/100)*12);

int button_box_width = int((music_width/100)*10);
int button_box_height = int((music_height/100)*20);

int seek_box_width = int((music_width/100)*70);
int seek_box_height = int((music_height/100)*12);

//9Gag Next and previous buttons
int gag_stage = 1;

int gag_previous_x_axis;
int gag_previous_y_axis;

int gag_next_x_axis;
int gag_next_y_axis;

int gag_box_width = int((gagWidth/100)*13);
int gag_box_height = int((gagWidth/100)*5);

//Health boxes locations and size
int health_sleep_x_axis;
int health_sleep_y_axis;

int health_step_x_axis;
int health_step_y_axis;

int health_weight_x_axis;
int health_weight_y_axis;

int health_box_width = int((healthWidth/100)*20);
int health_box_height = int((healthHeight/100)*15);

//Weather boxes location and size
int weather_today_x_axis;
int weather_today_y_axis;

int weather_hourly_x_axis;
int weather_hourly_y_axis;

int weather_weekly_x_axis;
int weather_weekly_y_axis;

int weather_map_x_axis;
int weather_map_y_axis;

int weather_box_width = int((weatherWidth/100)*15);
int weather_box_height = int((weatherHeight/100)*13);


boolean calenderInput = false;
boolean timerInput = false;
String calenderNote = "";
String timerString = "0500";
Timer tm;
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
boolean nameInUse = false;

//////////////////////////////////////////////////////////////////////////


void settingSetup()

{


  
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
  
  PImage butContrast = loadImage("Data/powerButton.png");
  
  butContrast.resize(buttonX, buttonY);
  
  PImage butLanguage = loadImage("Data/languageSetting.png");
  
  butLanguage.resize(buttonX, buttonY);
  
  PImage butNewsFeed = loadImage("Data/news_icon.png");
  
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
  int iconX1 = int(canvasWidth/2 - 200);
  int iconX2 = int(canvasWidth/2 + 20);
  
  int iconY1 = int(canvasHeight/2 + 110);
  int iconY2 = iconY1 + 90 ;
  int iconY3 = iconY1 + 150 +30;
  int iconY4 = iconY1 + 210 + 45;
  int iconY5 = iconY1 + 270 + 60;
  //
  //settingButtons for each setting
  //top row
  //Left to right
  
  //bluetooth
  int bluetoothX = (int)canvasWidth/2 + 100;
  int bluetoothY = (int)canvasHeight/2 + 340;
  
  //timezone
  int timezoneX = (int)canvasWidth/2 - 200;
  int timezoneX2 = (int)canvasWidth/2 + 10;
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
  int wifiX = (int)canvasWidth/2 - 25;
  int networkX = (int)canvasWidth/2 - 165;
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
  //buttongearIcon = new SettingImageButtons(x0, y0, int(buttonX*iconAdjust), int(buttonY*iconAdjust), butgearIcon, butgearIcon, butgearIcon, 0);
  buttonIconSize = new SettingImageButtons(iconX1, iconY3, int(buttonX), int(buttonY), butIconSize, butIconSize, butIconSize, 1);
  buttonBluetooth = new SettingImageButtons(iconX1, iconY1, int(buttonX), int(buttonY), butBluetooth, butBluetooth, butBluetooth, 2);
  buttonTime = new SettingImageButtons(iconX2, iconY2, int(buttonX), int(buttonY), butTime, butTime, butTime, 3);
  buttonPersonalization = new SettingImageButtons(iconX2, iconY1, int(buttonX), int(buttonY), butPersonalization, butPersonalization, butPersonalization, 10);
  buttonContrast = new SettingImageButtons(iconX2, iconY5, int(buttonX), int(buttonY), butContrast, butContrast, butContrast, 13);
  buttonLanguage = new SettingImageButtons(iconX1, iconY5, int(buttonX), int(buttonY), butLanguage, butLanguage, butLanguage, 14);
  buttonNewsFeed = new SettingImageButtons(iconX2, iconY3, int(buttonX), int(buttonY), butNewsFeed, butNewsFeed, butNewsFeed, 25);
  buttonLocation = new SettingImageButtons(iconX2, iconY4, int(buttonX), int(buttonY), butLocation, butLocation, butLocation, 34);
  buttonTransparency = new SettingImageButtons(iconX1, iconY2, int(buttonX), int(buttonY), butTransparency, butTransparency, butTransparency, 35);
  buttonWifi = new SettingImageButtons(iconX1, iconY4, int(buttonX), int(buttonY), butWifi, butWifi, butWifi, 36);
  
  
  //Buttons for each different setting
  buttonBluetoothOn = new SettingImageButtons(bluetoothX, bluetoothY, w, h, bluetoothOn, bluetoothOn, bluetoothOn, 4);
  buttonBluetoothOff = new SettingImageButtons(bluetoothX, bluetoothY, w, h, bluetoothOff, bluetoothOff, bluetoothOff, 5);
  //Time Zone buttons
  buttonpacificTimeZone = new SettingImageButtons(timezoneX, timezoneY1, filterWidth, filterHeight, pacificTimeZone, pacificTimeZone, pacificTimeZoneChanged, 6);
  buttoncentralTimeZone = new SettingImageButtons(timezoneX, timezoneY2, filterWidth, filterHeight, centralTimeZone, centralTimeZone, centralTimeZoneChanged, 7);
  buttoneasternTimeZone = new SettingImageButtons(timezoneX2, timezoneY1, filterWidth, filterHeight, easternTimeZone, easternTimeZone, easternTimeZoneChanged, 8);
  buttonmountainTimeZone = new SettingImageButtons(timezoneX2, timezoneY2, filterWidth, filterHeight, mountainTimeZone, mountainTimeZone, mountainTimeZoneChanged, 9);
  //Personalization buttons
  buttonchangeName = new SettingImageButtons(changeX, changeY1, filterWidth, filterHeight, changeName, changeName, changeName, 11);
  buttonchangePin = new SettingImageButtons(changeX, changeY2, filterWidth, filterHeight, changePin, changePin, changePin, 12);
  //Language buttons
  buttonarabic = new SettingImageButtons(languageX, langY1, languageWidth, languageHeight, arabic, arabic, arabic, 15);
  buttondeutsch= new SettingImageButtons(languageX, langY2, languageWidth, languageHeight, deutsch, deutsch, deutsch, 16);
  buttondutch= new SettingImageButtons(languageX, langY3, languageWidth, languageHeight, dutch, dutch, dutch, 17);
  buttonenglish= new SettingImageButtons(languageX, langY4, languageWidth, languageHeight, english, english, english, 18);
  buttonspanish= new SettingImageButtons(languageX, langY5, languageWidth, languageHeight, spanish, spanish, spanish, 19);
  buttonfrench= new SettingImageButtons(languageX, langY6, languageWidth, languageHeight, french, french, french, 20);
  buttonitalian= new SettingImageButtons(languageX, langY7, languageWidth, languageHeight, italian, italian, italian, 21);
  buttonjapanese= new SettingImageButtons(languageX, langY8, languageWidth, languageHeight, japanese, japanese, japanese, 22);
  buttonnorwegian= new SettingImageButtons(languageX, langY9, languageWidth, languageHeight, norwegian, norwegian, norwegian, 23);
  buttonpolish= new SettingImageButtons(languageX, langY10, languageWidth, languageHeight, polish, polish, polish, 24);
  //Filter news buttons
  buttonfilter1 = new SettingImageButtons(filterX, filterY1, filterWidth, filterHeight, filter1, filter1, filter1, 26);
  buttonfilter2 = new SettingImageButtons(filterX, filterY2, filterWidth, filterHeight, filter2, filter2, filter2, 27);
  buttonfilter3 = new SettingImageButtons(filterX, filterY3, filterWidth, filterHeight, filter3, filter3, filter3, 28);
  buttonfilter4 = new SettingImageButtons(filterX, filterY4, filterWidth, filterHeight, filter4, filter4, filter4, 29);
  //Remove news filter buttons
  buttonremovefilter1 = new SettingImageButtons(removeXfilter, removeYfilter1, removefilterWidth, removefilterHeight, removefilter1, removefilter1, removefilter1, 30);
  buttonremovefilter2 = new SettingImageButtons(removeXfilter, removeYfilter2, removefilterWidth, removefilterHeight, removefilter2, removefilter2, removefilter2, 31);
  buttonremovefilter3 = new SettingImageButtons(removeXfilter, removeYfilter3, removefilterWidth, removefilterHeight, removefilter3, removefilter3, removefilter3, 32);
  buttonremovefilter4 = new SettingImageButtons(removeXfilter, removeYfilter4, removefilterWidth, removefilterHeight, removefilter4, removefilter4, removefilter4, 33);
  //Turn Wifi On and Off
  buttonwifiOn = new SettingImageButtons(wifiX, wifiY, wifiWidth, wifiHeight, wifiOn, wifiOn, wifiOn, 37);
  buttonwifiOff = new SettingImageButtons(wifiX, wifiY, wifiWidth, wifiHeight, wifiOff, wifiOff, wifiOff, 38);
  buttonuicWifi = new SettingImageButtons(networkX, network1Y, networkWidth, networkHeight, uicWifi, uicWifi, uicWifi, 39);
  buttonuicWifi2 = new SettingImageButtons(networkX, network2Y, networkWidth, networkHeight, uicWifi2, uicWifi2, uicWifi2, 40);
  buttonuicWifi3 = new SettingImageButtons(networkX, network3Y, networkWidth, networkHeight, uicWifi3, uicWifi3, uicWifi3, 41);

 
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void settingDraw()

{
  //background(255);
  
 // buttongearIcon.update();
   
 // buttongearIcon.display();
 
  //Selecting setting icons
  if(settingFlag == 1 && displayFlag == 0)
  {
   fill(102);
   
   //the gray back box
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
   
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
    rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
    buttonIconSize.update();
    
    buttonIconSize.display();
    
    
    userList.get(whichUser).iconAdjust = constrain(((hs1.spos - slideOffset)/(hs1.swidth-10)),0.25,1) ;

     
     User temp = userList.get(whichUser);
     
     
     ArrayList<Button> btnList = temp.buttonSet;
     for(int i = 0; i < btnList.size();i++){
       Button btn = btnList.get(i);
       btn.width = int(temp.buttonX * userList.get(whichUser).iconAdjust );
       btn.height = int(temp.buttonY * userList.get(whichUser).iconAdjust );
     }
     
     temp.adjustButton();
     
     hs1.update();
     hs1.display();
  
  }
  
  
  if(settingFlag == 1 && displayFlag == 2)
  {
    fill(102);
   
   
    //Open Bluetooth settings
    buttonBluetooth.update();
    
    buttonBluetooth.display();
    
    buttonBluetoothOn.update();
    
    buttonBluetoothOn.display();
  }
  if(settingFlag == 1 && displayFlag == 3)
  {
    fill(102);
   
 rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
    rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
    //Bluetooth on
    buttonBluetoothOff.update();
    
    buttonBluetoothOff.display();
  }
  if(settingFlag == 1 && displayFlag == 5)
  {
    fill(102);
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
    //bluetooth Off
    buttonBluetoothOn.update();
    
    buttonBluetoothOn.display();
  }
    if(settingFlag == 1 && displayFlag == 6)
  {
    fill(102);
   
    rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
    rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
   
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
    rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
    
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
    
    
  }
  if(settingFlag == 1 && displayFlag == 14)
  {
    //Language
    fill(102);
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
    buttonLocation.update();
    buttonLocation.display();
  }
  if(settingFlag == 1 && displayFlag == 35)
  {
    //Transperency
    fill(102);
    rect(settingXaxis,settingYaxis,settingWidth,settingHeight);

    
    imageAdjust = constrain(((hs2.spos - slideOffset)/(hs2.swidth-10)),0.5,1) ;

     
     
     hs2.update();
     hs2.display();
     buttonTransparency.update();
     buttonTransparency.display();
  }
  if(settingFlag == 1 && displayFlag == 36)
  {
    //WiFI
    fill(102);
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
    rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
    buttonwifiOff.update();
    buttonwifiOff.display();
  }
  if(settingFlag == 1 && displayFlag == 38)
  {
    //click turned off wifi to turn it on
    fill(102);
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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
   
   rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
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


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void musicSetup(){

  noStroke(); 
  println(width);
  String temp  = "snow";
  songNames.add("Nightcore Sotsugyou");
  songNames.add(temp);

  //this checks to see what type of audio the browser can play
  //then assigns that file extension to our string
  fileExt = ".mp3";
  //loads the audio file and appends the file extension
  audio.setAttribute("src",songNames.get(current)+fileExt);
 
  //println(end);
  //this adds a listener to see when the file has finished playing
  //then calls a function that we named "repeat"
  audio.addEventListener("ended",next);
  //play the audio
  //audio.play();
  audio.volume=constrain(((volu.spos-offset)/(volu.swidth-10)),0,1);
  seeker.setsPos(0);
  
}


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
  
  

  
  int y = int(((canvasHeight/100)*70));
  
  int y2 = int(((canvasHeight/100)*70));
  int y3 = int(((canvasHeight/100)*70));
  
  int y4 = y + int(buttonYSize*1.3);
  
  int y5 = y + int(buttonYSize*1.3);
  
  int y6 = y + int(buttonYSize*1.3);
  
  int y7 = y + int(buttonYSize*2.6);
  
  int y8 = y + int(buttonYSize*2.6);
  
  int y9 = y + int(buttonYSize*2.6);
  
  int y0 = y + int(buttonYSize*3.9);
  
  int y10 = y + int(buttonYSize*3.9);
  
  int y11 = y + int(buttonYSize*3.9);
   
  

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
  
  butH.resize(40, 40);
  
  PImage butI = loadImage("Data/i.png");
  
  butI.resize(40, 40);
  
  PImage butJ = loadImage("Data/j.png");
  
  butJ.resize(40, 40);
  
  PImage butK = loadImage("Data/k.png");
  
  butK.resize(40, 40);
  
  PImage butL = loadImage("Data/l.png");
  
  butL.resize(40, 40);
  
  PImage butM = loadImage("Data/m.png");
  
  butM.resize(40, 40);
  
  PImage butN = loadImage("Data/n.png");
  
  butN.resize(40, 40);
  
  PImage butO = loadImage("Data/o.png");
  
  butO.resize(40, 40);
  
  PImage butP = loadImage("Data/p.png");
  
  butP.resize(40, 40);
  
  PImage butQ = loadImage("Data/q.png");
  
  butQ.resize(40, 40);
  
  PImage butR = loadImage("Data/r.png");
  
  butR.resize(40, 40);
  
  PImage butS = loadImage("Data/s.png");
  
  butS.resize(40, 40);
  
  PImage butT = loadImage("Data/t.png");
  
  butT.resize(40, 40);
  
  PImage butU = loadImage("Data/u.png");
  
  butU.resize(40, 40);
  
  PImage butV = loadImage("Data/v.png");
  
  butV.resize(40, 40);
  
  PImage butW = loadImage("Data/w.png");
  
  butW.resize(40, 40);
  
  PImage butX = loadImage("Data/x.png");
  
  butX.resize(40, 40);
  
  PImage butY = loadImage("Data/y.png");
  
  butY.resize(40, 40);
  
  PImage butZ = loadImage("Data/z.png");
  
  butZ.resize(40, 40);
  
  PImage butBack = loadImage("Data/back.png");
  
  butBack.resize(80, 40);
  
  PImage butGo = loadImage("Data/go.png");
  
  butGo.resize(80, 40);
  
  PImage butSpace = loadImage("Data/space.png");
  
  butSpace.resize(200, 40);
  
  PImage butApostrophe = loadImage("Data/apostrophe.png");
  
  butApostrophe.resize(40, 40);
  
  PImage butCom = loadImage("Data/com.png");
  
  butCom.resize(40, 40);
  
  PImage butComma = loadImage("Data/comma.png");
  
  butComma.resize(40, 40);
  
  PImage butPeriod = loadImage("Data/period.png");
  
  butPeriod.resize(40, 40);
  
  PImage butQuestionMark = loadImage("Data/questionMark.png");
  
  butQuestionMark.resize(40, 40);
  
  PImage butSlash = loadImage("Data/slash.png");
  
  butSlash.resize(40, 40);
  
  PImage butAChanged = loadImage("Data/aChanged.gif");
  
  butAChanged.resize(40, 40);
  
  PImage butBChanged = loadImage("Data/bChanged.gif");
  
  butBChanged.resize(40, 40);

  PImage butCChanged = loadImage("Data/cChanged.gif");
  
  butCChanged.resize(40, 40);

  PImage butDChanged = loadImage("Data/dChanged.gif");
  
  butDChanged.resize(40, 40);
  
  PImage butEChanged = loadImage("Data/eChanged.gif");
  
  butEChanged.resize(40, 40);
  
  PImage butFChanged = loadImage("Data/fChanged.gif");
  
  butFChanged.resize(40, 40);
  
  PImage butGChanged = loadImage("Data/gChanged.gif");
  
  butGChanged.resize(40, 40);
  
  PImage butHChanged = loadImage("Data/hChanged.gif");
  
  butHChanged.resize(40, 40);
  
  PImage butIChanged = loadImage("Data/iChanged.gif");
  
  butIChanged.resize(40, 40);
  
  PImage butJChanged = loadImage("Data/jChanged.gif");
  
  butJChanged.resize(40, 40);
  
  PImage butKChanged = loadImage("Data/kChanged.gif");
  
  butKChanged.resize(40, 40);
  
  PImage butLChanged = loadImage("Data/lChanged.gif");
  
  butLChanged.resize(40, 40);
  
  PImage butMChanged = loadImage("Data/mChanged.gif");
  
  butMChanged.resize(40, 40);
  
  PImage butNChanged = loadImage("Data/nChanged.gif");
  
  butNChanged.resize(40, 40);
  
  PImage butOChanged = loadImage("Data/oChanged.gif");
  
  butOChanged.resize(40, 40);
  
  PImage butPChanged = loadImage("Data/pChanged.gif");
  
  butPChanged.resize(40, 40);
  
  PImage butQChanged = loadImage("Data/qChanged.gif");
  
  butQChanged.resize(40, 40);
  
  PImage butRChanged = loadImage("Data/rChanged.gif");
  
  butRChanged.resize(40, 40);
  
  PImage butSChanged = loadImage("Data/sChanged.gif");
  
  butSChanged.resize(40, 40);
  
  PImage butTChanged = loadImage("Data/tChanged.gif");
  
  butTChanged.resize(40, 40);
  
  PImage butUChanged = loadImage("Data/uChanged.gif");
  
  butUChanged.resize(40, 40);
  
  PImage butVChanged = loadImage("Data/vChanged.gif");
  
  butVChanged.resize(40, 40);
  
  PImage butWChanged = loadImage("Data/wChanged.gif");
  
  butWChanged.resize(40, 40);
  
  PImage butXChanged = loadImage("Data/xChanged.gif");
  
  butXChanged.resize(40, 40);
  
  PImage butYChanged = loadImage("Data/yChanged.gif");
  
  butYChanged.resize(40, 40);
  
  PImage butZChanged = loadImage("Data/zChanged.gif");
  
  butZChanged.resize(40, 40);
  
  PImage butBackChanged = loadImage("Data/backChanged.gif");
  
  butBackChanged.resize(80, 40);
  
  PImage butGoChanged = loadImage("Data/goChanged.gif");
  
  butGoChanged.resize(80, 40);
  
  PImage butSpaceChanged = loadImage("Data/spaceChanged.gif");
  
  butSpaceChanged.resize(200, 40);
  
  PImage butApostropheChanged = loadImage("Data/apostropheChanged.gif");
  
  butApostropheChanged.resize(40, 40);
  
  PImage butComChanged = loadImage("Data/comChanged.gif");
  
  butComChanged.resize(40, 40);
  
  PImage butCommaChanged = loadImage("Data/commaChanged.gif");
  
  butCommaChanged.resize(40, 40);
  
  PImage butPeriodChanged = loadImage("Data/periodChanged.gif");
  
  butPeriodChanged.resize(40, 40);
  
  PImage butQuestionMarkChanged = loadImage("Data/questionMarkChanged.gif");
  
  butQuestionMarkChanged.resize(40, 40);
  
  PImage butSlashChanged = loadImage("Data/slashChanged.gif");
  
  butSlashChanged.resize(40, 40);
  
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
  
  int boardyTop = int((canvasHeight/100)*73.5) ;
  
  int boardyMiddle = boardyTop + 50 ;
  
  int boardyBottom = boardyMiddle +50;
  
  int boardyLast = boardyBottom + 50 ;
  
  int keyboardWidth = 40;
  
  int backWidth = 80;
  
  int spaceBarWidth = 200;
  
  int keyboardHeight = 40;
  //First Row
  buttonLowQ = new ImageKeyButtons(boardLeft1, boardyTop, keyboardWidth, keyboardHeight, butQ, butQ, butQChanged, "q"); //done
  buttonLowW = new ImageKeyButtons(boardLeft2, boardyTop, keyboardWidth, keyboardHeight, butW, butW, butWChanged, "w"); //done
  buttonLowE = new ImageKeyButtons(boardLeft3, boardyTop, keyboardWidth, keyboardHeight, butE, butE, butEChanged, "e");//done
  buttonLowR = new ImageKeyButtons(boardLeft4, boardyTop, keyboardWidth, keyboardHeight, butR, butR, butRChanged, "r"); //done
  buttonLowT = new ImageKeyButtons(boardLeft5, boardyTop, keyboardWidth, keyboardHeight, butT, butT, butTChanged, "t");//done
  buttonLowY = new ImageKeyButtons(boardLeft6, boardyTop, keyboardWidth, keyboardHeight, butY, butY, butYChanged, "y"); //done
  buttonLowU = new ImageKeyButtons(boardLeft7, boardyTop, keyboardWidth, keyboardHeight, butU, butU, butUChanged, "u");//done
  buttonLowI = new ImageKeyButtons(boardLeft8, boardyTop, keyboardWidth, keyboardHeight, butI, butI, butIChanged, "i"); //done
  buttonLowO = new ImageKeyButtons(boardLeft9, boardyTop, keyboardWidth, keyboardHeight, butO, butO, butOChanged, "o"); //done
  buttonLowP = new ImageKeyButtons(boardLeft10, boardyTop, keyboardWidth, keyboardHeight, butP, butP, butPChanged, "p"); //done
  buttonBack = new ImageKeyButtons(boardLeft11, boardyTop, backWidth, keyboardHeight, butBack, butBack, butBackChanged, "back");
  //Second Row
  buttonLowA = new ImageKeyButtons(boardLeft1+10, boardyMiddle, keyboardWidth, keyboardHeight, butA, butA, butAChanged, "a");//done
  buttonLowS = new ImageKeyButtons(boardLeft2+10, boardyMiddle, keyboardWidth, keyboardHeight, butS, butS, butSChanged, "s");//done
  buttonLowD = new ImageKeyButtons(boardLeft3+10, boardyMiddle, keyboardWidth, keyboardHeight, butD, butD, butDChanged, "d");//done
  buttonLowF = new ImageKeyButtons(boardLeft4+10, boardyMiddle, keyboardWidth, keyboardHeight, butF, butF, butFChanged, "f");//done
  buttonLowG = new ImageKeyButtons(boardLeft5+10, boardyMiddle, keyboardWidth, keyboardHeight, butG, butG, butGChanged, "g");//done
  buttonLowH = new ImageKeyButtons(boardLeft6+10, boardyMiddle, keyboardWidth, keyboardHeight, butH, butH, butHChanged, "h");//done
  buttonLowJ = new ImageKeyButtons(boardLeft7+10, boardyMiddle, keyboardWidth, keyboardHeight, butJ, butJ, butJChanged, "j");//done
  buttonLowK = new ImageKeyButtons(boardLeft8+10, boardyMiddle, keyboardWidth, keyboardHeight, butK, butK, butKChanged, "k");//done
  buttonLowL = new ImageKeyButtons(boardLeft9+10, boardyMiddle, keyboardWidth, keyboardHeight, butL, butL, butLChanged, "l");//done
  buttonApostrophe = new ImageKeyButtons(boardLeft10+10, boardyMiddle, keyboardWidth, keyboardHeight, butApostrophe, butApostrophe, butApostropheChanged, "'");//done
  buttonGo = new ImageKeyButtons(boardLeft11+10, boardyMiddle, backWidth, keyboardHeight, butGo, butGo, butGo, "go");//done
  //Third Row
  buttonLowZ = new ImageKeyButtons(boardLeft1, boardyBottom, keyboardWidth, keyboardHeight, butZ, butZ, butZChanged, "z");
  buttonLowX = new ImageKeyButtons(boardLeft2, boardyBottom, keyboardWidth, keyboardHeight, butX, butX, butXChanged, "x");
  buttonLowC = new ImageKeyButtons(boardLeft3, boardyBottom, keyboardWidth, keyboardHeight, butC, butC, butCChanged, "c");
  buttonLowV = new ImageKeyButtons(boardLeft4, boardyBottom, keyboardWidth, keyboardHeight, butV, butV, butVChanged, "v"); //done
  buttonLowB = new ImageKeyButtons(boardLeft5, boardyBottom, keyboardWidth, keyboardHeight, butB, butB, butBChanged, "b");
  buttonLowN = new ImageKeyButtons(boardLeft6, boardyBottom, keyboardWidth, keyboardHeight, butN, butN, butNChanged, "n");//done
  buttonLowM = new ImageKeyButtons(boardLeft7, boardyBottom, keyboardWidth, keyboardHeight, butM, butM, butMChanged, "m");//done
  buttonComma = new ImageKeyButtons(boardLeft8, boardyBottom, keyboardWidth, keyboardHeight, butComma, butComma, butCommaChanged, ",");//done
  buttonPeriod = new ImageKeyButtons(boardLeft9, boardyBottom, keyboardWidth, keyboardHeight, butPeriod, butPeriod, butPeriodChanged, ".");//done
  buttonQuestionMark = new ImageKeyButtons(boardLeft10, boardyBottom, keyboardWidth, keyboardHeight, butQuestionMark, butQuestionMark, butQuestionMarkChanged, "?");//done
  //Fourth Row
  buttonSlash = new ImageKeyButtons(boardLeft3, boardyLast, keyboardWidth, keyboardHeight, butSlash, butSlash, butSlashChanged, "/");//done
  buttonSpace = new ImageKeyButtons(boardLeft4, boardyLast, spaceBarWidth, keyboardHeight, butSpace, butSpace, butSpaceChanged, " ");
  buttonCom = new ImageKeyButtons(boardLeft8 - 15, boardyLast, keyboardWidth, keyboardHeight, butCom, butCom, butComChanged, ".com");//done
  
}




void setup() {


 //size(2732, 1536);
 //size(canvasWidth, canvasHeight);

 size(canvasWidth, canvasHeight);

 //size( 1366 ,768);

  initPopups();
  //fixOrderofButton(guest.buttonSet,guest.usrFunctionActive);
  currentPopup = new Popup("Data/9gag_desktop.png", int(xLocation), int(yLocation), int(gagWidth), int(gagHeight), 3);

  User guest = new User("Guest","0000",gobal_buttonX,gobal_buttonY);
  userList.add(guest);
  storeName.add("Guest");

  //userList.get(0).addButton("Data/9gag_icon.png",2); //9gag
 
  
  //userList.get(0).addButton("Data/health_icon.png",3); //health
  
  
  
  userList.get(0).addButton("Data/weather_icon.png",4); //weather

  userList.get(0).addButton("Data/news_icon.png",5); //article
  //userList.get(0).addButton("Data/facebook_icon.png",6); //facebook
  //userList.get(0).addButton("Data/twitter_icon.png", 7); //Twiter
  userList.get(0).addButton("Data/music_icon.png", 8); //Music
  userList.get(0).addButton("Data/cal_icon.png", 9);
  userList.get(0).addButton("Data/Timer_icon.png", 10);
  
  
  for(int i = 2;i<11;i++){
    ArrayList<menuButton> mBList= userList.get(0).menuSet;
    int idx = findMenuByFunction(mBList,i);
  
    if(idx != -1){
      
      mBList.get(idx).inUse = true; 
      mBList.get(idx).currentimage = mBList.get(idx).down;
    }
  
  }
  
  f = createFont("Arial",24,true);
  background(255);

  stroke(126);
  
  inSetup = false;
  //Profile Setup
  //////////////////////////////////////////////////
  
  Button temp = new Button(int((canvasWidth/100)*49.5 - profileButtonX), int((canvasHeight/100)*90) ,profileButtonX,profileButtonY,0);
  profile.add(temp);
  numberOfUser++;

  int index = findMostRight(profile);
  newUserButton = new CircleButton(int(index+profileButtonX+(2*(canvasWidth/100))),temp.y_Axis+(profileButtonY/2), profileButtonY, profileButtonY);
  
  //addProfileButton(profile,66,30,-2);
  //////////////////////////////////////////////////
  pinSetup();
  keyBoardSetup();
  musicSetup();
  settingSetup();
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
    if(isMusic){
      
      audio.volume=constrain(((volu.spos - offset)/(volu.swidth-10)),0,1);
      seek = (audio.currentTime);
      seeker.setsPos(seeker.xpos+audio.currentTime/(audio.duration/seeker.swidth));
      volu.update();
      
      
      if(seeker.update() == true){
        println("DEBUG 1 TRUE");
        
        //fadeOut = false;
        //audio.pause();
        
        audio.currentTime = (seeker.spos - seeker.xpos)* (audio.duration/seeker.swidth);
        //fadeOut = true;
        //audio.play();
      }
      seeker.display();
      
     
      volu.display();
      
    }
    else if(calenderInput && isHidden == false){
      calkeyBoardDraw();
      
    }
    else if(timerInput && isHidden == false){
      timerPinDraw();
      
    }
  }
  else if(stage == 4){
   if(iskeyboard == true){
      createNewUserKeyBoardDraw();
   }
   else{
      createNewUserPinDraw();
   }  
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
    

    text("*",int(((canvasWidth/100)*50  + pinSpace - (15 * i))), int((canvasHeight/100)*68));
   
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
    text("Enter Pin for User: " + userList.get(whichUser).name, int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*65)));
    if(wrongPin == true){
       textSize(26);
       text("Incorrect Pin Please Try Again", int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*85)));
    }
  }
  else if(stage == 4){
    textSize(36);
    if(stage4Part == 1){
      text("Enter New Pin ", int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*65)));
    }
    else if(stage4Part == 2){
      text("Comfirm New Pin ", int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*65)));
    }
    if(wrongConfirmPin == true){
      textSize(26);
      text("Pin did not match. Please Try Again", int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*85)));
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
  
  
  textSize(36);
  if(nameInUse == false){
    text("Enter New Username ",int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*65)));
  }
  else{
    text("Username Already Inuse Enter Different Username ",int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*65)));
  }
  drawTimeDate();
  if(stage == 4){
    text(keyTracker, (int)canvasWidth/2 + 20,  int((canvasHeight/100)*70));
  }
  

  
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
  
  drawProfileButtons();
}


void calkeyBoardDraw()

{
  userScreenDraw(userList.get(whichUser));
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  drawGrid();
  noStroke();
  if(stage == 3){
    text(keyTracker, (int)canvasWidth/2 + 20,  int((canvasHeight/100)*70));
  }
  
  
  textSize(36);
  
  text("Enter Note",int(((canvasWidth/100)*50) + buttonXSize/2),int(((canvasHeight/100)*65)));
  
  drawTimeDate();
  
  
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
  
   //drawProfileButtons();
}


void timerPinDraw()
{
  userScreenDraw(userList.get(whichUser));
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  drawGrid();
  noStroke();
  
  
  // draw the active button in a different color

    
  // find time var
  text(pin,int(((canvasWidth/100)*50 )), int((canvasHeight/100)*68));

  
  

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

}



// Drawing the starting Screen
void startDraw(){

  background(255); 
  stroke(126);
  //comment out drawGrid if you dont want to see the grid
  //drawGrid();
  noStroke();
  
  //if(isEvl){
    
  //}
  //else{
  
  //}
   textSize(36);
  textAlign(CENTER);
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
  //Settings
  Popup temp = new Popup("Data/settings_icon.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 0);
  popups.add(temp);
  
  //Menu
  temp = new Popup("Data/settings_icon.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 1);
  popups.add(temp);
  
  //9Gag
  temp = new Popup("Data/9gag_pic1.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 2);
  initLocations(temp,2);
  temp.PopupAddClickable(gag_previous_x_axis, gag_previous_y_axis, gag_box_width, gag_box_height, 1);
  temp.PopupAddClickable(gag_next_x_axis, gag_next_y_axis, gag_box_width, gag_box_height, 2);
  popups.add(temp);
  
  //Health Popup and clickables
  temp = new Popup("Data/Health_Template.png", permXLocation, permYLocation, int(healthWidth), int(healthHeight), 3);
  initLocations(temp, 3);
  temp.PopupAddClickable("Data/Health(Sleep).png",health_sleep_x_axis, health_sleep_y_axis,health_box_width,health_box_height, 1);
  temp.PopupAddClickable("Data/Health(Steps).png",health_step_x_axis, health_step_y_axis,health_box_width,health_box_height, 2);
  temp.PopupAddClickable("Data/Health(Weight).png",health_weight_x_axis, health_weight_y_axis,health_box_width,health_box_height, 3);
  popups.add(temp);
  
  //Weather popup and clickables
  temp = new Popup("Data/Weather_Template.png", permXLocation, permYLocation, int(weatherWidth), int(weatherHeight), 4);
  initLocations(temp, 4);
  temp.PopupAddClickable("Data/Weather(Today).png", weather_today_x_axis, weather_today_y_axis, weather_box_width, weather_box_height, 1);
  temp.PopupAddClickable("Data/Weather(Hourly).png", weather_hourly_x_axis, weather_hourly_y_axis, weather_box_width, weather_box_height, 2);
  temp.PopupAddClickable("Data/Weather(Weekly).png", weather_weekly_x_axis, weather_weekly_y_axis, weather_box_width, weather_box_height, 3);
  temp.PopupAddClickable("Data/Weather(Map).png", weather_map_x_axis, weather_map_y_axis, weather_box_width, weather_box_height, 4);
  popups.add(temp);
  
  //Articles
  temp = new Popup("Data/Article_Template(list).png", permXLocation, permYLocation, int(articleWidth), int(articleHeight), 5);
  initLocations(temp,5);
  temp.PopupAddClickable(article1_select_x_axis, article1_select_y_axis, article_select_width, article_select_height, 1);
  temp.PopupAddClickable(article2_select_x_axis, article2_select_y_axis, article_select_width, article_select_height, 2);
  temp.PopupAddClickable(article3_select_x_axis, article3_select_y_axis, article_select_width, article_select_height, 3);
  temp.PopupAddClickable(article4_select_x_axis, article4_select_y_axis, article_select_width, article_select_height, 4);
  temp.PopupAddClickable(article5_select_x_axis, article5_select_y_axis, article_select_width, article_select_height, 5);
  
  temp.PopupAddClickable(article1_type_x_axis, article1_type_y_axis, article_type_width, article_type_height, 6);
  temp.PopupAddClickable(article2_type_x_axis, article2_type_y_axis, article_type_width, article_type_height, 7);
  temp.PopupAddClickable(article3_type_x_axis, article3_type_y_axis, article_type_width, article_type_height, 8);
  
  temp.PopupAddClickable(article_back_x_axis, article_back_y_axis, article_back_width, article_back_height, 9);
  popups.add(temp);
  
  //Facebook
  temp = new Popup("Data/Facebook.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 6);
  popups.add(temp);
  
  //Twitter
  temp = new Popup("Data/Twiter.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 7);
  popups.add(temp);
  
  
  temp = new Popup("Data/music_big.png", permXLocation, permYLocation, int(music_width), int(music_height), 8);
  initLocations(temp,8);
  temp.PopupAddClickable(music_reverse_x_axis, music_reverse_y_axis, music_box_width, music_box_height, 1); //Reverse Button
  temp.PopupAddClickable(music_mid_x_axis, music_mid_y_axis, music_box_width, music_box_height, 2);         //Play/Pause Button
  temp.PopupAddClickable(music_forward_x_axis, music_forward_y_axis, music_box_width, music_box_height, 3); //Forward Button
  
  temp.PopupAddClickable(music_volume_x_axis, music_volume_y_axis, vol_box_width, vol_box_height, 4); //Volume
  volu = new HScrollbar(music_volume_x_axis, music_volume_y_axis, vol_box_width, vol_box_height, 1);
  offset = music_volume_x_axis;

  temp.PopupAddClickable(music_seek_x_axis, music_seek_y_axis, seek_box_width, seek_box_height, 5);   //Seek
  seeker = new HScrollbar( music_seek_x_axis,music_seek_y_axis,  seek_box_width-8, seek_box_height, 1);
  
  //Playlist section
  temp.PopupAddClickable(playlist1_x_axis, playlist1_y_axis, playlist_width, playlist_height, 6);
  temp.PopupAddClickable(playlist2_x_axis, playlist2_y_axis, playlist_width, playlist_height, 7);
  temp.PopupAddClickable(playlist3_x_axis, playlist3_y_axis, playlist_width, playlist_height, 8);
  temp.PopupAddClickable(playlist4_x_axis, playlist4_y_axis, playlist_width, playlist_height, 9);
  popups.add(temp);
  
  
  temp = new Popup("Data/AprilEng.png", permXLocation, permYLocation, int(calWidth), int(calHeight), 9);    

  initLocations(temp,9);
  addCalDates(temp);
  popups.add(temp);
  
  
  temp = new Popup("Data/Timer_Template.png", permXLocation, permYLocation, int(gagWidth), int(gagHeight), 10);
  initLocations(temp,10);
  temp.PopupAddClickable(timer_set_x_axis, timer_set_y_axis, timer_button_width, timer_button_height, 1);
  temp.PopupAddClickable(timer_start_x_axis, timer_start_y_axis, timer_button_width, timer_button_height, 2);
  popups.add(temp);
    
  miniPlayer = new Popup("Data/music_small(play).png", 2500, 1200, small_music_box_width, small_music_box_height, 1);
  miniPlayer.PopupAddClickable(2500, 1210, 60, 75, 1); //Reverse
  miniPlayer.PopupAddClickable(2570, 1210, 60, 75, 2); //Play/pause
  miniPlayer.PopupAddClickable(2640, 1210, 60, 75, 3); //Forward
  
  miniTimer = new Popup("Data/Timer_Small.png", 2450, 1000, timerWidth_small, timerHeight_small, 1);
  miniTimer.PopupAddClickable(2500, 1100, 155, 55, 1);

  
}

void initLocations(Popup currentPopup, int f) {
  
  if( f == 2) {
      int val = 38;
      gag_previous_x_axis =currentPopup.x_Axis + int((currentPopup.width/100)*val);
      gag_previous_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*95); 
      val+=15;
      gag_next_x_axis =currentPopup.x_Axis + int((currentPopup.width/100)*val);
      gag_next_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*95); 
  }
  else if(f == 3) {
      int val = 18;
      health_sleep_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*val);
      health_sleep_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*80);
      
      //Step
      val+= 22;
      health_step_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*val);
      health_step_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*80);
      
      //Weight
      val+=22;    
      health_weight_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*val);
      health_weight_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*80);
      
      health_box_width = int((healthWidth/100)*20);
      health_box_height = int((healthHeight/100)*15);
  }
  else if(f == 4) {
     int val = 18;
     weather_today_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*val);
     weather_today_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*80);
     
     val+=17;
     weather_hourly_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*val);
     weather_hourly_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*80);
     
     val+=17;
     weather_weekly_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*val);
     weather_weekly_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*80);
     
     val+=17;
     weather_map_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*val);
     weather_map_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*80);
  
  }
  else if(f == 5) {
    //start 4 (+14)
    int val = 4;
    article1_select_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*4);
    article1_select_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*val);
    
    val+=14;
    article2_select_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*4);
    article2_select_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*val);
    
    val+=14;
    article3_select_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*4);
    article3_select_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*val);
    
    val+=14;
    article4_select_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*4);
    article4_select_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*val);
    
    val+=14;
    article5_select_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*4);
    article5_select_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*val);
    
    //val = 4 (+33)
    int new_val = 4;
    article1_type_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*new_val);
    article1_type_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*75);
    
    new_val+=33;
    article1_type_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*new_val);
    article1_type_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*75);
    
    new_val+=33;
    article1_type_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*new_val);
    article1_type_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*75);
    
    article_back_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*33);
    article_back_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*90);
  }
  
  else if(f == 8) {    
     int val = 12;
     music_reverse_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*val);
     music_reverse_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*60);
     
     val+=18;
     music_mid_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*val);
     music_mid_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*60);
     
     val+=18;
     music_forward_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*val);
     music_forward_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*60);
    
    
     music_volume_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*10);
     music_volume_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*84);
    
     music_seek_x_axis = currentPopup.x_Axis + int((currentPopup.width/100));
     music_seek_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*43);
     
     int playlist_val = 0;
     playlist1_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*70);
     playlist1_y_axis  = currentPopup.y_Axis + int((currentPopup.height/100));
     
     playlist_val += 25;
     playlist2_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*70);
     playlist2_y_axis  = currentPopup.y_Axis + int((currentPopup.height/100)*playlist_val);
     
     playlist_val += 25;
     playlist3_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*70);
     playlist3_y_axis  = currentPopup.y_Axis + int((currentPopup.height/100)*playlist_val);
     
     playlist_val += 25;
     playlist4_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*70);
     playlist4_y_axis  = currentPopup.y_Axis + int((currentPopup.height/100)*playlist_val);
     
  
  }
  else if(f == 9) {
    
    //0 (+15) and 10 (+15)
     cal_x_axis = currentPopup.x_Axis + int((currentPopup.width/100));
     cal_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*10);
  }
  else if(f == 10) {
    //65 (+15)
    timer_start_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*8);
    timer_start_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*65);
    
    timer_set_x_axis = currentPopup.x_Axis + int((currentPopup.width/100)*8);
    timer_set_y_axis = currentPopup.y_Axis + int((currentPopup.height/100)*80);
  }
  
}

void addCalDates(Popup current) {
  //35
  int day = 1;
  int x_val = 1;
  int y_val = 10;
  int cal_x, cal_y;
  for(int i = 0; i < 35; i++) {
    if(i % 7 == 0 && i != 0) {
      y_val+=15;
      x_val = 1;
    
    }
    
    
      cal_x = current.x_Axis + int((current.width/100)*x_val);
      cal_y = current.y_Axis + int((current.height/100)*y_val);
      
      current.PopupAddClickable(cal_x, cal_y, cal_date_width, cal_date_height, day);
      //rect(cal_x_axis, cal_y_axis, cal_date_width, cal_date_height);
      println("day: "+day);
      x_val+=14;
      day++;
  }

}

void setArticleTopics(Popup current) {
  int limit = 0;
  ArrayList<String> topics = new ArrayList<String>();
  //StringList topics = new StringList();
  if(filterFlag1 == 1) {
    limit++;
    topics.add("Gaming");
    println("Adding Gaming");
  }
  if(filterFlag2 == 1) {
    limit++; 
    topics.add("Business");
    println("Adding Business");
  }
  if(filterFlag3 == 1) {
    limit++;
    topics.add("Politics");
    println("Adding Politics");
  }
  if(filterFlag4 == 1 && limit < 3) {
    limit++;
    topics.add("Tech");
    println("Adding Tech");
  }
  //Default
  if(limit < 3) {
    println("Default");
    topics = new ArrayList<String>();
    topics.add("Gaming");
    topics.add("Business");
    topics.add("Politics");
  
  }
  for(int i = 5; i < current.clickable.size(); i++) {
    current.clickable.get(i).buttonMessage = topics.get(i-5);
  }

}

void displayArticleTopics(Popup current) {
  
  for(int i = 4; i < current.clickable.size(); i++) {
    textSize(30);
    text(current.clickable.get(i).buttonMessage, current.clickable.get(i).x_Axis+60, current.clickable.get(i).y_Axis+50);
    textSize(24);
  
  }

}

void setCalText(Button current) {
    current.setButtonMessage(calenderNote);
}

void displayCalText(Popup current) {
  
  for(int i = 0; i < current.clickable.size(); i++) {
    textSize(15);
    fill(0,102,153);
    text(current.clickable.get(i).buttonMessage, int(current.clickable.get(i).x_Axis+20), int(current.clickable.get(i).y_Axis+30) );
    textSize(24);  
  }
}

void updateXYLocation(int popUpFunction) {
  
    popups.get(popUpFunction).x_Axis = int(xLocation);
    popups.get(popUpFunction).y_Axis = int(yLocation);
}

//ISSUES LAST KNOWN POSITION IS NOT SAVING...
void getCurrentButtonPopup(int current) {
  currentPopup = popups.get(current);
}

//Draw the User Screen 
void userScreenDraw(User current){
  
  background(255); 
  stroke(126);
   //tint(255, (255*imageAdjust));
  //comment out drawGrid if you dont want to see the grid
  drawGrid();
  noStroke();
  drawTimeDate();
  inMenu = false;
  inSetting = false;
  if(activeSmallMusic){
    image(miniPlayer.img, miniPlayer.x_Axis, miniPlayer.y_Axis, miniPlayer.width, miniPlayer.height);
  }
  image(miniTimer.img, miniTimer.x_Axis, miniTimer.y_Axis, miniTimer.width, miniTimer.height);
  //rect(2500, 1100, 155, 55);
  Button temp;  
  temp = userList.get(whichUser).hid;
  image(temp.img, temp.x_Axis, temp.y_Axis, temp.width, temp.height);
  if(isHidden){

    return;
  }
 

  if(iconDrag) {
      fill(192,192,192);
      rect(iconX_drag, iconY_drag, iconDrag_box_width,iconDrag_box_height, 10);
  }
  fill(127,127,127);
  for (int loopCounter=0; loopCounter < current.buttonSet.size(); loopCounter++){
    temp = current.buttonSet.get(loopCounter);
    if(loopCounter == iconIndex && iconDrag){
      fill(148, 183, 239)
      rect(temp.x_Axis-5,temp.y_Axis-5,temp.width+10,temp.height+10);
      fill(127,127,127);
      image(temp.img, temp.x_Axis, temp.y_Axis, temp.width, temp.height);
      //rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
    }
    else if(temp.function == functionInUse && boxInUse == true){
    
      fill(148, 183, 239);
      rect(temp.x_Axis-5,temp.y_Axis-5,temp.width+10,temp.height+10);
      fill(127,127,127);
      image(temp.img, temp.x_Axis, temp.y_Axis, temp.width, temp.height);
      
    }
    else{
      
      image(temp.img, temp.x_Axis, temp.y_Axis, temp.width, temp.height);
    }
  } 
  temp = userList.get(whichUser).hid;
  image(temp.img, temp.x_Axis, temp.y_Axis, temp.width, temp.height);
  
  
  // need to change to so that it popup the correct function
  if(boxInUse == true && functionInUse != 0 && functionInUse!=1){
    //println("Inside boxInUse True area");
    inMenu = false;;
    inSetting = false;
    if(drag) {
      fill(192,192,192);
      //Fix
      rect(x_drag, y_drag, drag_box_width, drag_box_height, 10);
    }
    
    image(currentPopup.img, currentPopup.x_Axis, currentPopup.y_Axis, currentPopup.width, currentPopup.height);
    
    if(currentPopup.function == 5) {
      setArticleTopics(currentPopup);
      if(readingArticle){
      
      }
      else {
        displayArticleTopics(currentPopup);
      }
    }
    
    if(currentPopup.function == 9) {
      displayCalText(currentPopup);
      displayArticleTopics(currentPopup);
    }
    
    //showDates(currentPopup);
    //rect(timer_start_x_axis, timer_start_y_axis, timer_button_width, timer_button_height);
    //rect(playlist2_x_axis, playlist2_y_axis, playlist_width, playlist_height);
    //rect(playlist3_x_axis, playlist3_y_axis, playlist_width, playlist_height);
    //rect(playlist4_x_axis, playlist4_y_axis, playlist_width, playlist_height);
    //rect(gag_previous_x_axis, gag_previous_y_axis, gag_box_width, gag_box_height);
    //rect(gag_next_x_axis, gag_next_y_axis, gag_box_width, gag_box_height);

    //rect(weather_weekly_x_axis, weather_weekly_y_axis, weather_box_width, weather_box_height);
    //rect(weather_map_x_axis, weather_map_y_axis, weather_box_width, weather_box_height);
    updateClickableBoxes(currentPopup, currentPopup.function);
    
    if(imageBox) {

      image(currentButton.img, currentButton.x_image, currentButton.y_image);
    

    }
    //Button test = currentPopup.clickable.get(0);
    
   // println(test.x_Axis);
    //rect(test.x_Axis, test.y_Axis, test.width, test.height);
    //rect(xtest, ytest, width_test, height_test);
    //pop_up_box(xLocation, yLocation);
  }
  //menu popup
  else if (boxInUse == true && functionInUse != 0){
    
    inMenu = true;
    inSetting = false;
    rect(menuXaxis,menuYaxis,menuWidth,menuHeight);
    
    User u = userList.get(whichUser);
    ArrayList<menuButton> mBSet = u.menuSet;
    menuButton mB;
    for(int i = 0;i<mBSet.size();i++){
       mB = mBSet.get(i);
       mB.update();
       mB.display();
    }
    
    
  }
  //setting popup
  else if(boxInUse == true && functionInUse != 1){
    inMenu = false;
    inSetting = true;
    settingFlag = 1;
    
    settingDraw();
  
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
  
  
  fill(127,127,0);

  textFont(f);
  textSize(66);
  fill(127,127,127);
  textAlign(LEFT);
  
  timeString = getCurrentTime();
  text(timeString, 20 , 50);
  textSize(46);
  text(month() + "/" + day() + "/" + year(),30 , 100);
  
  textSize(36);
  text("57°F",320 ,140 );
  
  
  fill(0);
  textAlign(CENTER);
  
}

void drawProfileButtons(){
  Button temp;
  for (int loopCounter=0; loopCounter < profile.size(); loopCounter++){
    temp = profile.get(loopCounter);
  
    if(whichUser == loopCounter ){
      fill(154, 189, 244);
    }
    else{
      fill(127,127,127);
    }
    rect(temp.x_Axis,temp.y_Axis,temp.width,temp.height, 10);
     fill(0);
     String nameHolder = userList.get(loopCounter).name;  
     if(nameHolder.length() > 5){
       nameHolder = nameHolder.substring(0,5);
       nameHolder = nameHolder + "..";
       
     }
    textSize(38);
    text(nameHolder, temp.x_Axis +50 ,temp.y_Axis + 40 );
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
  
  if(isMusic){
   if( insideBox(seeker.xpos,seeker.ypos,seeker.swidth,seeker.swidth)){
   
     return;
   }
   if( insideBox(volu.xpos,volu.ypos,volu.swidth,volu.swidth)){
   
     return;
   }
    
    
    
  }
  
  if(insideBox(currentPopup.x_Axis, currentPopup.y_Axis, currentPopup.width, currentPopup.height )&& isHidden ==false ){
    drag = true;
    PopUpDrag();
    iconDrag = false;
    return;
  }
  
  if(iconDrag == false && isHidden == false){
     dragLoopInsideBox() ;
     println("DEBUG whichuser " + whichUser);
     println("DEBUG iconIndex" + iconIndex);
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
    if(current.x_Axis+ ((userList.get(whichUser).buttonX)*(userList.get(whichUser).iconAdjust))> blist.get(i).x_Axis &&
       current.x_Axis+ ((userList.get(whichUser).buttonX)*(userList.get(whichUser).iconAdjust)) < blist.get(i).x_Axis +  ((userList.get(whichUser).buttonX)*(userList.get(whichUser).iconAdjust))){
      
     
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
  
  if(f == 2) {
      int val = 38;
      for(int i = 0; i < box.clickable.size(); i++) {
        box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100)*val);
        box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)*95);
        val+= 15;   
      }
  
  }
  
  //Health Popup
  else if(f == 3) {
      int val = 18;
      for(int i = 0; i < box.clickable.size(); i++) {
        box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100)*val);
        box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)*80);
        
        box.clickable.get(i).x_image = box.x_Axis + int((box.width/100)*23);
        box.clickable.get(i).y_image = box.y_Axis + int((box.width/100)*4);
        
        health_box_width = box.x_Axis + int((box.width/100)*val);
        health_box_height = box.y_Axis + int((box.height/100)*80);
        val+= 22;   
      }
  }
  //Weather
  else if(f == 4) {
    int val = 18;
    for(int i = 0; i < box.clickable.size(); i++) {
        box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100)*val);
        box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)*80);
        
        if(box.clickable.get(i).function == 2) {
          box.clickable.get(i).x_image = box.x_Axis + int((box.width/100)*23);
          box.clickable.get(i).y_image = (box.y_Axis-75) + int((box.width/100)*2);
        }
        else if(box.clickable.get(i).function == 4) {
          box.clickable.get(i).x_image = box.x_Axis + int((box.width/100)*23);
          box.clickable.get(i).y_image = (box.y_Axis-10) + int((box.width/100));
        }
        else {
          box.clickable.get(i).x_image = box.x_Axis + int((box.width/100)*23);
          box.clickable.get(i).y_image = box.y_Axis + int((box.width/100));
        }     
        val+=17;
      }
  }
  else if( f == 5) {
    int select_val, type_val = 4;
    for(int i = 0; i < box.clickable.size(); i++) {
      if(box.clickable.get(i).function <= 5) {
        box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100)*4);
        box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)*select_val);
        select_val+=14;
      }
      else if(box.clickable.get(i).function > 5 && box.clickable.get(i).function != 9) {
        box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100)*type_val);
        box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)*75);
        type_val+=33;
      }
      else if(box.clickable.get(i).function == 9) {
        box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100)*33);
        box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)*90);
        
      }
    }
  }
  else if(f == 8) {
    int val = 12;
    int playlist_val = 1;
    for(int i = 0; i < box.clickable.size(); i++) {
      //volume
      if(box.clickable.get(i).function == 4) {
        box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100)*10);
        box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)*84);
        
        volu.HscrollbarLocationUpdate( box.clickable.get(i).x_Axis+3,box.clickable.get(i).y_Axis+15 );
        offset= box.clickable.get(i).x_Axis;
      }
      //seek
      //popup 8 array
      else if(box.clickable.get(i).function == 5) {
        box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100));
         
        box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)*43);     
        

        seeker.HscrollbarLocationUpdate(box.clickable.get(i).x_Axis-2,box.clickable.get(i).y_Axis +17);
        
      }
      else if(box.clickable.get(i).function > 5) {
        box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100)*70);
        box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)* playlist_val);
        playlist_val += 24;
      
      }
      else{
        box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100)*val);
        box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)*60);
      }
      val+=18;
    }
  }
  else if(f == 9) {
    int x_val = 1;
    int y_val = 10;
    for(int i = 0; i < box.clickable.size(); i++) {
      if(i % 7 == 0 && i != 0) {
        y_val+=15;
        x_val = 1;
      }
             
      box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100)*x_val);
      box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)*y_val);
        
      x_val+=14;
      
    
    }
  }
  else if(f == 10) {
    int val = 65;
    for(int i = 0; i < box.clickable.size(); i++) {
    
      box.clickable.get(i).x_Axis = box.x_Axis + int((box.width/100)*8);
      box.clickable.get(i).y_Axis = box.y_Axis + int((box.height/100)*val);
      val+=15;
    }
  }
  
}

void PopUpDrag(){
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
  if( mouseX-iconDragDifx < iconX_drag || mouseX-iconDragDifx+userList.get(whichUser).buttonX > iconX_drag+ iconDrag_box_width ){//|| mouseY-dragDify < iconY_drag || mouseY-dragDify+buttonY > iconY_drag + iconDrag_box_height) {

      //Do nothing.
      if(xLocation < x_drag){
        userList.get(whichUser).buttonSet.get(iconIndex).x_Axis = int(x_drag);
      }
      if( xLocation+popUpX > x_drag + drag_box_width){
         userList.get(whichUser).buttonSet.get(iconIndex).x_Axis = int(x_drag + drag_box_width - userList.get(whichUser).buttonX);
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
        resetInfo();
        whichUser = -1;
        stage = 1;
      }
    }
  }
  //General User Screen
  else if(stage == 3){
    //rect((canvasWidth/100)*40,(canvasHeight/100)*60,(canvasWidth/100)*20,(canvasWidth/100)*10);

      UserScreen_MouseReleased();
    
  } 
  //Create new User Screen
  else if(stage == 4){
    
   if(profileSelect_MouseReleased() == false){
    if(iskeyboard == false){
       if(outsidePinArea() == true){
        resetInfo();
        whichUser = -1;
        stage = 1;
      }
    }
    else if(iskeyboard){
      if(outsideKeyboard()){
         resetInfo();
         whichUser = -1;
         stage = 1;
      }
    
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
    resetInfo();
    userSelected = false;
    return true;
  }
  
  
  for (int loopCounter=0; loopCounter < profile.size(); loopCounter++){
    temp = profile.get(loopCounter);
    if(insideBox(temp.x_Axis,temp.y_Axis,temp.width,temp.height) && whichUser != loopCounter){
      userSelected = true;
      whichUser = loopCounter;
      resetInfo();
      String sTemp  = (userList.get(whichUser)).name;
      if(sTemp.equals("Guest")){
        stage = 3;
        hs1.sposPercentageAdjust(userList.get(whichUser).iconAdjust);
        return true;
      }
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
  
  if(boxInUse && inMenu == true  && outsideMenuArea() == true){
    console.log("check ");
    
    boxInUse = false;
    imageBox = false;
    isMusic = false;
    drag = false;
    inSetting = false;
    iconDrag = false;
    inMenu = false;
    if(clickOtherButton()){
      boxInUse = true;   
      //User u = userList.get(whichUser);
      //Button currentButton = u.buttonSet.get(iconIndex);      
      getCurrentButtonPopup(functionInUse);

    }
    
    return;
  }
  
   if(boxInUse && inSetting == true && outsideSettingArea() == true){
    console.log("check ");
    
    boxInUse = false;
    imageBox = false;
    isMusic = false;
    drag = false;
    inSetting = false;
    iconDrag = false;
    inMenu = false;
    if(clickOtherButton()){
      boxInUse = true;   
      //User u = userList.get(whichUser);
      //Button currentButton = u.buttonSet.get(iconIndex);      
      getCurrentButtonPopup(functionInUse);

    }
    
    return;
  }
  
  
  
  if(boxInUse && outsideBox(currentPopup.x_Axis, currentPopup.y_Axis, currentPopup.width, currentPopup.height)) {
    if(functionInUse == 0 || functionInUse == 1){
      return;
    }
    background(255);
    imageBox = false;
    isMusic = false;
    boxInUse = false;   
    //calenderInput = false;
    //timerInput = false;
    
    if(outsideKeyboard() && functionInUse == 9){
      calenderInput = false;
      boxInUse = false;   
    
    }
    else if(outsideKeyboard() == false && functionInUse == 9 && calenderInput == true){

      boxInUse = true;   

    }
    else if(outsidePinArea() && functionInUse == 10){
      timerInput = false;
      boxInUse = false;   
    
    }
    else if(outsidePinArea() == false && functionInUse == 10 && timerInput == true){
      
      boxInUse = true;   

    }

    //music
    if(functionInUse == 8 && fadeOut == true){
       activeSmallMusic = true;
    }
    
    else if(functionInUse == 8 && fadeOut == false){
       activeSmallMusic = false; 
    }
    if(clickOtherButton()){
      boxInUse = true;   
      //User u = userList.get(whichUser);
      //Button currentButton = u.buttonSet.get(iconIndex);      
      getCurrentButtonPopup(functionInUse);

    }
    drag = false;
    iconDrag = false;
    return;
      
    
  }
  if((loopInsideBox() || iconDrag== true)  && !boxInUse){
    println("DEBUG loop " + functionInUse);
    getCurrentButtonPopup(functionInUse);
    if(functionInUse == 8){
      isMusic = true;
      activeSmallMusic = false;
    }
    boxInUse = true;
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
    
    for(int i = 0; i < currentPopup.clickable.size(); i++) {
      if(insideBox(currentPopup.clickable.get(i).x_Axis, currentPopup.clickable.get(i).y_Axis, currentPopup.clickable.get(i).width, currentPopup.clickable.get(i).height)) {
        //If app is 9gag
        if(currentPopup.function == 2 && boxInUse == true) {
          if(currentPopup.clickable.get(i).function == 1) {
            println("Prev");
            
            if(gag_stage == 1) {
              gag_stage = 1;
            }
            else {
              gag_stage--;
            }
            
            currentPopup.img = loadImage("Data/9gag_pic" + gag_stage + ".png");
            break;
          }
          else if(currentPopup.clickable.get(i).function == 2) {
            println("Next");
            if(gag_stage > 2) {
              gag_stage = 3;
            }
            else {
              gag_stage++;
            }
            
            currentPopup.img = loadImage("Data/9gag_pic" + gag_stage + ".png");
            break;
          }
        }
        //Inside Article
        else if(currentPopup.function == 5 && boxInUse == true) {
          println("Pressed Article ID: " + currentPopup.clickable.get(i).function);
          
          
          if(currentPopup.clickable.get(i).function == 9 ) {
            readingArticle = false;
            currentPopup.img = loadImage("Data/Article_Template(list).png");
            break;
          }
          else if(currentPopup.clickable.get(i).function <= 5) {
            readingArticle = true;
            currentPopup.img = loadImage("Data/Article_Template(detail).png");
            break;
          }

        }        
        //Inside Music
        else if(currentPopup.function == 8 && boxInUse == true) {
          
          if(currentPopup.clickable.get(i).function == 1) {
            println("Pressed reverse button");
            previous();
            return; 
          }
          else if(currentPopup.clickable.get(i).function == 2) {
            println("Pressed pause/play button");
            fadeOut=!fadeOut;
            if (fadeOut){
              vol=1;
              col=255;
              audio.play();
              
            }
            else if (!fadeOut){
              vol-=.1;
              col-=25;
              
     
              audio.pause();
            }
            return;
            
            
          }
          else if(currentPopup.clickable.get(i).function == 3) {
            println("Pressed forward button");
            next();
            return;
          }
          else if(currentPopup.clickable.get(i).function == 4 ) {
            println("Pressed volume button");
          }
          else if(currentPopup.clickable.get(i).function == 5) {
            println("Pressed Seek button");
          }
          else if(currentPopup.clickable.get(i).function > 5) {
            println("Pressed playlist " + currentPopup.clickable.get(i).function);
          }
        
        }
        //Calendar
        else if(currentPopup.function == 9 && boxInUse == true ) {
          User u = userList.get(whichUser);
          String s =u.name;
          if(!(s.equals("Guest"))){
             println("Calendar ID: " + currentPopup.clickable.get(i).function);
            calenderInput  =true;
            updateText = false;
             currentPopup.x_Axis = int((canvasWidth/100)*35);
             currentPopup.y_Axis = int((canvasHeight/100)*30);
             
            currentButton = currentPopup.clickable.get(i); 
          }
        }
        else if(currentPopup.function == 10 && boxInUse == true ) {
          if(currentPopup.clickable.get(i).function == 1) {
            println("Pressed SET TIMER");
            timerInput = true;
            currentPopup.x_Axis = int((canvasWidth/100)*40);
           currentPopup.y_Axis = int((canvasHeight/100)*25);
          }
          else if(currentPopup.clickable.get(i).function == 2) {
            println("Pressed START");
            int secs = stringToSec(timerString);
            tm = new Timer(secs);
          }
        
        }
        else {
          imageBox = true;
          currentButton = currentPopup.clickable.get(i);
          break;      
        }       
      }  
    }   
    
     originalX = xLocation;
     originalY = yLocation;
     dragDifx = mouseX-xLocation;
     dragDify = mouseY-yLocation;
     println("DEBUG 2");
     drag = false;
     iconDrag = false;
    
  }
  else if(insideBox(miniPlayer.x_Axis, miniPlayer.y_Axis, miniPlayer.width, miniPlayer.height) ) {
    for(int i = 0; i < miniPlayer.clickable.size(); i++) {
      if(insideBox(miniPlayer.clickable.get(i).x_Axis, miniPlayer.clickable.get(i).y_Axis, miniPlayer.clickable.get(i).width, miniPlayer.clickable.get(i).height)) {
        if(miniPlayer.clickable.get(i).function == 1) {
          println("Small reverse button");
          previous();
        }
        else if(miniPlayer.clickable.get(i).function == 2) {
          println("Small pause/play button");
          fadeOut=!fadeOut;
            if (fadeOut){
              vol=1;
              col=255;
              audio.play();
            }
            else if (!fadeOut){
              vol-=.1;
              col-=25;
              audio.pause();
              activeSmallMusic = false;
            }
            return;
        }
        else if(miniPlayer.clickable.get(i).function == 3) {
          println("Small forward button");
          next();
        }
      }
    }
  
  }
  else if(insideBox(miniTimer.x_Axis, miniTimer.y_Axis, miniTimer.width, miniTimer.height)) {
    if(insideBox(miniTimer.clickable.get(0).x_Axis, miniTimer.clickable.get(0).y_Axis, miniTimer.clickable.get(0).width, miniTimer.clickable.get(0).height)) {
      println("Pressed Start/Stop Timer Small");
    }
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
  User guest = userList.get(whichUser);
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
  User guest = userList.get(whichUser);
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
  User guest = userList.get(whichUser);
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
    
    int y = int(((canvasHeight/100)*70));
    
    int yEnd = y+   int(buttonYSize*4.9);
    
  if((mouseX < x || mouseX >= (xEnd)) || ((mouseY < y) || mouseY > (yEnd))) {
   
     return true;
   }
   else {
     return false;
   }
   
}

boolean outsideMenuArea(){
    
    int x =  int(menuXaxis);
    
    int xEnd = int(menuXaxis + menuWidth) ;
    
    int y = int(menuYaxis);
    console.log("DEBUG y " + y );
    console.log("DEBUG mouseY " + mouseY );
    
    
    int yEnd = int(menuYaxis + menuHeight);
    
  if((mouseX < x || mouseX >= (xEnd)) || ((mouseY < y) || mouseY > (yEnd))) {
     console.log("true");
     return true;
   }
   else {
     console.log("false");
     return false;
   }
   
}

boolean outsideSettingArea(){
    
    //rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
    
    int x = settingXaxis ;
    
    int xEnd = x+ settingWidth ;
    
    int y = settingYaxis;

    
    int yEnd = y+settingHeight;
    
  if((mouseX < x || mouseX >= (xEnd)) || ((mouseY < y) || mouseY > (yEnd))) {
      
     displayFlag = 0;
     return true;
   }
   else {

     return false;
   }
}

boolean outsideKeyboard(){
    
    int x = (int)canvasWidth/2 - 340;
    
    int xEnd = (int)canvasWidth/2 + 260 + 80 ;
    
    int y = int((canvasHeight/100)*73.5);
    
    int yEnd = y + 200 ;
    
    
  if((mouseX < x || mouseX >= (xEnd)) || ((mouseY < y) || mouseY > (yEnd))) {
   
     return true;
   }
   else {
     return false;
   }
   
}

void resetInfo(){
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
  iskeyboard = true;
  inputName = "";
  keyFlag = 0;
  keyTracker = "";
  keyRep = "";
  keySpace = 0;
  nameInUse = false;

}

//Function to get current Time
String getCurrentTime(){
  
  int adjustment;
  
  if(whichUser == -1){
    adjustment = 0;
  }
  else{
    adjustment = userList.get(whichUser).timeAdjust;
  
  }
  
  int m = minute();  // Values from 0 - 59
  int h = hour() + adjustment;    // Values from 0 - 23
  if(h > 24){
    h = h-24;
  }
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
 newUserButton = new CircleButton(int(index+profileButtonX+(2*(canvasWidth/100))),temp.y_Axis+(profileButtonY/2), profileButtonY, profileButtonY);

}

int stringToSec(String givenTime){
  int mten = parseInt(givenTime.substring(0,1));
  int mOne = parseInt(givenTime.substring(1,2));
  int sTen = parseInt(givenTime.substring(2,3));
  int sOne = parseInt(givenTime.substring(3,4));
  int total  = (mten*600)+(mOne*60)+(sTen*10)+sOne;
  return total;
  
}

boolean nameExist(String checkName){
  
  for(int i = 0;i <storeName.size();i++){
    if(storeName.get(i).equals(checkName)){
      return true;
    }
    
  } 
  return false;
}


void repeat(){
  audio.play();
}

void next(){
  current++;
  int track = current%(songNames.size());
  println(track);
  audio.setAttribute("src",songNames.get(current%(songNames.size()))+fileExt);
  audio.play();
}

void previous(){
  println(audio.currentTime);
  if(audio.currentTime < 2){
    current--;
    if(current < 0){
      current = songNames.size()-1;
    }
    int track = current%(songNames.size());
    println(track);
    audio.setAttribute("src",songNames.get(current%(songNames.size()))+fileExt);
    audio.play();
  }
  else{
    audio.setAttribute("src",songNames.get(current%(songNames.size()))+fileExt);
    audio.play();
  }
  
}


int findByFunction(ArrayList<Button> user ,int idx){
  
  
  for(int i = 0; i<user.size();i++){
    Button temp = user.get(i);
    if(temp.function == idx){
      return i;
    }
  }
  // cant find it
  return -1;
}


int findMenuByFunction(ArrayList<menuButton> user ,int idx){
  
  
  for(int i = 0; i<user.size();i++){
    menuButton temp = user.get(i);
    if(temp.func == idx){
      return i;
    }
  }
  // cant find it
  return -1;
}

//Classes
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// class use for icon buttons
class Button{
  int x_Axis;
  int y_Axis;
  int x_image;
  int y_image;
  int width;
  int height;
  int function;
  String buttonMessage = "";
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
  void setButtonMessage(String input) {
    buttonMessage = input;
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
  int passedTime;
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
            hs1.sposPercentageAdjust(userList.get(whichUser).iconAdjust);
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
            
              addProfileButton(profile,profileButtonX,profileButtonY,numberOfUser);
              User temp = new User(inputName,pin,gobal_buttonX,gobal_buttonY);
              userList.add(temp);
              storeName.add(inputName);
              stage = 1;
              iskeyboard = true;
              inputName = "";
              numberOfUser++;
            }
            else{
              wrongConfirmPin = true;
            }
            stage4Part = 1;
          }
         
          
        }
        else if (stage == 3){
        
          timerString = pin;
          timerInput = false;
        
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
    Button temp = new Button(x,y,w,h,f);
    clickable.add(temp);
   
  }
  void PopupAddClickable(String file, int x, int y , int w , int h, int f){
    // x and y is the location with respect to the popup
    Button temp = new Button(file, x,y,w,h,f);
    clickable.add(temp);
   
  }
  
  void changeImage(String str){
    img = loadImage(str);
  
  }
}

class User{
  int buttonX;
  int buttonY;
  String name;
  ArrayList<Button> buttonSet = new ArrayList<Button>();
  ArrayList<menuButton> menuSet = new ArrayList<menuButton>();
  
  Button hid;
 
  
  
  //Saved Setting info
  ////////////////////////
  
  float iconAdjust = 0.5;
  int timeAdjust = 0;
  boolean isEnglish = true;
  
  ////////////////////////
  // some buttons

  String pin;
  
  // Change to gobal variable instead
  //boolean isHidden;
  
  User(String usr, String pass,int x, int y){
    buttonX = x;
    buttonY = y;
    name = usr;
    pin = pass;
    hid = new Button("Data/hide_icon.png", int((canvasWidth - buttonX) - ((canvasWidth/100) *2)),int((canvasHeight- buttonY) - ((canvasHeight/100) *2)),buttonX,buttonY,-1);
    //isHidden = false;
    //Create the Default buttons
    ///////////////////////////////////////////////////
    
    //Menu button
    Button temp = new Button("Data/menu_icon.png", int((canvasWidth/100)*50.5), int((canvasHeight/100)*90) ,int(buttonX * iconAdjust),int(buttonY * iconAdjust),1);
    buttonSet.add(temp);
    
    //setting button
    temp = new Button("Data/settings_icon.png", int((canvasWidth/100)*49.5 - buttonX), int((canvasHeight/100)*90) ,int(buttonX * iconAdjust),int(buttonY * iconAdjust),0);
    buttonSet.add(temp);

    int localX = 30;
    int localY = 33;
    ///////////////////////////////////////////////////
    
    //Menu buttons
    //////////////////////////////////////////////////
    //menuButton(int ix, int iy, int iw, int ih, String ibase, String idown, int f) 
    // rect((canvasWidth/100)*40,(canvasHeight/100)*60,(canvasWidth/100)*20,(canvasWidth/100)*10);
    menuButton menuTemp;

    
      //userList.get(0).addButton("Data/weather_icon.png",4); //weather
    menuTemp = new menuButton(menuXaxis+100 + localX*4,menuYaxis+40,localX*2,localY*2,"Data/weather_icon_unselected.png","Data/weather_icon_selected.png", 4);
    menuSet.add(menuTemp);
      //userList.get(0).addButton("Data/news_icon.png",5); //article
      
    menuTemp = new menuButton(menuXaxis+130 + localX*6,menuYaxis+40,localX*2,localY*2,"Data/news_icon_unselected.png","Data/news_icon_selected.png", 5);
    menuSet.add(menuTemp);
      //userList.get(0).addButton("Data/facebook_icon.png",6); //facebook
      

   
      //userList.get(0).addButton("Data/music_icon.png", 8); //Music
    menuTemp = new menuButton(menuXaxis+70 + localX*2,menuYaxis+80 + localY*2,localX*2,localY*2,"Data/music_icon_unselected.png","Data/music_icon_selected.png", 8);
   menuSet.add(menuTemp);  
   
   
    menuTemp = new menuButton(menuXaxis+100 + localX*4,menuYaxis+80 + localY*2,localX*2,localY*2,"Data/cal_icon_unselected.png","Data/cal_icon_selected.png", 9);
   menuSet.add(menuTemp);  
   
    menuTemp = new menuButton(menuXaxis+130 + localX*6,menuYaxis+80 + localY*2,localX*2,localY*2,"Data/stopwatch-tool_unselected.png","Data/stopwatch-tool_selected.png", 10);
   menuSet.add(menuTemp);  
    
    //////////////////////////////////////////////////
    
    if(!(name.equals("Guest"))){
      menuTemp = new menuButton(menuXaxis+40,menuYaxis+40,localX*2,localY*2,"Data/9gag_icon_unselected.png","Data/9gag_icon_selected.png", 2);
      menuSet.add(menuTemp);
        //userList.get(0).addButton("Data/health_icon.png",3); //health
      menuTemp = new menuButton(menuXaxis+70 + localX*2,menuYaxis+40,localX*2,localY*2,"Data/health_icon_unselected.png","Data/health_icon_selected.png", 3);
      menuSet.add(menuTemp);
      
      menuTemp = new menuButton(menuXaxis+160 + localX*8,menuYaxis+40,localX*2,localY*2,"Data/facebook_icon_unselected.png","Data/facebook_icon_selected.png", 6);
      menuSet.add(menuTemp);
        //userList.get(0).addButton("Data/twitter_icon.png", 7); //Twiter
      menuTemp = new menuButton(menuXaxis+40,menuYaxis+80 + localY*2,localX*2,localY*2,"Data/twitter_icon_unselected.png","Data/twitter_icon_selected.png", 7);
      menuSet.add(menuTemp);   
    }
    
  }
 
 
  
 void addButton(String file, int f){
   
   
   for(int i= 0;i<buttonSet.size();i++){
     buttonSet.get(i).width = int(buttonX* iconAdjust);
     buttonSet.get(i).height = int(buttonX* iconAdjust);
     
   }
   
   // odd number of functions before add new
   if(buttonSet.size()%2 == 1){
     
     Button temp; 
     Button temp2; 
     temp = new Button(file, 0, int((canvasHeight/100)*90) ,int(buttonX* iconAdjust),int(buttonX* iconAdjust),f);
     buttonSet.add(1,temp);
     temp = buttonSet.get(0);
     temp.changeX(int((canvasWidth/100)*50.5));
     
     
     temp = buttonSet.get(1);
     temp.changeX(int(((canvasWidth/100)*49.5) - int(buttonX* iconAdjust)));
     
     int tempx = int(((canvasWidth/100)*49.5)- int(buttonX* iconAdjust));
  
     for (int i=2; i < buttonSet.size(); i = i+2){
        tempx = tempx - int(buttonX* iconAdjust + (canvasWidth/100));
     }
     temp = buttonSet.get(0);
     temp.changeX(tempx);
     for (int i=1; i < buttonSet.size(); i++){
       temp = buttonSet.get(i);
       temp.changeX(tempx +(i* int((buttonX* iconAdjust) + (canvasWidth/100))));
       
     }
     
     
     
     
   }
   // even number of functions before add new
   else{
     Button temp; 
     Button temp2; 
     temp = new Button(file, 0, int((canvasHeight/100)*90) ,int(buttonX* iconAdjust),int(buttonY* iconAdjust),f);
     buttonSet.add(1,temp);
     temp = buttonSet.get(0);
     temp.changeX(int((canvasWidth/100)*49.9)-(int(buttonX* iconAdjust)/2));
     int tempx = int((canvasWidth/100)*49.9)-(int(buttonX* iconAdjust)/2);
     
     for (int i=1; i < buttonSet.size(); i = i+2){
        //temp  = buttonSet.get(i);
        //temp2 = buttonSet.get(i+1);
        tempx = tempx  - int((buttonX* iconAdjust) +   (canvasWidth/100));
        
        //temp.changeX( ((buttonSet.get(i-1)).x_Axis) - int(buttonX + (canvasWidth/100)) );
        //temp2.changeX( ((buttonSet.get(i-1)).x_Axis) + int(buttonX + (canvasWidth/100)) );
        
     }
     temp = buttonSet.get(0);
     temp.changeX(tempx);
     for (int i=1; i < buttonSet.size(); i++){
       temp = buttonSet.get(i);
       temp.changeX(tempx +(i* int((buttonX* iconAdjust) + (canvasWidth/100))));

     }
   }
      
  }
  void adjustButton(){
    
    if(buttonSet.size()%2 == 1){
      Button temp;
      int tempx = int((canvasWidth/100)*49.9)-(int(buttonX* iconAdjust)/2);
     
     for (int i=1; i < buttonSet.size(); i = i+2){
        //temp  = buttonSet.get(i);
        //temp2 = buttonSet.get(i+1);
        tempx = tempx  - int((buttonX* iconAdjust) + (canvasWidth/100));
        
        //temp.changeX( ((buttonSet.get(i-1)).x_Axis) - int(buttonX + (canvasWidth/100)) );
        //temp2.changeX( ((buttonSet.get(i-1)).x_Axis) + int(buttonX + (canvasWidth/100)) );
        
     }
     temp = buttonSet.get(0);
     temp.changeX(tempx);
     for (int i=1; i < buttonSet.size(); i++){
       temp = buttonSet.get(i);
       temp.changeX(tempx +(i* int((buttonX* iconAdjust) + (canvasWidth/100))));

     }
    
    }
    else{
      Button temp; 
      int tempx = int(((canvasWidth/100)*49.5)- int(buttonX* iconAdjust));
    
       for (int i=2; i < buttonSet.size(); i = i+2){
          tempx = tempx - int(buttonX* iconAdjust + (canvasWidth/100));
       }
       temp = buttonSet.get(0);
       temp.changeX(tempx);
       for (int i=1; i < buttonSet.size(); i++){
         temp = buttonSet.get(i);
         temp.changeX(tempx +(i* int((buttonX* iconAdjust) + (canvasWidth/100))));
         
       }
    }
  }
  
  
  void removeButton(int func){

   // odd number of functions before add new
   if(buttonSet.size()%2 == 1){
     
     Button temp; 
     int idx = findByFunction(buttonSet,func);
     buttonSet.remove(idx);
     temp = buttonSet.get(0);
     int tempx = int(((canvasWidth/100)*49.5)- buttonX);
  
     for (int i=2; i < buttonSet.size(); i = i+2){
        tempx = tempx - int(buttonX* iconAdjust + (canvasWidth/100));
     }
     temp = buttonSet.get(0);
     temp.changeX(tempx);
     
     for (int i=1; i < buttonSet.size(); i++){
       temp = buttonSet.get(i);
       temp.changeX(tempx +(i* int(buttonX* iconAdjust +(canvasWidth/100))));
    
     }
   }
   // even number of functions before add new
   else{
     Button temp; 
     int idx = findByFunction(buttonSet,func);
     buttonSet.remove(idx);

     int tempx = int((canvasWidth/100)*49.9)-(buttonX/2);
     
     for (int i=1; i < buttonSet.size(); i = i+2){
        tempx = tempx  - int(buttonX* iconAdjust +(canvasWidth/100));
     }
     temp = buttonSet.get(0);
     temp.changeX(tempx);
     for (int i=1; i < buttonSet.size(); i++){
       temp = buttonSet.get(i);
       temp.changeX(tempx +(i* int(buttonX* iconAdjust +(canvasWidth/100))));
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
      isPressed = true;

    } else if (isOver){
     
      currentimage = roll;
      if(isPressed == true)
      {
      isPressed = false; 
      if(number == "back" && keyFlag > 0)
      {  
        if(keyFlag > 1) //Do it before drawing the value as you want to draw out the value from -1
        {
        eraseKey = keyTracker.substring (keyTracker.length()-1, keyTracker.length());
        keyTracker = keyTracker.substring(0, keyTracker.length() - 1);

        }
        if(keyFlag == 1) //Have to do it afterwards because theres only 1 value you're overwriting then you erase
        {
        eraseKey = keyTracker.substring (0, keyTracker.length());
        keyTracker = keyTracker.substring(0, keyTracker.length()-1);
        }

        keySpace = keySpace - (int)textWidth(eraseKey);

        keyFlag = keyFlag-1;

      }
      else if(keyFlag < 20 && number != "back" && number != "go" && number != " " && number != ".com")
      {                 
   
        keyRep = keyRep + number;

        keySpace = keySpace + (int)textWidth(number);
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
        if(stage == 4){ 
          if(keyFlag < 1){
          
          
          }
          else if(nameExist(keyTracker) == true){
          
            inputName  = "";
            keyFlag = 0;
            keyTracker = "";
            keyRep = "";
            keySpace = 0;
            nameInUse = true;
            iskeyboard = true;
          }
          else{
            inputName  = keyTracker;
            keyFlag = 0;
            keyTracker = "";
            keyRep = "";
            keySpace = 0;
             nameInUse = false;
            iskeyboard = false;
          }
        }
        if(stage == 3){
            calenderNote  = keyTracker;
            keyFlag = 0;
            keyTracker = "";
            keyRep = "";
            keySpace = 0;
            calenderInput = false;
            setCalText(currentButton);
            
        }
        
        
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

  void HscrollbarLocationUpdate(int xp, int yp){
     
     spos = spos + (xp - xpos);
     xpos = xp;
     ypos = yp-sheight/2;
     
     newspos = spos;
     sposMin = xpos;
     sposMax = xpos + swidth - sheight;
     
     
  }
  
  void sposPercentageAdjust(float x){
     
    spos = (swidth  * x) + xpos;
    newspos = spos;
   
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

    //fill(159, 188, 234);
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

//class menuButton{
//  boolean inUse = false;
//  PImage selected;
//  PImage unSelected;
//  int func;
  
  
//  menuButton(String unchecked, String checked,int f){
//    selected = loadImage(checked);
//    unSelected = loadImage(unchecked);
//    func = f;
//  }


//}


class menuButton extends PinButton 

{

  PImage base;

  PImage roll;

  PImage down;

  PImage currentimage;
  
  int func;
  
  boolean inUse = false;

  menuButton(int ix, int iy, int iw, int ih, String ibase, String idown, int f) 

  {

    x = ix;

    y = iy;

    w = iw;

    h = ih;

    base = loadImage(ibase);

    down = loadImage(idown);

    currentimage = base;
    
    func = f;

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
     
      if(isPressed == true)
      {
        isPressed = false; 
        inUse = !inUse;
        if(inUse == true && inSetup == false){
          User usr = userList.get(whichUser);
           currentimage = down;
          if(func == 2){
            usr.addButton("Data/9gag_icon.png",2);
          }
          if(func == 3){
            usr.addButton("Data/health_icon.png",3);
          }
          if(func == 4){
            usr.addButton("Data/weather_icon.png",4);
          }
          if(func == 5){
            usr.addButton("Data/news_icon.png",5);
          }
          if(func == 6){
            usr.addButton("Data/facebook_icon.png",6);
          }
          if(func == 7){
            usr.addButton("Data/twitter_icon.png",7);
          }
          if(func == 8){
            usr.addButton("Data/music_icon.png",8);
          }
          if(func == 9){
            usr.addButton("Data/cal_icon.png",9);
          }
          if(func == 10){
            usr.addButton("Data/Timer_icon.png",10);
          }
          
        }


        else if(inUse == false && inSetup == false){
         
          currentimage = base;
          User usr = userList.get(whichUser);
          usr.removeButton(func);
          
        }
      }
    } 


  }

  

  void over() 

  {
    
    if( overRect(x, y, w, h) ) {

      isOver = true;
     
    } else {
      
      isOver = false;

    }

  }

  

  void display() 

  {
    //rect(x,y,w,h);  
    image(currentimage, x, y, w, h);
    //console.log("DEBUG 0");
  }

}


class SettingImageButtons extends PinButton 

{

  PImage base;

  PImage roll;

  PImage down;

  PImage currentimage;
  
  int number = 0;


  SettingImageButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown, int num) 

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
      }
    } else {
    
      currentimage = base;

    }

  }

  

  void over() 

  {
    

    if( overRect(x, y, w, h) ) {

      isOver = true;
     
    } else {
      
      isOver = false;

    }

  }

  void languageText(){
      fill(0);  
      textSize(24);
      textAlign(LEFT);
      if(userList.get(whichUser).isEnglish == true){
        text("Select Language by touching the Flag", (int)canvasWidth/2 - 200, (int)canvasHeight/2 + 230);
      }
      else{
        text("Seleccione Idioma tocando la Bandera", (int)canvasWidth/2 - 200, (int)canvasHeight/2 + 230);
      }

      
      textSize(18);
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
      textSize(24);
  }
  
  void timeText(){
      textSize(30);
      fill(0);  
      if(userList.get(whichUser).isEnglish == true){
        text("Select Time Zone", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 230);
      }
      else{
        text("Selecciona la zona horaria", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 230);
      }
      fill(102);
      rect((int)canvasWidth/2 - 230, (int)canvasHeight/2 + 300, 330, 30);
      fill(0);
      textSize(20);
  
  }
  
  void newsText(){
    fill(0);  
    textSize(20);
    textAlign(LEFT);

    if(userList.get(whichUser).isEnglish == true){
      text("Select your filter for the News Feed", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 230);
    }
    else{
      text("Seleccione su filtro para el feed de noticias", (int)canvasWidth/2 - 220, (int)canvasHeight/2 + 230);
    }
    fill(102);
    rect((int)canvasWidth/2 - 30, (int)canvasHeight/2 + 260, 100, 40);
    fill(0);
    
    if(userList.get(whichUser).isEnglish == true){
      text("Added:", (int)canvasWidth/2 - 10, (int)canvasHeight/2 + 290);  
    }
    else{
      text("Adicional:", (int)canvasWidth/2 - 10, (int)canvasHeight/2 + 290);
    }
  }
  
  
  void wifiText(){
    fill(0);  
    textSize(20);
    textAlign(LEFT);
    text("WiFI", (int)canvasWidth/2 - 105, (int)canvasHeight/2 + 220);
    if(userList.get(whichUser).isEnglish == true){
      text("Other Networks...", (int)canvasWidth/2 - 165, (int)canvasHeight/2 + 325);
    }
    else{
      text("Otras Redes...", (int)canvasWidth/2 - 165, (int)canvasHeight/2 + 325);
    }

    
  }
  
  void changePopupLanguage(){
    //change the calender
    if(userList.get(whichUser).isEnglish == true){
      Popup  temp = popups.get(9);
      temp.changeImage("Data/AprilEng.png");
    }
    else{
      Popup  temp = popups.get(9);
      temp.changeImage("Data/AprilSpn.png");
    }

    
  
  }

  void display() 

  {
    //if(number == 0)
    //{
    //image(currentimage, x, y, w, h);
    //}
    if(displayFlag == 1)
    {
        fill(0); 
        textAlign(CENTER);
        if(userList.get(whichUser).isEnglish == true){
          text("Select icon size", settingXaxis + (settingWidth/2) , settingYaxis + 50);
        }
        else{
          text("Seleccionar el tamaño del icono", settingXaxis + (settingWidth/2) , settingYaxis + 50);
        }

    }
    if(displayFlag == 2)
    {
      fill(102);
      rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
      fill(0);  
      text("Bluetooth", (int)canvasWidth/2 - 20, (int)canvasHeight/2 + 280);  
      stroke(0);
      fill(102);
      rect((int)canvasWidth/2 - 140, (int)canvasHeight/2 + 320, 220, 60);
      fill(0);
      text("HTC One", (int)canvasWidth/2 - 20, (int)canvasHeight/2 + 360);
      bluetooth.resize(23,20);
      image(bluetooth, (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 338);
    }
    if(displayFlag == 3)
    {
      timeText();
    }
     if(displayFlag == 4)
    {
      fill(102);
      rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
      fill(0);  
      text("Bluetooth", (int)canvasWidth/2 - 20, (int)canvasHeight/2 + 280);  
      stroke(0);
      fill(102);
      rect((int)canvasWidth/2 - 140, (int)canvasHeight/2 + 320, 220, 60);
      fill(0);
      text("HTC One", (int)canvasWidth/2 - 20, (int)canvasHeight/2 + 360);
      bluetooth.resize(23,20);
      image(bluetooth, (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 338);
    }
    if(displayFlag == 5)
    {
      fill(102);
      rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
      fill(0);  
      text("Bluetooth", (int)canvasWidth/2 - 20, (int)canvasHeight/2 + 280);  
      stroke(0);
      fill(102);
      rect((int)canvasWidth/2 - 140, (int)canvasHeight/2 + 320, 220, 60);
      fill(0);
      text("HTC One", (int)canvasWidth/2 - 20, (int)canvasHeight/2 + 360);
      bluetooth.resize(23,20);
      image(bluetooth, (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 338);
    }
    if(displayFlag == 6)
    {
      timeText();
      userList.get(whichUser).timeAdjust = -2;
      if(userList.get(whichUser).isEnglish == true){
        text("Time changed to Pacific Zone Time", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 320);
      }
      else{
        text("El tiempo cambió a Hora de la zona del Pacífico", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 320);
      }
      
 
    }
    if(displayFlag == 7)
    {
      timeText();
      userList.get(whichUser).timeAdjust = 0;
      if(userList.get(whichUser).isEnglish == true){
        text("Time changed to Central Zone Time", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 320);
      }
      else{
        text("La hora cambió a Hora de Zona Central", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 320);
      }
      
    }
    if(displayFlag == 8)
    {
      timeText();
      userList.get(whichUser).timeAdjust = 1;
      if(userList.get(whichUser).isEnglish == true){
        text("Time changed to Eastern Zone Time", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 320);
      }
      else{
        text("El tiempo cambió a Hora de Zona Oriental", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 320);
      }
    }
    if(displayFlag == 9)
    {
      timeText();
      userList.get(whichUser).timeAdjust = -1;
      if(userList.get(whichUser).isEnglish == true){
        text("Time changed to Mountain Zone Time", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 320);
      }
      else{
        text("El tiempo cambió a Hora de la Zona de Montaña", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 320);
      }
      
    }
    if(displayFlag == 10)
    {
      fill(0);
      if(userList.get(whichUser).isEnglish == true){
        text("Personalization", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 180);
      }
      else{
        text("Personalización", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 180);
      }
      
    }
    //Doesnt work
    if(displayFlag == 11)
    {
      fill(102);
      rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
      fill(0);  
      if(userList.get(whichUser).isEnglish == true){
        text("Enter Name", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 230);
      }
      else{
        text("Ingrese su nombre", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 230);
      }
      
    }
    //Doesnt work
    if(displayFlag == 12)
    {
      fill(102);
      rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
      fill(0);  
      if(userList.get(whichUser).isEnglish == true){
        text("Enter your Pin number", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 230);
      }
      else{
        text("Ingrese su número PIN", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 230);
      }
      
    }
    if(displayFlag == 13)
    {
        fill(0); 
        textAlign(CENTER);
        //text("Select icon size", settingXaxis + (settingWidth/2) , settingYaxis + 50);
        //println("Debug 0");
        stage = 1;
        whichUser = -1;
        displayFlag = 0;
        settingFlag = 0;
        boxInUse = false;
    }
    if(displayFlag == 14)
    {
      languageText();
    }
    if(displayFlag == 15 )
    {
      languageText();
      text("Language changed to Arabic", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
    } 
    if(displayFlag == 16 )
    {
      //deutsch
      languageText();
      text("Language changed to Deutsch", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      
    }
    if(displayFlag == 17 )
    {
      //dutch
      languageText();
      text("Language changed to Dutch", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      
    }
    if(displayFlag == 18 )
    {
      //english
      languageFlag = 0;
      userList.get(whichUser).isEnglish = true;
      languageText();
      changePopupLanguage();
      text("Language changed to English", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      
    }
    if(displayFlag == 19 )
    {
      //spanish
      languageFlag = 1;
      userList.get(whichUser).isEnglish = false;
      changePopupLanguage();
      languageText();
      text("Idioma cambiado a español", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      
    }
    if(displayFlag == 20 )
    {
      //french
      languageText();
      text("Language changed to French", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
     
    }
    if(displayFlag == 21 )
    {
      //italian
      languageText();
      text("Language changed to Italian", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      
    }
    if(displayFlag == 22 )
    {
      //japanese
      languageText();
      text("Language changed to Japanese", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
     
    }
    if(displayFlag == 23 )
    {
      //norwegian
      languageText();
      text("Language changed to norwegian", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
     
    }
    if(displayFlag == 24 )
    {
      languageText();
      text("Language changed to Polish", (int)canvasWidth/2 - 180, (int)canvasHeight/2 + 270);
      
    }
    if(displayFlag == 25)
    {
      newsText();
    }
    if(displayFlag == 26)
    {
    filterFlag1 = 1; //add
    //set filter1(gaming) to on
    //filterFlag1 = 1; 
    newsText();
    
    }
    if(displayFlag == 27)
    {
      filterFlag2 = 1; //add
       //set filter2(Business) to on
      //filterFlag2 = 1;
      newsText();
    
    }
    if(displayFlag == 28)
    {
    filterFlag3 = 1; //add
    //filterFlag3 = 1; //set filter3(Politics) to on
    newsText();
    }
    if(displayFlag == 29)
    {
    filterFlag4 = 1; //add
    //filterFlag4 = 1; //set filter4(Technology) to on
    newsText();
    }
    if(displayFlag == 30)
    {
     //removeFilter1
    filterFlag1 = 0;
    newsText();
    }
    if(displayFlag == 31)
    {
     //removeFilter2
    filterFlag2 = 0;
    newsText();
    }
    if(displayFlag == 32)
    {
     //removeFilter3
    filterFlag3 = 0;
    newsText();
    }
    if(displayFlag == 33)
    {
     //removeFilter4
    filterFlag4 = 0;
    newsText();
    }
    if(displayFlag == 34)
    {
    //location
    fill(102);
    rect(settingXaxis,settingYaxis,settingWidth,settingHeight);
    fill(0);  
    textSize(20);
    //text("Location", (int)canvasWidth/2 - 130, (int)canvasHeight/2 + 280);
    //Change String in next box
    
    if(userList.get(whichUser).isEnglish == true){
      text("Current Location:" + locationDefault, (int)canvasWidth/2 - 35, (int)canvasHeight/2 + 240);  
    }
    else{
      text("Ubicación actual:" + locationDefault, (int)canvasWidth/2 - 35, (int)canvasHeight/2 + 240);
    }
    //text("Enter your Location using the Keyboard", (int)canvasWidth/2 - 40, (int)canvasHeight/2 + 290);
    }
    if(displayFlag == 35)
    {
    //Transperency
    //fill(102);
    textFont(f);
    textSize(20);
    
    if(userList.get(whichUser).isEnglish == true){
      text("Transperency", (int)canvasWidth/2 - 145, (int)canvasHeight/2 + 230);  
    }
    else{
      text("Transparencia", (int)canvasWidth/2 - 145, (int)canvasHeight/2 + 230);
    }
    
    }
    if(displayFlag == 36)
    {
    //WiFI
    wifiText();
    }
    if(displayFlag == 37)
    {
    //clicked WiFI on to turn it off
    wifiFlag = 1;
    wifiText();
    }
    if(displayFlag == 38)
    {
    //clicked WiFI off to turn it on
    wifiFlag = 0;
    wifiText();
    }
    if(displayFlag == 39)
    {
    //clicked on uicWifi do nothing because its default
    wifiText();
    }
    if(displayFlag == 40)
    {
    //clicked on uicWifi2
    wifiText();
    }
    if(displayFlag == 41)
    {
    //clicked on uicWifi3
    wifiText();
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