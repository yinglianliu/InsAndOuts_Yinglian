
//Creat basic flow
//Press key 1-4 into each season, Enter key to end.
 

String currentSeason="Spring";

int scene;
int w=50;
int h=50;

PImage [] image=new PImage[4];
PImage [] icon=new PImage[4];
PImage bg;
String [] text={"Spring","Summer","Fall","Winter"};

PFont font;

float a = 1.5;  //speed factor

int timer= 500; 
int currentTime=0; 
int savedTime=0; 

int textIndex=0;

float bc=0;
float rc=255;

//initialize pattern color is white
float r=255;
float g=255;
float b= 255;

void setup(){
    size(1200,1200);
    background(255);
  
  //using Anton font from google fonts
  font = createFont("Anton-Regular.ttf",24);
  
  //loading images with numbered files
  for(int i=0; i<image.length;i++){
    image[i] = loadImage("image"+ i +".jpg");
    icon[i] = loadImage("icon"+ i + ".png");
  }
   bg =loadImage("bg.jpg");
  frameRate(5);    // lower flicker rate
  smooth();
}

void draw(){
      currentTime=millis();    
      preShow();
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
      }
}


////////////////////////////Define preShow///////////////////////////////////

void preShow(){

    title();
  //assign the vaule to currentSeason to change the display in preshow,then match the
  //current season 
    if (currentSeason == "Spring"){
      image(icon[0],random(mouseX),random(mouseY),40,40);
    } else if (currentSeason == "Summer"){
      image(icon[1],random(mouseX),random(mouseY),40,40);
    
    }else if (currentSeason == "Fall"){
      image(icon[2],random(mouseX),random(mouseY),40,40);
    
    }else if(currentSeason == "Winter"){
      image(icon[3],random(mouseX),random(mouseY),40,40);
    }

      textAlign(CENTER);
      textSize(52);
      text("Welcome to Centrol Prak Visual Tour!",width/2,height/3);
      
      noStroke();
      rectMode(CORNER);
      int w=150;
      int h=150;
      ///Spring///
      fill(#FAB1D9);
      rect(250,height/3+100,w,h);
      fill(255);
      textAlign(LEFT);
      textSize(36);
      text("Sprirng",270,height/3+185);
      fill(0);
      textSize(24);
      text("1",320,height/3+280);
      
      ///Summer///
      fill(#40EA66);
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
      textSize(32);
      fill(0);
      text("Press NUMBER from keyboadr into each seaon",width/2,height/3*2);

}

////////////////////////////Define endShow///////////////////////////////////
void endShow(){
     tint(127);
     image(bg,0,0,1200,1200);
     textAlign(CENTER);
     textSize(52);
     fill(255);
     text("Thank you for your participation!",width/2, height/2-100);
     
     rectMode(CENTER);
     fill(#97EA24);
     rect(width/2,height/2-40,600,80);
     fill(255);
     textSize(32);
     text("Hope you have a wondful tour in Centrol Park!",width/2, height/2-20);

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
          fill(bc);
          rect(0,0,width,height);
          rectMode(CENTER);
          fill(rc);
          rect(width/2,height/2,width-w,width-h);
          title();
         //image(icon[0],random(mouseX),random(mouseY),40,40);
         imageDisplay(0,100,100,1000,1000);
         iconSpin(0,350,150,70,70);
         textDisplay(255,54,0);
         println("X: "+ mouseX,"Y: "+mouseY);
         textHint();
}

void summer(){

          rectMode(CORNER);
          noStroke();
          fill(bc);
          rect(0,0,width,height);
          rectMode(CENTER);
          fill(rc);
          rect(width/2,height/2,width-w,width-h);
          title();
         imageDisplay(1,100,100,1000,1000);
         iconSpin(1,1000,170,80,80);
         textDisplay(255,54,1);
         textHint();
         
}

void fall(){
          rectMode(CORNER);
          noStroke();
          fill(bc);
          rect(0,0,width,height);
          rectMode(CENTER);
          fill(rc);
          rect(width/2,height/2,width-w,width-h);
          title();
          imageDisplay(2,100,100,1000,1000);
          iconSpin(2,350,150,80,80);
          textDisplay(255,54,2);
          pattern(1.5,255,255,127); 
          textHint();
}

void winter(){
          rectMode(CORNER);
          noStroke();
          fill(bc);
          rect(0,0,width,height);
          rectMode(CENTER);
          fill(rc);
          rect(width/2,height/2,width-w,width-h);
          title();
          imageDisplay(3,100,100,1000,1000);
          iconSpin(3,350,150,80,80);
          textDisplay(255,54,3);   
          textHint();
}

/////////////////////////////Define difference kinds of functions////////////////////////

void title(){
      
          textFont(font);
          textSize(72);
          textAlign(LEFT);
         
          if(currentTime-savedTime > timer){
              fill(random(127,255), random(127,255), random(127,255));
              text("Central Park",width/2-165,90);
              savedTime=currentTime;
          }
          fill(0);
          text("Central Park",width/2-170,90);
}

void imageDisplay(int i,float x, float y, int imageWidth,int imageHeight){
         imageMode(CORNER);
         tint(255);
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
