////////Fianl Project - WIP2 - Yinglian////////
/*
1 - There are 4 sensors send the data from Arduino to Processing.(2 pots,photocell,
    distance sensor.)
2 - Send the amplitude data from Processing to Arduino.
3 - Create a few patterns for difference music.
4 - Parameters Affecting Patterns: amplitude of the song, the values from 
    two pots in Arduino. (I was planning use the distance sensor to change the pattern,
    but not working well, so I use the pots to control.)
    
    One pot changes the shape of pattern(rotate degree), 
    one changes the color. 
    
    The shape is also changed by amplitude. 
    
    The color is also changed by the amplitude.(Slight, base on the amplitude.When not changing the
    value of pot, just can see it.)
5 - Trying to using amplitude to change the brightness of LED Strip, but not working 
    very well.
    
*/

//Fianl Project - WIP 1 - Yinglian////////
/*
-I'm going to use distance sensor to make a toy which is interactive.
-In WIP1, just test out if I can use the data from the sensor to do something as make the shape change.
-Map the value from sensor to difference scale.
*/

import processing.serial.*;
import processing.sound.*;

SoundFile dreampop;
SoundFile lively;
SoundFile rhythmic;

Amplitude dreampopamp;
Amplitude livelyamp;
Amplitude rhythmicamp;

float amp;

Serial myPort;
int[] serialInArray = new int[4];    // Create array to store incoming bytes
int serialCount = 0;                 // A count of how many bytes we receive
boolean firstContact = false;        // Whether we're receiving data

int valDistance=0;
int valueOfPhC=0;
int valOfPot=0;
int valOfPot2=0;
int widthToPot;
int widthToPot2;
int potToWidth=0;
int pot2ToWidth=0;
int valueOfAmp; //sending this data to Arduino

PImage music1;
PImage music2;
PImage music3;

int page;

void setup() {
  size(1000,1000);
  
  printArray(Serial.list());
  String portName = Serial.list()[1];
  myPort = new Serial(this,portName,9600);
    
  music1 = loadImage("dreampop.jpeg");
  music2 = loadImage("lively.jpeg");
  music3 = loadImage("rhythmic.jpeg");
  

  rhythmic = new SoundFile(this,"Austerlitz.aiff");
  rhythmicamp = new Amplitude(this);
  rhythmicamp.input(rhythmic);
  
  dreampop = new SoundFile(this,"Myth.aiff");
  dreampopamp = new Amplitude(this);
  dreampopamp.input(dreampop);
  
  lively = new SoundFile(this,"Rebirth-of-Cool.aiff");
  livelyamp = new Amplitude(this);
  livelyamp.input(lively);
  
}


void draw() {
  valueOfAmp = int(map(amp,0,1,0,255)); //mapping the value to send to Arduino
  myPort.write(valueOfAmp);
  ////println(valueOfAmp);
  
  //mapping the values from 2 pots into the range of width
  potToWidth = int(map(valOfPot,0,255,0,width));
  pot2ToWidth = int(map(valOfPot2,0,255,0,width));
  
  //remapping these value to make big changing when using pot to 
  //control the color and shape
  widthToPot = int(map(pot2ToWidth,0,width,0,255));
  widthToPot2 = int(map(pot2ToWidth,0,width,255,0));
  
  //welcomePage(); 

    if (page ==1){
    pattern3();
  }else if (page ==2) {
    pattern2();
  }else if (page == 3) {
    pattern4();
  }else if(page ==4) {
    yesMusic();
  }else if(page==5) {
    noMusic();
  }
  

}

//Copy the Serial_Handshaking code
void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  int inByte = myPort.read();
  // if this is the first byte received, and it's an A, clear the serial
  // buffer and note that you've had first contact from the microcontroller.
  // Otherwise, add the incoming byte to the array:
  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    }
  } else {
    // Add the latest byte from the serial port to array:
    serialInArray[serialCount] = inByte;
    serialCount++;

    // If we have 4 bytes:
    if (serialCount > 3 ) {
      valDistance = serialInArray[0];
      valOfPot = serialInArray[1];
      valueOfPhC = serialInArray[2];
      valOfPot2 = serialInArray[3];

      println(valDistance + "\t" + valOfPot + "\t"+ valueOfPhC + "\t" + valOfPot2);

      // Send a capital A to request new sensor readings:
      myPort.write('A');
      // Reset serialCount:
      serialCount = 0;
    }
  }
}

////////////////////////////////Define functions/////////////////////////////////////////

void keyPressed(){
      if(key =='1'){
        clear();
        page = 1; 
        dreampop.play();
        lively.stop();
        rhythmic.stop();
      }else if(key == '2'){
        clear();
        page = 2;  
        lively.play();
        dreampop.stop();
        rhythmic.stop();
      }else if (key =='3'){
        clear();
        page = 3;  
        rhythmic.play();
        dreampop.stop();
        lively.stop();
      }else if (key == 'y'|| key=='Y'){
        clear();
        page = 4;  
        
      }else if (key == 'n' || key=='N') {
        clear();
        page = 5; 
      }
      
}

void welcomePage() {
  background(0);
  textSize(50);
  fill(255);
  textAlign(CENTER);
  text("Welcome back!",width/2,height/2-80);
  
  text("Would you like to listen music?",width/2,height/2);
  
  text("YES",width/5*2,height/2+100);
  
  text("NO",width/5*3,height/2+100);
  
}

void yesMusic() {
  background(0);
  fill(200);
  rectMode(CENTER);
  rect(width/2,height/2-150,350,250);
  rect(width/2-200,height/2-150,50,25);
  rect(width/2+200,height/2-150,50,25);
  textSize(35);
  fill(255);
  textAlign(CENTER);
  text("How to play",width/2,height/5);
  textSize(25);
  text("Change color",width/2-270,height/2-200);
  text("Change shape",width/2+280,height/2-200);
  stroke(255);
  strokeWeight(3);
  line(width/2-270,height/2-195,width/2-230,height/2-150);
  line(width/2+270,height/2-195,width/2+230,height/2-150);
  
  image(music1,width/5,height/5*3,200,200);
  image(music2,width/5*2+40,height/5*3,200,200);
  image(music3,width/5*3+80,height/5*3,200,200);
  
  text("Pick an image you like",width/2,height/6*5+50);
  

}

void noMusic() {
  background(0);
  textSize(75);
  fill(255);
  textAlign(CENTER);
  text("I'm here for you!",width/2,height/2);
}


//line, pattern for lively music
void pattern2(){
  rectMode(CORNER);
  noStroke();
  fill(widthToPot,widthToPot2,int(255-255*amp),20);
  rect(0,0,width,height);
  
  noFill();
  strokeWeight(random(1,3));
  stroke(255,255,255);
  
   //dreampop.stop();
   //rhythmic.stop();
   //lively.play();
 
  amp = livelyamp.analyze();
  
  potToWidth = int(map(valOfPot,0,255,0,width));
  float deg = map(potToWidth, 0, width,1,100);
  
  for(int i=0; i< 360; i+=deg) {
    pushMatrix();
      translate(width/2, height/2);
      float angle = radians(i);
      rotate(angle);
      line(width/2-amp*width/2,0,amp*width/2,amp*width/2);
      
    popMatrix();
  }
}

//point, pattern for dream pop mousic
void pattern3(){
  rectMode(CORNER);
  noStroke();
  fill(light,light_2,int(255-255*amp),10);
  rect(0,0,width,height);
  
  noFill();
  strokeWeight(random(2,15));
  stroke(255,255,255);
  
  
  //lively.stop();
  //rhythmic.stop();
  //dreampop.play();

  amp = dreampopamp.analyze();
  
  potToWidth = int(map(valOfPot,0,255,0,width));
  float deg = map(potToWidth, 0, width,1,45);
  
  for(int i=0; i< 360; i+=deg) {
    pushMatrix();
      translate(width/2, height/2);
      float angle = radians(i);
      rotate(angle);
      point(width/2-amp*width/2,width/2-amp*width/2);
      
    popMatrix();
  }
}

//triangle, pattern for rhythmic mousic
void pattern4(){
  rectMode(CORNER);
  noStroke();
  fill(light,light_2,int(255-255*amp),10);
  rect(0,0,width,height);
  noFill();
  strokeWeight(2);
  stroke(255,255,255);
  
    //rhythmic.play();
    //dreampop.stop();
    //lively.stop();
    
  amp = rhythmicamp.analyze();

  potToWidth = int(map(valOfPot,0,255,0,width));
  int deg =int(map(potToWidth,0,width,90,1));
  
  for(int i=0; i< 360; i+=deg) {
    pushMatrix();
      translate(width/2, height/2);
      float angle = radians(i);
      rotate(angle);
      triangle(width/2-amp*width/2,0,amp*width/2,amp*width/2,amp*width/2/tan(30),amp*width/4);
       
    popMatrix();
  }
}
