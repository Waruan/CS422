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
void setup()

{

  size(640, 360);

  background(102, 102, 102);
  
  // Define and create image button

  PImage but0 = loadImage("Data/pin0.png");
  
  PImage but1 = loadImage("Data/pin1.png");

  PImage but2 = loadImage("Data/pin2.png");

  PImage but3 = loadImage("Data/pin3.png");
  
  PImage but4 = loadImage("Data/pin4.png");
  
  PImage but5 = loadImage("Data/pin5.png");
  
  PImage but6 = loadImage("Data/pin6.png");
  
  PImage but7 = loadImage("Data/pin7.png");
  
  PImage but8 = loadImage("Data/pin8.png");
  
  PImage but9 = loadImage("Data/pin9.png");
  
  PImage butpinBack = loadImage("Data/pinback.png");
  
  PImage butpinOk = loadImage("Data/pinok.png");
  
  PImage butpin0Changed = loadImage("Data/pin0changed.gif");
  
  PImage butpin1Changed = loadImage("Data/pin1changed.gif");
  
  PImage butpin2Changed = loadImage("Data/pin2changed.gif");
  
  PImage butpin3Changed = loadImage("Data/pin3changed.gif");
  
  PImage butpin4Changed = loadImage("Data/pin4changed.gif");
  
  PImage butpin5Changed = loadImage("Data/pin5changed.gif");
  
  PImage butpin6Changed = loadImage("Data/pin6changed.gif");
  
  PImage butpin7Changed = loadImage("Data/pin7changed.gif");
  
  PImage butpin8Changed = loadImage("Data/pin8changed.gif");
  
  PImage butpin9Changed = loadImage("Data/pin9changed.gif");
  
  PImage butpinbackChanged = loadImage("Data/pinbackchanged.gif");
  
  PImage butpinokChanged = loadImage("Data/pinokchanged.gif");
  
  int x0 = width/2 + buttonSize/2-100;
  
  int x = width/2 + buttonSize/2-230; 
  
  int x2 = width/2 + buttonSize/2-100;

  int x3 = width/2 + buttonSize/2+30;
  
  int x4 = width/2 + buttonSize/2-230;
  
  int x5 = width/2 + buttonSize/2-100;
  
  int x6 = width/2 + buttonSize/2+30;
  
  int x7 = width/2 + buttonSize/2-230;
  
  int x8 = width/2 + buttonSize/2-100;
  
  int x9 = width/2 + buttonSize/2+30;
  
  int x10 = width/2 + buttonSize/2-230;
  
  int x11 = width/2 + buttonSize/2+30;
  
  int y0 = height/2 + buttonSize/2+60;
  
  int y = height/2 + buttonSize/2-150;
  
  int y2 = height/2 + buttonSize/2-150;
  
  int y3 = height/2 + buttonSize/2-150;
  
  int y4 = height/2 + buttonSize/2-80;
  
  int y5 = height/2 + buttonSize/2-80;
  
  int y6 = height/2 + buttonSize/2-80;
  
  int y7 = height/2 + buttonSize/2-10;
  
  int y8 = height/2 + buttonSize/2-10;
  
  int y9 = height/2 + buttonSize/2-10;
  
  int y10 = height/2 + buttonSize/2+60;
  
  int y11 = height/2 + buttonSize/2+60;

  int w0 = but0.width;
  
  int w = but1.width;

  int w2 = but2.width;
  
  int w3 = but3.width;
  
  int w4 = but4.width;
  
  int w5 = but5.width;
  
  int w6 = but6.width;
  
  int w7 = but7.width;
  
  int w8 = but8.width;
  
  int w9 = but9.width;
  
  int w10 = butpinBack.width;
  
  int w11 = butpinOk.width;

  int h0 = but0.height;
  
  int h =  but1.height;

  int h2 = but2.height;
  
  int h3 = but3.height;
  
  int h4 = but4.height;
  
  int h5 = but5.height;
  
  int h6 = but6.height;
  
  int h7 = but7.height;
  
  int h8 = but8.height;
  
  int h9 = but9.height;
  
  int h10 = butpinBack.height;
  
  int h11 = butpinOk.height;

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
  rect(270,30,100,40);
  fill(0);
  text("Please Enter Pin:", 250, 20);
 
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

    image(currentimage, x, y);

  }

}