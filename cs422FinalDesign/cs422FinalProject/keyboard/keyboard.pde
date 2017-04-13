//Shanil Lobanwala PinCode


import static javax.swing.JOptionPane.*;
ImageButtons buttonLowA;
ImageButtons buttonLowB;
ImageButtons buttonLowC;
ImageButtons buttonLowD;
ImageButtons buttonLowE;
ImageButtons buttonLowF;
ImageButtons buttonLowG;
ImageButtons buttonLowH;
ImageButtons buttonLowI;
ImageButtons buttonLowJ;
ImageButtons buttonLowK;
ImageButtons buttonLowL;
ImageButtons buttonLowM;
ImageButtons buttonLowN;
ImageButtons buttonLowO;
ImageButtons buttonLowP;
ImageButtons buttonLowQ;
ImageButtons buttonLowR;
ImageButtons buttonLowS;
ImageButtons buttonLowT;
ImageButtons buttonLowU;
ImageButtons buttonLowV;
ImageButtons buttonLowW;
ImageButtons buttonLowX;
ImageButtons buttonLowY;
ImageButtons buttonLowZ;
ImageButtons buttonBack;
int buttonSize = 90;
int pinFlag = 0;  //A flag that you keep to track how many buttons are pressed.
int pinSpace = 0; //The space of the stars when they are printed
String pin = ""; //Keeps track of the pins and stores them
String pinRep = ""; //Represents the stars in the pin and how many there are by storing the number
boolean isPressed = false;
PFont f;

// evl monitor size
float canvasWidth = 2732;
float canvasHeight = 1536;

// scale down for home monitors
//float canvasWidth = 1366;
//float canvasHeight = 768;


void setup()

{

  size(2732, 1536);

  background(102, 102, 102);
  
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
  
  int boardx1 = (int)canvasWidth/2 - 180;
  
  int boardx2 = (int)canvasWidth/2 - 80;

  int boardx3 = (int)canvasWidth/2 - 20;
  
  int boardx4 = (int)canvasWidth/2 + 160;
  
  int boardx5 = (int)canvasWidth/2 + 100;
  
  int boardx6 = (int)canvasWidth/2 + 40;
     
  int boardx7 = (int)canvasWidth/2 - 220;
  
  int boardx8 = (int)canvasWidth/2 - 280;
  
  int boardx9 = (int)canvasWidth/2 - 420;
  
  int boardx10 = (int)canvasWidth/2 + 260;
  
  int boardx11 = (int)canvasWidth/2 + 320;
  
  int boardy1 = (int)canvasHeight/2 + 380;
  
  int boardy2 = (int)canvasHeight/2 + 440;
  
  int boardy3 = (int)canvasHeight/2 + 500;
  
  int boardy4 = (int)canvasHeight/2 + 560;
  
  int boardy5 = (int)canvasHeight/2 + 640;
  
  int boardy6 = (int)canvasHeight/2 + 340;
  
  int keyboardWidth = 40;
  
  int backWidth = 80;
  
  int keyboardHeight = 40;

  buttonLowA = new ImageButtons(boardx2, boardy4, keyboardWidth, keyboardHeight, butA, butA, butA, "a");
  buttonLowB = new ImageButtons(boardx1, boardy1, keyboardWidth, keyboardHeight, butB, butB, butB, "b");
  buttonLowC = new ImageButtons(boardx2, boardy1, keyboardWidth, keyboardHeight, butC, butC, butC, "c");
  buttonLowD = new ImageButtons(boardx3, boardy1, keyboardWidth, keyboardHeight, butD, butD, butD, "d");
  buttonLowE = new ImageButtons(boardx7, boardy6, keyboardWidth, keyboardHeight, butE, butE, butE, "e");//done
  buttonLowF = new ImageButtons(boardx2, boardy2, keyboardWidth, keyboardHeight, butF, butF, butF, "f");
  buttonLowG = new ImageButtons(boardx3, boardy2, keyboardWidth, keyboardHeight, butG, butG, butG, "g");
  buttonLowH = new ImageButtons(boardx1, boardy3, keyboardWidth, keyboardHeight, butH, butH, butH, "h");
  buttonLowI = new ImageButtons(boardx5, boardy6, keyboardWidth, keyboardHeight, butI, butI, butI, "i"); //done
  buttonLowJ = new ImageButtons(boardx3, boardy3, keyboardWidth, keyboardHeight, butJ, butJ, butJ, "j");
  buttonLowK = new ImageButtons(boardx1, boardy4, keyboardWidth, keyboardHeight, butK, butK, butK, "k");
  buttonLowL = new ImageButtons(boardx3, boardy4, keyboardWidth, keyboardHeight, butL, butL, butL, "l");
  buttonLowM = new ImageButtons(boardx1, boardy5, keyboardWidth, keyboardHeight, butM, butM, butM, "m");
  buttonLowN = new ImageButtons(boardx2, boardy5, keyboardWidth, keyboardHeight, butN, butN, butN, "n");
  buttonLowO = new ImageButtons(boardx4, boardy6, keyboardWidth, keyboardHeight, butO, butO, butO, "o"); //done
  buttonLowP = new ImageButtons(boardx10, boardy6, keyboardWidth, keyboardHeight, butP, butP, butP, "p"); //done
  buttonLowQ = new ImageButtons(boardx9, boardy6, keyboardWidth, keyboardHeight, butQ, butQ, butQ, "q"); //done
  buttonLowR = new ImageButtons(boardx1, boardy6, keyboardWidth, keyboardHeight, butR, butR, butR, "r"); //done
  buttonLowS = new ImageButtons(boardx4, boardy4, keyboardWidth, keyboardHeight, butS, butS, butS, "s");
  buttonLowT = new ImageButtons(boardx2, boardy6, keyboardWidth, keyboardHeight, butT, butT, butT, "t");//done
  buttonLowU = new ImageButtons(boardx6, boardy6, keyboardWidth, keyboardHeight, butU, butU, butU, "u");//done
  buttonLowV = new ImageButtons(boardx7, boardy5, keyboardWidth, keyboardHeight, butV, butV, butV, "v"); //done
  buttonLowW = new ImageButtons(boardx8, boardy6, keyboardWidth, keyboardHeight, butW, butW, butW, "w"); //done
  buttonLowX = new ImageButtons(boardx7, boardy4, keyboardWidth, keyboardHeight, butX, butX, butX, "x");
  buttonLowY = new ImageButtons(boardx3, boardy6, keyboardWidth, keyboardHeight, butY, butY, butY, "y"); //done
  buttonLowZ = new ImageButtons(boardx9, boardy4, keyboardWidth, keyboardHeight, butZ, butZ, butZ, "z");
  buttonBack = new ImageButtons(boardx11, boardy6, backWidth, keyboardHeight, butBack, butBack, butBack, "back");
  f = createFont("Arial",16,true);
  textSize(20);
  //fill(102);
  rect((int)canvasWidth/2 - 115,(int)canvasHeight/2 + 270,95,40);
  fill(0);
  text("Please Enter Pin:", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 230);
 
}



void draw()

{
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
        text(number, (int)canvasWidth/2 - 100 + pinSpace, (int)canvasHeight/2 + 310);
        //(int)canvasWidth/2 % 2 + 630,(int)canvasHeight/3 - 25
        println(pinRep);    //Testing purpose
      }
      else if(pinFlag < 4 && number != "back" && number!= "ok")
      {                 
        fill(0);
        pinRep = pinRep + "*";
        textSize(40);
        text(number,(int)canvasWidth/2 - 100 + pinSpace,(int)canvasHeight/2 + 310);
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
        text("*",(int)canvasWidth/2 - 100 + pinSpace, (int)canvasHeight/2 + 310);
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