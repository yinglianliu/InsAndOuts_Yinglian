/////////////////WIP_2//////////////
/* 
1- modify the flow(add preShow3 and preShow4 to increase interaction);
2- modify preShow1 and preShow2;
3- add sound files;
4- Using arrays to store 4 images for each season, click mouse to randomly select
5- Left-click to switch pictures, 
   right-click to display and switch filters which is pattern
6- add a new pattern to simulate snowing

*/


/////////////////WIP_1//////////////
/*

1- Creat basic flow
2- Press key 1-4 into each season, Enter key to end.

*/
 
import processing.sound.*;

SoundFile bgmSpring;
SoundFile win;
SoundFile lose;

float x=200;
float y=1000;
float xspeed=40;
float yspeed=60;

String currentSeason="Spring";

int scene;
int imageIndex=0;

int state=0;
PImage [] imgSpring=new PImage[4];
PImage [] imgSummer=new PImage[4];
PImage [] imgFall=new PImage[4];
PImage [] imgWinter=new PImage[4];
PImage [] icon=new PImage[4];
PImage bg1;
PImage bg2;
PImage soccerball;
PImage football;
PImage bee;
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
    /////////////////BGM//////////////////////
    bgmSpring = new SoundFile(this,"spring.wav");
    bgmSpring.amp(0.8);
    bgmSpring.loop();
    
    ////////////////Font/////////////////////
    font = createFont("Anton-Regular.ttf",24);
  
    ////////////////Arraies for images///////
    for(int i=0; i<4;i++){
      imgSpring[i] = loadImage("spring"+ i +".jpg");
      imgSummer[i] = loadImage("summer"+ i +".jpg");
      imgFall[i] = loadImage("fall"+ i +".jpg");
      imgWinter[i] = loadImage("winter"+ i +".jpg");
      icon[i] = loadImage("icon"+ i + ".png");
    }
    bg1= loadImage("bg1.jpg");
    bg2= loadImage("bg.jpg");
    soccerball=loadImage("soccerball.png");
    football=loadImage("football.png");
    bee = loadImage("bee.png");
    
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
    ////////Determine if the user guessed correctly//////////////////
    if(mouseX >=250 && mouseX<400 
        && mouseY >= height/3+100 && mouseY < height/3+250 
        && scene==6 ){
          preShow3();
          } else if(mouseX>450 && mouseX < 1000 
          && mouseY >= height/3+100 && mouseY < height/3+250 
          && scene==6)  {
          preShow4();
          } 

}

void mousePressed(){
      ////////left click to switch the images randomly//////
      if(mouseButton==LEFT){
          imageIndex = int(random(0,4));
          println("Image: " + imageIndex);
          println("mouse button: Left");
          
      ////////right click to switch the color randomly//////    
      }else if(mouseButton ==RIGHT){
      r= (random(255));
      g= (random(255));
      b= (random(255));
      
      println("r: "+ r);
      println("g: "+ g);
      println("b: "+ b);
      println("mousepressed");
      println("mouse button: Right");
      }
           
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
        scene = 5; //scene 5 for endShow
      }else if (key == 32) {
        scene = 6; //scene 6 for preShow2()
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
       title();
       
    /*assign the vaule to currentSeason to change the display in preshow,
      then match the current season.
      */
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
      win.amp(0.4);
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
      text("Press NUMBER KEY into your favorite season",width/2,height/2+150);
      
}

void preShow4(){

      lose = new SoundFile(this,"lose.wav");
      lose.amp(0.4);
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
     rectMode(CENTER);
     
     fill(#97EA24);
     rect(width/2,height/2-150,720,90);
     fill(255);
     noStroke();
     textSize(38);
     text("Hope You Have a Wondful Tour in Central Park!",width/2, height/2-135);

     textSize(28);
     fill(#97EA24);
     text("Press the NUMBER KEY to watch again.", width/2+3, 1108);
     fill(255);
     text("Press the NUMBER KEY to watch again.", width/2, 1108);
     rect(width/2+5,1140,600,45); 
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
          
         imageMode(CORNER);
         image(imgSpring[imageIndex],100,100,1000,1000);
         iconSpin(0,350,150,70,70);
         textDisplay(255,54,0);
         textHint();
         textHint2();
         image(bee,mouseX-20,mouseY+20,80,80);
         if(mousePressed && (mouseButton==RIGHT)){
           pattern(1.5,255,127,75); 
         }
}

void summer(){

          rectMode(CORNER);
          noStroke();
          fill(0);
          rect(0,0,width,height);
          rectMode(CENTER);
          fill(255);
          rect(width/2,height/2,width-50,width-50);

           imageMode(CORNER);
           image(imgSummer[imageIndex],100,100,1000,1000);
           iconSpin(1,1000,170,80,80);
           textDisplay(255,54,1);
           textHint();
           textHint2();
           if(mousePressed && (mouseButton==RIGHT)){
           pattern(1.5,255,127,75); 
           }
           
           //football (reference: https://processing.org/examples/bounce.html)
            x = x+ xspeed;
            y= y+yspeed;
           
            if ((x > width-100) || (x < 100)) {
  
              xspeed = xspeed * -1;
              
              }
              
              if ((y > height/2+100) || (y < height/2-100)) {
              
              yspeed = yspeed * -1;
              
              }
              image(football,x,y,30,30);
}

void fall(){
          rectMode(CORNER);
          noStroke();
          fill(0);
          rect(0,0,width,height);
          rectMode(CENTER);
          fill(255);
          rect(width/2,height/2,width-50,width-50);

          imageMode(CORNER);
          image(imgFall[imageIndex],100,100,1000,1000);
          iconSpin(2,350,150,80,80);
          textDisplay(255,54,2);
          textHint();
          textHint2();
          if(mousePressed && (mouseButton==RIGHT)){
            pattern(1.5,255,127,75); 
         }
}

void winter(){
          rectMode(CORNER);
          noStroke();
          fill(0);
          rect(0,0,width,height);
          rectMode(CENTER);
          fill(255);
          rect(width/2,height/2,width-50,width-50);

          imageMode(CORNER);
          image(imgWinter[imageIndex],100,100,1000,1000);
          iconSpin(3,350,150,80,80);
          textDisplay(255,54,3);   
          textHint();
          textHint2();
          if(mousePressed && (mouseButton==RIGHT)){
            //pattern(1.5,255,127,75); 
            pattern2(20,255,255); //Looks like snowing
         }
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
          fill(45);
          text("Central Park",width/2,100);
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
     text("<1>-Spring",340,1150);
     text("<2>-Summer",450,1150);
     text("<3>-Fall",580,1150);
     text("<4>-Winter",660,1150);
     text("<Enter>-End",770,1150);

}

void textHint2(){
     textAlign(LEFT);
     textSize(28);
     fill(0);
     text("LEFT Click:  Next Picture",110,1030);
     fill(255);
     text("LEFT Click:  Next Picture",113,1030);
     fill(0);
     text("RIGHT Click and HOLD:  Filter",110,1080);
     fill(255);
     text("RIGHT Click and HOLD:  Filter",113,1080);

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


void pattern2(float sw, float c, float st){  
      for(int i=100; i<=1100; i+=80){
          for(int j=100; j<=1100; j+=80){ 
              rectMode(CENTER);
              strokeWeight(random(sw));
              stroke(c,random(st));
              point(i,j); 
           }
      }
}
