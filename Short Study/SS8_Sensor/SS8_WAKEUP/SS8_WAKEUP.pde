/*WAKE UP by Yinglian
- The lamp would be lit up from left to right, 
the value starts from 1, and every increase of 35 will lit up one more lamp.

- the brightness of every lamp and backgrond color would be changed by follow the value of input
*/

//import processing.sound.*;

import processing.serial.*;

Serial myPort;
//SoundFile alarm;
PFont font;
int val = 0;

void setup() {
  size(600,450);

  printArray(Serial.list());
  String portName = Serial.list()[1];
  myPort = new Serial(this,portName,9600);
  font = createFont("NotoSansMyanmar-ExtraBold-72.vlw",72);
  textFont(font);
  //alarm = new SoundFile(this,"alarm.wav");
  //frameRate(20);
}

void draw() {
    background(val);
    light();
    noStroke();

    fill(255);
    textSize(24);
    text("Z",width/2,415);
    textSize(32);
    text("Z",width/2+25,405);
    textSize(38);
    text("Z",width/2+50,395);

  if ( myPort.available() > 0) {
    val = myPort.read();
  
  }else if( val <=35){
    fill(#B7F5F1,val);
    ellipse(80,height/2+26,100,100);

  }else if( val <=70){
    fill(#A6F5F0,val);
    ellipse(190,height/2+26,100,100);
    
    fill(#B7F5F1,val);
    ellipse(80,height/2+26,100,100);

  }else if ( val <=105){
    fill(#82F2EC,val);
    ellipse(300,height/2+26,100,100);
      
    fill(#A6F5F0,val);
    ellipse(190,height/2+26,100,100);
    fill(#B7F5F1,val);
    ellipse(80,height/2+26,100,100);

  }else if (val <=140) {
     fill(#57F5EB,val);
     ellipse(410,height/2+26,100,100);
      
    fill(#82F2EC,val);
    ellipse(300,height/2+26,100,100);
    fill(#A6F5F0,val);
    ellipse(190,height/2+26,100,100);
    fill(#B7F5F1,val);
    ellipse(80,height/2+26,100,100);

  }else if(val <=175) {
     fill(#18F0E3,val);
     ellipse(520,height/2+26,100,100);
      
     fill(#57F5EB,val);
     ellipse(410,height/2+26,100,100);
    fill(#82F2EC,val);
    ellipse(300,height/2+26,100,100);
    fill(#A6F5F0,val);
    ellipse(190,height/2+26,100,100);
    fill(#B7F5F1,val);
    ellipse(80,height/2+26,100,100);

  }else if(val >175 && val<230) {
     fill(#18F0E3,val);
     ellipse(520,height/2+26,100,100);
      
     fill(#57F5EB,val);
     ellipse(410,height/2+26,100,100);
    fill(#82F2EC,val);
    ellipse(300,height/2+26,100,100);
    fill(#A6F5F0,val);
    ellipse(190,height/2+26,100,100);
    fill(#B7F5F1,val);
    ellipse(80,height/2+26,100,100);

  }else if (val >=230 && val <=255) {

     fill(#18F0E3,val);
     ellipse(520,height/2+26,100,100);
     fill(#57F5EB,val);
     ellipse(410,height/2+26,100,100);
     fill(#82F2EC,val);
     ellipse(300,height/2+26,100,100);
     fill(#A6F5F0,val);
     ellipse(190,height/2+26,100,100);
     fill(#B7F5F1,val);
     ellipse(80,height/2+26,100,100);

    textAlign(CENTER);
    //textFont(font);
    fill(#FA4023);
    textSize(100);
    text("WAKE UP!",width/2,400);
    fill(0);
    text("WAKE UP!",width/2+8,400);
    //alarm.amp(0.2);
    //alarm.play();
  }
  
  println(val);
 
}

void light(){
  fill(72);
  stroke(72);
  noStroke();
  //strokeWeight(1);
  ellipse(80,height/2+26,100,100);
  ellipse(190,height/2+26,100,100);
  ellipse(300,height/2+26,100,100);
  ellipse(410,height/2+26,100,100);
  ellipse(520,height/2+26,100,100);
  
  stroke(72);
  strokeWeight(20);
  line(20,20,580,20);
  
  strokeWeight(5);
  line(80,20,80,200);
  line(190,20,190,200);
  line(300,20,300,200);
  line(410,20,410,200);
  line(520,20,520,200);
}

void sleeping() {

}
