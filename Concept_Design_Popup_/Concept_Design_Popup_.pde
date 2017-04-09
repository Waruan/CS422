//float canvasWidth = 2732;
//float canvasHeight = 1536;

// scale down for home monitors
float canvasWidth = 1366;
float canvasHeight = 768;

boolean boxInUse = false;
boolean drag = false;


float xDragArea = 150;
float yDragArea = 50;
float dragWidth = 1000;
float dragHeight = 700;


//Moving box
float boxHeight = 200;
float boxWidth = 200;
float xBox = int(canvasWidth/2);
float yBox = int(canvasHeight/2);

//Clickable popup box
int xClickBox = 50;
int yClickBox = 50;
int clickBoxHeight = 100;
int clickBoxWidth = 100;

float bdifx = 0.0;
float bdify = 0.0;


void setup() {
  size(1336,768);
  background(255);
}

void draw() {
  
  
  
  if(!drag){
  
    background(255);
    fill(255);
    rect(xClickBox,yClickBox, clickBoxWidth, clickBoxHeight, 7);
  
  
  }
  
  background(255);
  fill(255);
  rect(xClickBox,yClickBox, clickBoxWidth, clickBoxHeight, 7);
  
  
  
  if(boxInUse) {
    
    if(drag) {
    
       fill(192,192,192);
       rect(xDragArea, yDragArea, dragWidth, dragHeight, 10);
    
    }
    
    fill(255);
    rect(xBox, yBox, boxWidth, boxHeight);

  }
  
}

//Function to create a new box/window
void pop_up_box(float x, float y) {

  rect(x, y, boxWidth, boxHeight, 7);
  boxInUse = true;
  
}

//Function to check if mouse cursor is INSIDE the specified box
boolean insideBox(float x, float y, float boxWidth, float boxHeight) {

  if((mouseX >= x && mouseX <= (x+boxWidth)) && ((mouseY >= y) && mouseY <= (y+boxHeight)))  {
    
    return true;
  }
  else {
    return false;
  }
  
}

//Function to check if mouse cursor is OUTSIDE the specified box
boolean outsideBox(float x,float y, float boxWidth, float boxHeight) {

   if((mouseX < x || mouseX >= (x+boxWidth)) || ((mouseY < y) || mouseY > (y+boxHeight))) {
   
     return true;
   }
   else {
     return false;
   }

}

//Mouse handlers
void mouseClicked() {
  println("DEBUG(0): YOU CLICKED!");
  
  
  if(insideBox(xClickBox,yClickBox, clickBoxWidth, clickBoxHeight) && !boxInUse){
    println("DEBUG(1): BoxInUse: " + boxInUse + " Clicked");
    pop_up_box(xBox, yBox);
    println("DEBUG(2): BoxInUse: " + boxInUse + " Created Box");
    println("===========");
    return;
  }
  
  if(boxInUse && outsideBox(xBox,yBox,boxWidth,boxHeight)) {
    println("DEBUG(3): BoxInUse: " + boxInUse + " Clicked");
    background(255);
    boxInUse = false;
    println("DEBUG(4): BoxInUse: " + boxInUse + " Delete Box");
    println("===========");
    return;
      
    
  }
  
}

void mousePressed() {

  if(insideBox(xBox,yBox,boxWidth,boxHeight)) {
    drag = true;
  
  }
  else {
  
    drag = false;
  }
  
  bdifx = mouseX-xBox;
  bdify = mouseY-yBox;
  

}

void mouseDragged() {

  if( mouseX-bdifx < xDragArea || mouseX-bdifx+boxWidth > xDragArea + dragWidth || mouseY-bdify < yDragArea || mouseY-bdify+boxHeight > yDragArea + dragHeight) {

      //Do nothing.
      if(xBox < xDragArea){
        xBox = xDragArea;
      }
      if( xBox+boxWidth > xDragArea + dragWidth){
         xBox = xDragArea + dragWidth - boxWidth;
      
      }
      if( yBox < yDragArea){
        yBox = yDragArea;
      }
       if(yBox+boxHeight > yDragArea + dragHeight){
        yBox = yDragArea + dragHeight - boxHeight;
      }


  }


  else if(drag) {

    xBox = mouseX-bdifx;
    yBox = mouseY-bdify;
  }



}

void mouseReleased() {

  drag = false;
  
  if(xBox < xDragArea || xBox+boxWidth > xDragArea + dragWidth || yBox < yDragArea || yBox+boxHeight > yDragArea + dragHeight) {
    
      //Do nothing.
      xBox = canvasWidth/2;
      yBox = canvasHeight/2;
    
  }
  
}