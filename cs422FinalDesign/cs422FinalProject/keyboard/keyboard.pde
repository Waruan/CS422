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
ImageButtons buttonGo;
ImageButtons buttonSpace;
int keyButtonSize = 90;
int keyFlag = 0;  //A flag that you keep to track how many buttons are pressed.
int keySpace = 0; //The space of the stars when they are printed
String keyTracker = ""; //Keeps track of the pins and stores them
String keyRep = ""; //Represents the stars in the pin and how many there are by storing the number
String eraseKey = "";
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
  buttonLowQ = new ImageButtons(boardLeft1, boardyTop, keyboardWidth, keyboardHeight, butQ, butQ, butQ, "q"); //done
  buttonLowW = new ImageButtons(boardLeft2, boardyTop, keyboardWidth, keyboardHeight, butW, butW, butW, "w"); //done
  buttonLowE = new ImageButtons(boardLeft3, boardyTop, keyboardWidth, keyboardHeight, butE, butE, butE, "e");//done
  buttonLowR = new ImageButtons(boardLeft4, boardyTop, keyboardWidth, keyboardHeight, butR, butR, butR, "r"); //done
  buttonLowT = new ImageButtons(boardLeft5, boardyTop, keyboardWidth, keyboardHeight, butT, butT, butT, "t");//done
  buttonLowY = new ImageButtons(boardLeft6, boardyTop, keyboardWidth, keyboardHeight, butY, butY, butY, "y"); //done
  buttonLowU = new ImageButtons(boardLeft7, boardyTop, keyboardWidth, keyboardHeight, butU, butU, butU, "u");//done
  buttonLowI = new ImageButtons(boardLeft8, boardyTop, keyboardWidth, keyboardHeight, butI, butI, butI, "i"); //done
  buttonLowO = new ImageButtons(boardLeft9, boardyTop, keyboardWidth, keyboardHeight, butO, butO, butO, "o"); //done
  buttonLowP = new ImageButtons(boardLeft10, boardyTop, keyboardWidth, keyboardHeight, butP, butP, butP, "p"); //done
  buttonBack = new ImageButtons(boardLeft11, boardyTop, backWidth, keyboardHeight, butBack, butBack, butBack, "back");
  //Second Row
  buttonLowA = new ImageButtons(boardLeft1+10, boardyMiddle, keyboardWidth, keyboardHeight, butA, butA, butA, "a");//done
  buttonLowS = new ImageButtons(boardLeft2+10, boardyMiddle, keyboardWidth, keyboardHeight, butS, butS, butS, "s");//done
  buttonLowD = new ImageButtons(boardLeft3+10, boardyMiddle, keyboardWidth, keyboardHeight, butD, butD, butD, "d");//done
  buttonLowF = new ImageButtons(boardLeft4+10, boardyMiddle, keyboardWidth, keyboardHeight, butF, butF, butF, "f");//done
  buttonLowG = new ImageButtons(boardLeft5+10, boardyMiddle, keyboardWidth, keyboardHeight, butG, butG, butG, "g");//done
  buttonLowH = new ImageButtons(boardLeft6+10, boardyMiddle, keyboardWidth, keyboardHeight, butH, butH, butH, "h");//done
  buttonLowJ = new ImageButtons(boardLeft7+10, boardyMiddle, keyboardWidth, keyboardHeight, butJ, butJ, butJ, "j");//done
  buttonLowK = new ImageButtons(boardLeft8+10, boardyMiddle, keyboardWidth, keyboardHeight, butK, butK, butK, "k");//done
  buttonLowL = new ImageButtons(boardLeft9+10, boardyMiddle, keyboardWidth, keyboardHeight, butL, butL, butL, "l");//done
  buttonGo = new ImageButtons(boardLeft10+10, boardyMiddle, backWidth, keyboardHeight, butGo, butGo, butGo, "go");
  //Third Row
  buttonLowZ = new ImageButtons(boardLeft1, boardyBottom, keyboardWidth, keyboardHeight, butZ, butZ, butZ, "z");
  buttonLowX = new ImageButtons(boardLeft2, boardyBottom, keyboardWidth, keyboardHeight, butX, butX, butX, "x");
  buttonLowC = new ImageButtons(boardLeft3, boardyBottom, keyboardWidth, keyboardHeight, butC, butC, butC, "c");
  buttonLowV = new ImageButtons(boardLeft4, boardyBottom, keyboardWidth, keyboardHeight, butV, butV, butV, "v"); //done
  buttonLowB = new ImageButtons(boardLeft5, boardyBottom, keyboardWidth, keyboardHeight, butB, butB, butB, "b");
  buttonLowN = new ImageButtons(boardLeft6, boardyBottom, keyboardWidth, keyboardHeight, butN, butN, butN, "n");//done
  buttonLowM = new ImageButtons(boardLeft7, boardyBottom, keyboardWidth, keyboardHeight, butM, butM, butM, "m");//done
  
  buttonSpace = new ImageButtons(boardLeft4, boardyLast, spaceBarWidth, keyboardHeight, butSpace, butSpace, butSpace, " ");
  
  f = createFont("Arial",16,true);
  textSize(20);
  fill(102);
  rect((int)canvasWidth/2 - 215,(int)canvasHeight/2 + 270,300,50);
  fill(0);
  text("Please Enter:", (int)canvasWidth/2 - 140, (int)canvasHeight/2 + 230);
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