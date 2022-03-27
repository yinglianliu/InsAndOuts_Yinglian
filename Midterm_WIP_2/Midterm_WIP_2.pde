/////////////////WIP_2//////////////
/* 
1- modify the flow(add preShow3 and preShow4 to increase interaction);
2- modify preShow1 and preShow2;
3- add sound files;

*/


/////////////////WIP_1//////////////
/*

1- Creat basic flow
2- Press key 1-4 into each season, Enter key to end.

*/
 
import processing.sound.*;

SoundFile spring;
SoundFile win;
SoundFile lose;

String currentSeason="Spring";

int scene;

int state=0;
PImage [] image=new PImage[4];
PImage [] icon=new PImage[4];
PImage bg1;
PImage bg2;
PImage soccerball;
PImage football;
String [] text={"Spring","Summer","Fall","Winter"};

PFont font;

float a = 1.5;  //speed factor

int timer= 800; 
int timer2=300;
int currentTime=0; 
int savedTime=0; 

int textIndex=0;


//initialize pattern color is white
float r=255;
float g=255;
float b= 255;

void setup(){
    size(1200,1200);
    background(80,204,240);
    spring = new SoundFile(this,"spring.wav");
    spring.amp(0.6);
    spring.loop();
    
  //using Anton font from google fonts
  font = createFont("Anton-Regular.ttf",24);
  
  //loading images with numbered files
  for(int i=0; i<image.length;i++){
    image[i] = loadImage("image"+ i +".jpg");
    icon[i] = loadImage("icon"+ i + ".png");
  }
  bg1= loadImage("bg1.jpg");
  bg2= loadImage("bg.jpg");
  soccerball=loadImage("soccerball.png");
  football=loadImage("football.png");
  frameRate(5);    // lower flicker rate
  smooth();
}

void draw(){
      currentTime=millis();    
      preShow1();
      
      if (scene==1){
        spring();
      }else if (scene==2) {
        summer();
      }else if (scene==3) {
        fall();
      }else if (scene==4) {
        winter();
      }else if (scene==5){
        endShow();
      }else if (scene==6) {
        preShow2();

    }           
    if(mouseX >=250 && mouseX<400 && mouseY >= height/3+100 && mouseY < height/3+250 && scene==6 ){
          preShow3();
          } else if(mouseX>450 && mouseX < 1000 && mouseY >= height/3+100 && mouseY < height/3+250 && scene==6)  {
          preShow4();
          } 
      

}

void mousePressed(){
      r= (random(255));
      g= (random(255));
      b= (random(255));
      
      println("r: "+ r);
      println("g: "+ g);
      println("b: "+ b);
      println("mousepressed");
            
}


void keyPressed(){
      if(key =='1'){
        scene = 1;  //scene 1 for spring
      }else if(key == '2'){
        scene = 2;  //scene 2 for summer
      }else if (key =='3'){
        scene = 3;  //scene 3 for fall
      }else if (key == '4'){
        scene = 4;  //scene 4 for winter
      }else if (key == ENTER) {
        scene = 5;
      }else if (key == 32) {
        scene = 6;
      }
      
}

////////////////////////////Define preShow 1 to 4///////////////////////////////////
void preShow1(){

      title();
      imageMode(CENTER);
      image(bg1, width/2,height/2,800,800);
      textAlign(CENTER);
      textSize(52);
      fill(255);
      text("Welcome to Central Park Virtual Tour!",width/2,height/2-100);
            
      textSize(32);
      fill(255,255,127);
      text("Press SPACE to start",width/2+3,height/2+100);
      fill(0);
      text("Press SPACE to start",width/2,height/2+100);
      
}

void preShow2(){
      //assign the vaule to currentSeason to change the display in preshow,then match the
      //current season 
      title();
    if (currentSeason == "Spring"){
      image(icon[0],random(width),random(height),40,40);
    } else if (currentSeason == "Summer"){
      image(icon[1],random(width),random(height),40,40);
    
    }else if (currentSeason == "Fall"){
      image(icon[2],random(width),random(height),40,40);
    
    }else if(currentSeason == "Winter"){
      image(icon[3],random(width),random(height),40,40);
    }
      noStroke();
      rectMode(CENTER);
      fill(80,204,240);
      rect(width/2,height/2,800,800);
      
      rectMode(CORNER);
      int w=150;
      int h=150;
      
      ///Spring///
      fill(245,210,233);
      rect(250,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Sprirng",270,height/3+185);
      
      ///Summer///
      fill(144,234,71);
      rect(450,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Summer",470,height/3+185);
      
      ///Fall///
      fill(#EDB31F);
      rect(650,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Fall",700,height/3+185);
      
      ///Winter///
      fill(#DEDDDB);
      rect(850,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Winter",880,height/3+185); 
      
      textAlign(CENTER);
      textSize(36);
      fill(0);
      text("While you are listening the music with the frame,",width/2,height/3);
      text("which SEASON will you think of?",width/2,height/3+80);
      fill(255);
      textSize(32);
      text("Move the CURSOR to the box",width/2,height/2+150);
      
}

void preShow3(){
      win = new SoundFile(this,"win.wav");
      win.amp(0.5);
      win.play();
      background(80,204,240);
      title();
     
      noStroke();
      rectMode(CORNER);
      int w=150;
      int h=150;
      
      ///Spring///
      fill(245,210,233);
      rect(250,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Sprirng",270,height/3+185);
      fill(0);
      textSize(24);
      text("1",320,height/3+280);
      
      ///Summer///
      fill(144,234,71);
      rect(450,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Summer",470,height/3+185);
      fill(0);
      textSize(24);
      text("2",520,height/3+280);
      
      ///Fall///
      fill(#EDB31F);
      rect(650,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Fall",700,height/3+185);
      fill(0);
      textSize(24);
      text("3",720,height/3+280);
      
      ///Winter///
      fill(#DEDDDB);
      rect(850,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Winter",880,height/3+185); 
      fill(0);
      textSize(24);
      text("4",920,height/3+280);
      
      textAlign(CENTER);
      textSize(36);
      fill(0);
      text("YEAH, you get it!",width/2,height/3);
      textSize(42);
      text("You have UNLOCKED the key!",width/2,height/3+80);
 
  
      textSize(32);
      fill(255);
      text("Press NUMBER KEY to watch your favorite season",width/2,height/2+150);
      
}

void preShow4(){

      lose = new SoundFile(this,"lose.wav");
      lose.amp(0.5);
      lose.play();
      background(80,204,240);
      title();
      noStroke();
      rectMode(CENTER);
      fill(80,204,240);
      rect(width/2,height/2,800,800);
      
      rectMode(CORNER);
      int w=150;
      int h=150;
      
      ///Spring///
      fill(245,210,233);
      rect(250,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Sprirng",270,height/3+185);
      
      ///Summer///
      fill(144,234,71);
      rect(450,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Summer",470,height/3+185);
      
      ///Fall///
      fill(#EDB31F);
      rect(650,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Fall",700,height/3+185);
      
      ///Winter///
      fill(#DEDDDB);
      rect(850,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Winter",880,height/3+185); 
      
      textAlign(CENTER);
      textSize(36);
      fill(0);
      text("Uhhhh, try one more time",width/2,height/3);
      
      textSize(32);
      fill(255);
      text("Move the CURSOR to the box",width/2,height/2+150);
      

}
////////////////////////////Define endShow///////////////////////////////////
void endShow(){

     background(bg2);
     textAlign(CENTER);
     textSize(52);
     fill(255);
     text("Thank you for your participation!",width/2, height/2-100);
     
     rectMode(CENTER);
     fill(#97EA24);
     rect(width/2,height/2-40,600,80);
     fill(255);
     textSize(32);
     text("Hope you have a wondful tour in Central Park!",width/2, height/2-20);

     //fill(#97EA24);
     //rect(width/2,1100,400,50);
     fill(255);
     textSize(24);
     text("Press the NUMBER KEY to watch again.", width/2+50, 1108);
     rect(width/2+50,1140,550,50); 
     textHint();
     
}

////////////////////////////Define each season///////////////////////////////////

void spring(){
         
          rectMode(CORNER);
          noStroke();
          fill(0);
          rect(0,0,width,height);
          rectMode(CENTER);
          fill(255);
          rect(width/2,height/2,width-50,width-50);
        
         imageDisplay(0,100,100,1000,1000);
         iconSpin(0,350,150,70,70);
         textDisplay(255,54,0);
         println("X: "+ mouseX,"Y: "+mouseY);
         textHint();
}

void summer(){

          rectMode(CORNER);
          noStroke();
          fill(0);
          rect(0,0,width,height);
          rectMode(CENTER);
          fill(255);
          rect(width/2,height/2,width-50,width-50);

          
         imageDisplay(1,100,100,1000,1000);
         iconSpin(1,1000,170,80,80);
         //image(soccerball,int(random(width)),int(random(1000,1050)),40,40);
         
         playBall(soccerball,130,1000,40,40);
         
         textDisplay(255,54,1);
         textHint();
         
}

void fall(){
          rectMode(CORNER);
          noStroke();
          fill(0);
          rect(0,0,width,height);
          rectMode(CENTER);
          fill(255);
          rect(width/2,height/2,width-50,width-50);

          
          imageDisplay(2,100,100,1000,1000);
          iconSpin(2,350,150,80,80);
          textDisplay(255,54,2);
          pattern(1.5,255,255,127); 
          textHint();
}

void winter(){
          rectMode(CORNER);
          noStroke();
          fill(0);
          rect(0,0,width,height);
          rectMode(CENTER);
          fill(255);
          rect(width/2,height/2,width-50,width-50);

          imageDisplay(3,100,100,1000,1000);
          iconSpin(3,350,150,80,80);
          textDisplay(255,54,3);   
          textHint();
}

/////////////////////////////Define difference kinds of functions////////////////////////

void title(){
      
          textFont(font);
          textSize(82);
          textAlign(CENTER);
         
          if(currentTime-savedTime > timer){
              fill(random(127,255), random(127,255), random(127,255));
              text("Central Park",width/2+8,100);
              savedTime=currentTime;
          }
          fill(255);
          text("Central Park",width/2,100);
}

void imageDisplay(int i,float x, float y, int imageWidth,int imageHeight){
         imageMode(CORNER);
         image(image[i],x,y,imageWidth,imageHeight);   
}

void textDisplay(float c, float s, int t){
         textAlign(LEFT);
         fill(c);     
         textSize(s);
         text(text[t],110,180);
}

void iconSpin(int i,float x, float y,int imageWidth,int imageHeight){
 
          imageMode(CENTER);
          pushMatrix();
          translate(x,y);
          rotate(spinSpeed(2,-15));
          tint(255);
          image(icon[i],0,0,imageWidth,imageHeight);
          popMatrix();

}

//use for control the rotate speed
float spinSpeed(float speed, float angle){
    float ss= angle*speed*a;
    a++;
    return ss;  
}

void textHint(){
     textAlign(LEFT);
     textSize(24);
     fill(0);
     text("<1>-Spring",400,1150);
     text("<2>-Summer",510,1150);
     text("<3>-Fall",630,1150);
     text("<4>-Winter",710,1150);
     text("<Enter>-End",810,1150);

}

void pattern(float sw, float c, float st, float ft){  
  //draw the pattern,random color and transparency
      for(int i=width/8; i<=width/8*7; i+=100){
          for(int j=width/8; j<=width/8*7; j+=100){ 
              rectMode(CENTER);
              strokeWeight(sw);
              stroke(c,random(st));
              //noStroke();
              fill(r,g,b,random(ft));
              rect(i,j,100,100); 
           }
      }
}

void playBall(PImage t,float x, float y,int imageWidth,int imageHeight){

          imageMode(CENTER);
          pushMatrix();
          translate(x,y);
          rotate(speed(2,15));
          tint(255);
          image(t,0,0,imageWidth,imageHeight);
          popMatrix();
          
        
}
  

//use for control the rotate speed
float speed(float speed, float angle){
    float ss= angle*speed*a;
    a++;
    return ss;  
}
