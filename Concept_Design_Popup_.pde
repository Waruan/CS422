int width = 500;
int height = 200;

int xLocation = 500;
int yLocation = 500;

boolean boxInUse = false;

void setup() {
  size(1280, 800);
  background(255);
}

void draw() {
  
   rect(100,100, 100, 100, 7);
  
}

//Function to create a new box/window
void pop_up_box(int x, int y) {

  rect(x, y, width, height, 7);
  boxInUse = true;
  
}

//Function to check if mouse cursor is INSIDE the specified box
boolean insideBox(int x, int y, int boxWidth, int boxHeight) {

  if((mouseX >= x && mouseX <= (x+boxWidth)) && ((mouseY >= y) && mouseY <= (y+boxHeight)))  {
    return true;
  }
  else {
    return false;
  }
  
}

//Function to check if mouse cursor is OUTSIDE the specified box
boolean outsideBox(int x, int y, int boxWidth, int boxHeight) {

   if((mouseX < x || mouseX >= (x+boxWidth)) && ((mouseY < y) || mouseY > (y+boxHeight))) {
   
     return true;
   }
   else {
     return false;
   }

}

//Mouse handlers
void mouseClicked() {
  println("DEBUG(0): YOU CLICKED!");
  
  
  if(insideBox(100,100,100,100) && !boxInUse){
    println("DEBUG(1): BoxInUse: " + boxInUse + " Clicked");
    pop_up_box(xLocation, yLocation);
    println("DEBUG(2): BoxInUse: " + boxInUse + " Created Box");
    println("===========");
    return;
  }
  
  if(boxInUse && outsideBox(xLocation, yLocation, width, height)) {
    println("DEBUG(3): BoxInUse: " + boxInUse + " Clicked");
    background(255);
    boxInUse = false;
    println("DEBUG(4): BoxInUse: " + boxInUse + " Delete Box");
    println("===========");
    return;
      
    
  }
  
}