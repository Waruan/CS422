//Shanil Lobanwala PinCode


import static javax.swing.JOptionPane.*;
ImageButtons buttonstartupEnglish;
ImageButtons buttonstartupSpanish;
int buttonSize = 90;
float canvasWidth = 2732;
float canvasHeight = 1536;
int startuplanguageFlag = 0; // 1 for english, 2 for spanish
int startuplanguageX = (int)canvasWidth/2 - 120;
//(int)canvasWidth/2 - 340;
int startuplanguageX2 = (int)canvasWidth/2 - 20;
int startuplanguageY = (int)canvasHeight/2 + 390;
int flagWidth = 66;
int flagHeight = 32;
boolean isPressed = false;
PFont f;

// evl monitor size


// scale down for home monitors
//float canvasWidth = 1366;
//float canvasHeight = 768;


void setup()

{

  size(2732, 1536);
  
  //size(1366, 768);
  
  background(102, 102, 102);
  
  // Define and create image button

  PImage startupEnglish = loadImage("Data/english.jpg");
  PImage startupSpanish = loadImage("Data/spanish.jpg");
  

  
  int boardLeft1 = (int)canvasWidth/2 - 340;
  
  
  
  int boardyMiddle = (int)canvasHeight/2 + 390;
  
  
 
  buttonstartupEnglish = new ImageButtons(startuplanguageX, startuplanguageY, flagWidth, flagHeight, startupEnglish, startupEnglish, startupEnglish, "english");//done
  buttonstartupSpanish = new ImageButtons(startuplanguageX2, startuplanguageY, flagWidth, flagHeight, startupSpanish, startupSpanish, startupSpanish, "spanish");//done
  f = createFont("Arial",16,true);
  textSize(20);
  fill(0);
  text("Please Select Language", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 230);
}



void draw()

{
  buttonstartupEnglish.update();
  
  buttonstartupEnglish.display();
  
  buttonstartupSpanish.update();
  
  buttonstartupSpanish.display();
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

    } else if (isOver){
     
      currentimage = roll;
      if(isPressed == true)
      {
      isPressed = false; 
      if(number == "english")
      {
        startuplanguageFlag = 1;
      }
      if(number == "spanish")
      {
        startuplanguageFlag = 1;
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