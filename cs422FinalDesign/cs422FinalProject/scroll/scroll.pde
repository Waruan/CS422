// All Examples Written by Casey Reas and Ben Fry

// unless otherwise stated.
class HScrollbar

{

  int swidth, sheight;    // width and height of bar

  int xpos, ypos;         // x and y position of bar

  float spos, newspos;    // x position of slider

  int sposMin, sposMax;   // max and min values of slider

  int loose;              // how loose/heavy

  boolean scollOver;           // is the mouse over the slider?

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



  void update() {

    if(over(xpos,ypos,swidth,sheight)) {

      scollOver = true;

    } else {

      scollOver = false;

    }

    if(mousePressed && scollOver) {

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

    }

  }



  int constrain(int val, int minv, int maxv) {

    return min(max(val, minv), maxv);

  }






  void display() {

    fill(255);

    rect(xpos, ypos, swidth, sheight);

    if(scollOver || locked) {

      fill(153, 102, 0);

    } else {

      fill(102, 102, 102);

    }

    rect(spos, ypos, sheight, sheight);

  }



  float getPos() {

    // Convert spos to be values between

    // 0 and the total width of the scrollbar

    return spos * ratio;

  }

}

HScrollbar hs1, hs2;




int topWidth, bottomWidth;  // The width of the top and bottom images





void setup()

{

  size(200, 200);

  noStroke();

  hs1 = new HScrollbar(0, 20, width, 10, 3*5+1);

  hs2 = new HScrollbar(0, height-20, width, 10, 3*5+1);



}



void draw()

{

  background(255);

  

  // Get the position of the top scrollbar

  // and convert to a value to display the top image 



  //fill(255);

  

  // Get the position of the bottom scrollbar

  // and convert to a value to display the bottom image


  //fill(255);


 

  hs1.update();

  hs2.update();

  hs1.display();

  hs2.display();

}

boolean over(int xpos,int ypos,int swidth,int sheight) {

    if(mouseX > xpos && mouseX < xpos+swidth &&

    mouseY > ypos && mouseY < ypos+sheight) {

      return true;

    } else {

      return false;

    }

}