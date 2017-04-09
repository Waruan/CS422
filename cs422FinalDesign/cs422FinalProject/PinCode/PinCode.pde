//Shanil Lobanwala PinCode


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

// evl monitor size
//float canvasWidth = 2732;
//float canvasHeight = 1536;

// scale down for home monitors
float canvasWidth = 1366;
float canvasHeight = 768;


void setup()

{

  size(1366, 768);

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



void draw()

{
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



class Button

{

  int x, y;

  int w, h;

  color basecolor, highlightcolor;

  color currentcolor;

  boolean isOver = false;

  boolean pressed = false;   

  

  
  
  void mousePressed() 
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

    } else if (isOver){
     
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
        textSize(40);
        fill(102);
        text("*", (int)canvasWidth/4 + 315 + pinSpace, (int)canvasHeight/3 + 45);
        println(pinRep);    //Testing purpose
      }
      else if(pinFlag < 4 && number != "back" && number!= "ok")
      {                 
        fill(0);
        pinRep = pinRep + "*";
        textSize(40);
        text("*",(int)canvasWidth/4 + 315 + pinSpace, (int)canvasHeight/3 + 45);
        pinSpace = pinSpace + 15;
        pin = pin + number;
        println(pin);  //Testing purpose
        pinFlag = pinFlag+1;
      }
      //if(number == "ok" && pinFlag < 4)
      //{
      //  showMessageDialog(null, "Pin requires four numbers!", "Alert", ERROR_MESSAGE);
      //}
      if(number == "ok" && pinFlag == 4)
      {
        //showMessageDialog(null, "PIN successfully added", "Info", INFORMATION_MESSAGE);
        textSize(40);
        fill(102);
        pinFlag = 0;
        pinSpace = 0;
        for(int i = 0; i < 4; i++)
        {
        text("*",(int)canvasWidth/4 + 315 + pinSpace,(int)canvasHeight/3 + 45);
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