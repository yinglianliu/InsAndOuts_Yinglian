//Fianl Project - WIP 1 - Yinglian////////
/*
-I'm going to use distance sensor to make a toy which is interactive.
-In WIP1, just test out if I can use the data from the sensor to do something as make the shape change.
-Map the value from sensor to difference scale.
*/

import processing.serial.*;

Serial myPort;
PFont font;
int valDistance=0;

//create difference variables to get value from sensor
int widthS=0;
int widthM=0;
int widthL=0;
int bgColor=0;

void setup() {
  size(800,800);

  printArray(Serial.list());
  String portName = Serial.list()[1];
  myPort = new Serial(this,portName,9600);
  font = createFont("NotoSansMyanmar-ExtraBold-72.vlw",72);
  textFont(font);
  //frameRate(35);

}

void draw() {
   
    if (myPort.available()>0 ){
          valDistance= myPort.read();
    }
    background(bgColor);
    println(valDistance);

    //Map the value from sensor to difference scale.
    widthS = int (map(valDistance,0,255,50,width/4));
    widthM = int (map(valDistance,0,255,width/3,width/2));
    widthL = int (map(valDistance,0,255,width/2,width));
    bgColor= int (map(valDistance,0,255,255,0));
    
    rectMode(CENTER);
    noStroke();
    
    fill(100);
    rect(width/2,height/2,widthL,widthL);
    
    fill(50);
    rect(width/2,height/2,widthM,widthM);
    
    fill(20);
    rect(width/2,height/2,widthS,widthS);

}

void star(){

}

void dayMode(){

}

void nightMode(){

}
