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
PFont f;
int settingFlag = 0;
int displayFlag = 0;
int buttonX = 66 ;
int buttonY = 60;
// evl monitor size
float canvasWidth = 2732;
float canvasHeight = 1536;
float iconAdjust = 0.5;
 PImage but0;
// scale down for home monitors
//float canvasWidth = 1366;
//float canvasHeight = 768;
float slideOffset = (canvasWidth/2 - 220);
HScrollbar hs1 = new HScrollbar(int(slideOffset), (int)(canvasHeight/2 + 400), 350, 35, 1);

//HScrollbar hs2 = new HScrollbar(0, height-20, width, 10, 1);


void setup()

{

  size(2732, 1536);

  background(102, 102, 102);
  
  // Define and create image button

   but0 = loadImage("Data/pin0.png");
  
  but0.resize(buttonX, buttonY);
  
  PImage but1 = loadImage("Data/pin1.png");
  
  but1.resize(buttonX, buttonY);

  PImage but2 = loadImage("Data/pin2.png");
  
  but2.resize(buttonX, buttonY);

  PImage but3 = loadImage("Data/pin3.png");
  
  but3.resize(buttonX, buttonY);
  
  /*PImage but4 = loadImage("Data/pin4.png");
  
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
  
  */
  
  int x0 = (int)canvasWidth/2 - 100;
  
  
  //settingButtons
  //top row
  int x = (int)canvasWidth/2 - 180;
  
  int x2 = (int)canvasWidth/2 - 100;

  int x3 = (int)canvasWidth/2 - 20;
  
  int x4 = (int)canvasWidth/2 - 180;
  
  int x5 = (int)canvasWidth/2 - 100;
  
  int x6 = (int)canvasWidth/2 - 20;
  
  int x7 = (int)canvasWidth/2 - 180;
  
  int x8 = (int)canvasWidth/2 - 100;
  
  int x9 = (int)canvasWidth/2 - 20;
  
  int x10 = (int)canvasWidth/2 - 180;
  
  int x11 = (int)canvasWidth/2 - 20;
  
  int y0 = (int)canvasHeight/2 + 520;
  
  int y = (int)canvasHeight/2 + 340;
  
  int y4 = (int)canvasHeight/2 + 440;
  
  int y5 = (int)canvasHeight/2 + 440;
  
  int y6 = (int)canvasHeight/2 + 440;
  
  int y7 = (int)canvasHeight/2 + 480;
  
  int y8 = (int)canvasHeight/2 + 480;
  
  int y9 = (int)canvasHeight/2 + 480;
  
  int y10 = (int)canvasHeight/2 + 520;
  
  int y11 = (int)canvasHeight/2 + 520;

  int w0 = 66;

  int h0 = 30;
  
  button0 = new ImageButtons(x0, y0, int(buttonX*iconAdjust), int(buttonY*iconAdjust), but0, but0, but0, 0);
  button1 = new ImageButtons(x, y, int(buttonX*iconAdjust), int(buttonY*iconAdjust), but1, but1, but1, 1);
  button2 = new ImageButtons(x2, y, buttonX, buttonY, but2, but2, but2, 2);
  button3 = new ImageButtons(x3, y, buttonX, buttonY, but3, but3, but3, 3);
  /*button4 = new ImageButtons(x4, y4, w4, h4, but4, but4, butpin4Changed, "4");
  button5 = new ImageButtons(x5, y5, w5, h5, but5, but5, butpin5Changed, "5");
  button6 = new ImageButtons(x6, y6, w6, h6, but6, but6, butpin6Changed, "6");
  button7 = new ImageButtons(x7, y7, w7, h7, but7, but7, butpin7Changed, "7");
  button8 = new ImageButtons(x8, y8, w8, h8, but8, but8, butpin8Changed, "8");
  button9 = new ImageButtons(x9, y9, w9, h9, but9, but9, butpin9Changed, "9");
  buttonpinBack = new ImageButtons(x10, y10, w10, h10, butpinBack, butpinBack, butpinbackChanged, "back");
  buttonpinOk = new ImageButtons(x11, y11, w11, h11, butpinOk, butpinOk, butpinokChanged, "ok");*/
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
  
  button0.update();
   
  button0.display();
 

  //Selecting setting icons
  if(settingFlag == 1 && displayFlag == 0)
  {
   fill(102);
   
   rect((int)canvasWidth/2 - 215,(int)canvasHeight/2 + 320,300,200);
   
   button1.update();
   
   button1.display();
   
   button2.update();
   
   button2.display();
   
   button3.update();
   
   button3.display();
  }
  if(settingFlag == 1 && displayFlag == 1)
  {
    button1.update();
    
    button1.display();

    
    iconAdjust =  constrain(((hs1.spos - slideOffset)/(hs1.swidth-10)),0.25,1) ;
    //println( constrain((hs1.spos/(hs1.swidth-10)),0.25,1) );
   //float temp =  constrain(((hs1.spos-slideOffset)/(hs1.swidth-10)),0.25,1);
    println(iconAdjust);
    //println("Debug Xsize "+ buttonX); 
    //println("Debug Yize "+ buttonY); 
   // println("Debug adjust  pos"+ hs1.spos); 
    // println("Debug adjust wid"+ (hs1.swidth-10)); 
     
     noStroke();
     fill(0);
     rect(1200,800,buttonX*iconAdjust,buttonY*iconAdjust);
     rect(1200+ buttonX,800,buttonX*iconAdjust,buttonY*iconAdjust);
     button0.w= int(buttonX*iconAdjust);
     button0.h= int(buttonY*iconAdjust);
     hs1.update();
    
    hs1.display();
  
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
      //Brightness icon
      if(number == 1)
      {
        if(displayFlag == 1)
        {
        fill(0);  
        text("Change Brightness", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 280);
        //println("Debug 0");
        }
      }
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
    if(displayFlag == 1){

        
        fill(0);  
        text("Select Language", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 280);
        //println("Debug 0");
        
        
    }
    if(displayFlag != number)
    {
    image(currentimage, x, y, w, h);
    }
  }

}