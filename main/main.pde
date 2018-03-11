//keyboard events
//capturing key presses and mouse buttons once
//press x and z or mouse left and right
sprite asterisk;

int x = 0;
int y = 0;

int GRAVITY = 3;
int JUMP = 5;

void setup()
{  
  asterisk = new sprite(
    loadImage("asterisk_normal0001.png"), 
    loadImage("asterisk_normal0003.png"), 
    loadImage("asterisk_stretching0001.png"), 
    loadImage("asterisk_stretching0008.png"));
    
  frameRate(60);
  size (600,600);
  background (255,255,255); 
}

void draw()
{
  background(255, 255, 255);
  asterisk.drawSprite();
}

class sprite
{
  int numberOfFrames = 12;
  PImage[] normalImages = new PImage[numberOfFrames];
  PImage[] triggeredImages = new PImage[numberOfFrames];
  
  Position position = new Position();
  Position startingPosition = new Position();
  
  sprite(PImage normal1, PImage normal2, PImage triggered1, PImage triggered2)
  {
    for(int i = 0; i < numberOfFrames; i++){
      normalImages[i] = normal1; 
      triggeredImages[i] = triggered1;
    }
    
    for(int i = 6; i < numberOfFrames; i++){
      normalImages[i] = normal2;
      triggeredImages[i] = triggered2;
    }
    
    startingPosition.x = 235;
    startingPosition.y = 450;
    
    position.x = startingPosition.x;
    position.y = startingPosition.y;
  }
  
  int currentFrame = 0;
  
  void drawSprite()
  {
    if(currentFrame == numberOfFrames){
      currentFrame = 0;  
    }
    else{
      currentFrame++; 
    }
    
    if(keyPressed && key == 'x'){
     asterisk.position.y -= JUMP;
    }
    else{
      
    }
    
    position.y += GRAVITY;
    
    if(isAtOrBelowInitialY()){
      position.y = startingPosition.y;
      drawNormal(position.x,position.y);
    }
    else{
      drawTriggered(position.x,position.y); 
    }
  }
  
  void drawNormal(int x, int y){
    image(normalImages[currentFrame % numberOfFrames], x, y);
  }
  
  void drawTriggered(int x, int y){
    image(triggeredImages[currentFrame % numberOfFrames], x, y);
  }
  
  boolean isAtOrBelowInitialY(){
    return position.y >= startingPosition.y;
  }

}

class Position
{
  int x;
  int y;
}