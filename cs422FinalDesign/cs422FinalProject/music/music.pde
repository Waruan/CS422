//make a new HTML5 audio object named audio
Audio audio = new Audio();
// make string that will house the audio extension
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