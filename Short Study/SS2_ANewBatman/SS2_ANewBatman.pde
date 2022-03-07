
//A New Batman by Yinglian Liu
//1 - Move mouse to chang the background
//2 - Move the cursor to glasses,difference looks of eyes will show up
//3 - When cursor in the glasses, left click will enlarge the eyes size,
//and if the cursor on the right of glasses and left click,
//the background would change to be flashing and say NO!!!
//4 - Pressing the Enter key would decrease the size of eyes.



float maxDistance;
float size;
float eyeSize = 2;
float num = 0.005;
float mouthSize = 5;

void setup(){
size(1080,720);

//exmaple from processing(how to use dist): https://processing.org/examples/distance2d.html
maxDistance = dist(0,0,width,height);
frameRate(30);

}

void draw(){
  bgChanged();
  head();
  body();
  bottom();
  mouseMove(); 
  mousePressed();
  textShow();
}

void textShow() {
  if (mouseX< 400){
    fill(255);
    textSize(28);
    //textAlign(LEFT);
    text("Try move to right!", width/24,height/10*1.5);
    } else if(mouseX> 650){
      textSize(28);
      fill(255);
      //textAlign(CENTER);
      text("Try move to glasses", width/24*16,height/10*1.5);
    
    }else if (mouseX >400 && mouseX < 650 && mouseY>240 && mouseY <300){
      
      textSize(28);
      fill(255);
      //textAlign(CENTER);
      text("Try clicking", width/24*16,height/10*1.5);
           
    }else{
      
    }
}  

void bgChanged(){
  if(mouseX< width/7*3.8){
  background(230,180,17);
  
  } else if(mouseX > 590 && mouseX < 650 && mouseY > 240 && mouseY < 300 && mousePressed== true){
  background(random(255),random(255),255);
  
  } else{
  background(12,213,229);
  }
  
  for(int i=0; i <= width; i +=20){
    for(int j =0; j<= height; j +=20){
  size = dist(mouseX,mouseY,i,j);
  size = size/maxDistance*60;
  fill(45);
  ellipse(i,j,size,size);
    }
  }
}

void mouseMove(){
  if(mouseX > 400 && mouseX < 460 && mouseY > 240 && mouseY < 300){
  eyesShy();
     
}else if(mouseX > 590 && mouseX < 650 && mouseY > 240 && mouseY < 300){
  eyesShock();

  } 
}

void mousePressed(){
  if(mouseX > 400 && mouseX < 460 && mouseY > 240 && mouseY < 300 && mousePressed == true){
    eyesShy();
    eyeSize = eyeSize+num*2;
    textSize(30);
    text("Don't look at me!",width/9, height/4);
  } else if (mouseX > 590 && mouseX < 650 && mouseY > 240 && mouseY < 300 && mousePressed == true){
    eyesShock();
    
    eyeSize = eyeSize+num*5;
    //mouthSize = mouthSize + num;
    textSize(100);
    text("NO!!!",width/5 * 3.5, height/3);
    textSize(32);
    text("Try press Enter or Return", width/5*3.1, height/5*2);
     
  } else {
    
  } 
}

void keyPressed(){
  if(mouseX > 400 && mouseX < 460 && mouseY > 240 && mouseY < 300 && key == ENTER ){
    eyesShy();
    eyeSize = eyeSize-num*10;
    
  } else if (mouseX > 590 && mouseX < 650 && mouseY > 240 && mouseY < 300 && key == ENTER){
    eyesShock();
    eyeSize = eyeSize-num*18;
  }
}

// Draw the batman

void head(){
//head
noStroke();
fill(0,0,0);
rect(400,120,250,120);
strokeWeight(2);
stroke(59,58,56);
rect(400,240,250,60);

//face
strokeWeight(2);
stroke(0,0,0);
fill(245,205,126);
rect(400,300,250,70);

//glasses
strokeWeight(2);
stroke(0);
fill(255);
square(400,240,60);
square(590,240,60);
fill(0);

//top of head
strokeWeight(2);
fill(44,43,50);
rect(400,110,250,10);
rect(430,95,40,15);
rect(500,95,40,15);
rect(570,95,40,15);
triangle(430,95,470,60,470,95);
triangle(570,95,570,60,610,95);

strokeWeight(2);
stroke(0,0,0);
rect(380,120,20,240);
rect(650,120,20,240);
triangle(380,120,400,60,400,120);
triangle(650,120,650,60,670,120);

fill(255,255,255);
quad(380,220,400,240,400,300,380,280);
quad(650,240,670,220,670,280,650,300);

}

void body(){
//top of body
fill(125,125,125);
rect(405,370,240,50);

//left line of body
line(410,400,420,410);
line(420,410,510,415);
//right line of body
line(640,400,630,410);
line(630,410,540,415);

//bat logo(No idea how to draw it >.<)

//middle of body
fill(100,100,100);
rect(405,420,240,50);
//belt
rect(465,420,120,50);
fill(0,0,0);
rect(405,439,60,19);
rect(585,439,60,19);
fill(140,140,140);
rect(470,424,110,42);

//bottom of body
fill(0,0,0);
rect(405,470,240,50);

}

void bottom(){
//legs
fill(125,125,125);
rect(405,520,60,100);
rect(585,520,60,100);
rect(465,520,120,45);
fill(0,0,0);
rect(405,620,60,20);
rect(585,620,60,20);

//cloak
fill(0,0,0);
rect(360,370,45,250);
rect(645,370,45,250);

//arms
fill(67,67,67);
//left
rect(363,370,43,130);
rect(373,500,25,15);
//right
rect(645,370,43,130);
rect(655,500,25,15);

//hands
noFill();
strokeWeight(6);
stroke(67,67,67);
arc(386, 529, 25, 25, PI, TWO_PI);
arc(668, 529, 25, 25, PI, TWO_PI);

//base
noStroke();
fill(0,0,0);
rect(340,640,370,20);

}

//Difference looks of eyes
void eyesShy(){
  fill(0);
  ellipse(430, 270,eyeSize*25,eyeSize*25);
  ellipse(620, 270,eyeSize*25,eyeSize*25);
  fill(255);
  ellipse(420, 260,eyeSize*10,eyeSize*10);
  ellipse(610, 260,eyeSize*10,eyeSize*10);
  
  ellipse(430, 280,eyeSize*9,eyeSize*9);
  ellipse(620, 280,eyeSize*9,eyeSize*9);

}

void eyesShock(){
  fill(0);
  ellipse(430, 270,eyeSize*25,eyeSize*25);
  ellipse(620, 270,eyeSize*25,eyeSize*25);  
  fill(255);
  ellipse(430, 270,eyeSize*15,eyeSize*15);
  ellipse(620, 270,eyeSize*15,eyeSize*15);  
 
  strokeWeight(8);
  stroke(0);
  rect(515, 335,mouthSize*6,mouthSize*10);
  noStroke();

}
