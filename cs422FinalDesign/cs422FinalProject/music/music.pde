
class HScrollbar

{

  int swidth, sheight;    // width and height of bar

  int xpos, ypos;         // x and y position of bar

  float spos, newspos;    // x position of slider

  int sposMin, sposMax;   // max and min values of slider

  int loose;              // how loose/heavy

  boolean over;           // is the mouse over the slider?

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

    if(over()) {

      over = true;

    } else {

      over = false;

    }

    if(mousePressed && over) {

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



  boolean over() {

    if(mouseX > xpos && mouseX < xpos+swidth &&

    mouseY > ypos && mouseY < ypos+sheight) {

      return true;

    } else {

      return false;

    }

  }



  void display() {

    fill(255);

    rect(xpos, ypos, swidth, sheight);

    if(over || locked) {

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



//make a new HTML5 audio object named audio
Audio audio = new Audio();
// make string that will house the audio extension


HScrollbar   hs1 = new HScrollbar(0, 20, width, 10, 1);

HScrollbar  hs2 = new HScrollbar(0, height-20, width, 10, 1);


String fileExt;

//make a variable for volume and set it to 0
//(volume runs between 0 and 1)
float vol=0;
bool fadeOut=false;

int col=0;
ArrayList<String> songNames = new ArrayList<String>();
int current = 0;

void setup(){
  size(300,300);
  noStroke(); 
  
  String temp  = "snow";
  songNames.add("groove");
  songNames.add(temp);

  //this checks to see what type of audio the browser can play
  //then assigns that file extension to our string
  fileExt = ".mp3";
  //loads the audio file and appends the file extension
  audio.setAttribute("src",songNames.get(current)+fileExt);
  //this adds a listener to see when the file has finished playing
  //then calls a function that we named "repeat"
  audio.addEventListener("ended",next);
  //play the audio
  audio.play();
  audio.volume=constrain(vol,0,1);
  
  
}

void draw(){
  background(220);
  //constrain the R value between 0 and 255
  fill(constrain(col,0,255),0,0);
  ellipse(width/2,height/2,150,150);
  ellipse(width-30,height-30,30,30);
  ellipse(30,height-30,30,30);
  //constrain the audio level between 0 and 1
  audio.volume=constrain(vol,0,1);
  //fade the volume and color out at the same rate
  
  
  //hs1.update();

  //hs2.update();

  //hs1.display();

  //hs2.display();
  
}


void mouseReleased(){
  //turn fadeout on
  fadeOut=!fadeOut;
  if (dist(mouseX,mouseY,width/2,height/2)<150/2){
    
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
  if(dist(mouseX,mouseY,width-30,height-30)<30/2){
    next();
    return;
  }
  if(dist(mouseX,mouseY,30,height-30)<30/2){
    previous();
    return;
  }
}

//function called by the event listener when audio tracks ends
//that loops the track
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





// All Examples Written by Casey Reas and Ben Fry

// unless otherwise stated.

/* @pjs preload="data/seedTop.jpg, data/seedBottom.jpg"; */