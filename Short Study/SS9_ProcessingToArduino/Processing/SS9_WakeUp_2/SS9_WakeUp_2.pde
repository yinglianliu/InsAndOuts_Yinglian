/////////WAKE UP by Yinglian////////
/*
-move mouse to lit the lamp
-maping the mouseX(30 to 470) value to background color
-maping the mouseX(30 to 470) value send to piezo

*/


import processing.serial.*;

Serial myPort;
int piezoVal=0;
PFont font;
int val = 0;
int press=0;
void setup() {
  size(600,450);

  printArray(Serial.list());
  String portName = Serial.list()[1];
  myPort = new Serial(this,portName,9600);
  font = createFont("NotoSansMyanmar-ExtraBold-72.vlw",72);
  textFont(font);

}

void draw() {
  //mouseX(30 to 470) value to background color
    background(map(mouseX,30,470,0,255));
    light();
    noStroke();

    fill(255);
    textSize(24);
    text("Z",width/2,415);
    textSize(32);
    text("Z",width/2+25,405);
    textSize(38);
    text("Z",width/2+50,395);
    
    //mouseX(30 to 470) value send to piezo
    piezoVal=int (map(mouseX,30,570,0,255));
    myPort.write(piezoVal);
    println("Piezo value: "+ piezoVal);
  
  if( mouseX >=30 && mouseX<=130 && mouseY >= height/2-24 && mouseY < height/2+76){
    myPort.write(1);
    fill(#B7F5F1);
    ellipse(80,height/2+26,100,100);

  }else if( mouseX>=140 && mouseX<=240 && mouseY >= height/2-24 && mouseY < height/2+76){
    myPort.write(2);
    fill(#A6F5F0);
    ellipse(190,height/2+26,100,100);
    
    fill(#B7F5F1);
    ellipse(80,height/2+26,100,100);

  }else if ( mouseX>=250 && mouseX<=350 && mouseY >= height/2-24 && mouseY < height/2+76){
    myPort.write(3);
    fill(#82F2EC);
    ellipse(300,height/2+26,100,100);
      
    fill(#A6F5F0);
    ellipse(190,height/2+26,100,100);
    fill(#B7F5F1);
    ellipse(80,height/2+26,100,100);

  }else if (mouseX >=360 && mouseX <=460 && mouseY >= height/2-24 && mouseY < height/2+76) {
    myPort.write(4);
     fill(#57F5EB);
     ellipse(410,height/2+26,100,100);
      
    fill(#82F2EC);
    ellipse(300,height/2+26,100,100);
    fill(#A6F5F0);
    ellipse(190,height/2+26,100,100);
    fill(#B7F5F1);
    ellipse(80,height/2+26,100,100);

  }else if(mouseX >=470 && mouseX <=570 && mouseY >= height/2-24 && mouseY < height/2+76) {
     myPort.write(5);
     fill(#18F0E3);
     ellipse(520,height/2+26,100,100);
      
     fill(#57F5EB);
     ellipse(410,height/2+26,100,100);
    fill(#82F2EC);
    ellipse(300,height/2+26,100,100);
    fill(#A6F5F0);
    ellipse(190,height/2+26,100,100);
    fill(#B7F5F1);
    ellipse(80,height/2+26,100,100);
    textAlign(CENTER);
    //textFont(font);
    fill(#FA4023);
    textSize(100);
    text("WAKE UP!",width/2,400);
    fill(0);
    text("WAKE UP!",width/2+8,400);
  }else{
    myPort.write(0);
  }
 
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
