//Four seasons in Central Park V.3 by Yinglian Liu
//Using array to store the images and text instead of loading images each time
//Using time event to chage the random colors of "Central Park" 
//and fill with the png image on the canvas
//Using mousePressed to pop up difference texts in an array


//empty space for 4 sides
int w=50;
int h=50;

PImage [] image=new PImage[4];
PImage [] icon=new PImage[4];
String [] text={"Spring","Summer","Fall","Winter"};
String [] text2={"Try press the mouse","Beautiful place to go","Hello","Welcome",
                "Have you been here?","Boating","Enjoy biking"};
PFont font;
float a = 1.5;  //speed factor

int timer= 500; 
int currentTime=0; 
int savedTime=0; 

int textIndex=0;
int hr;
int mn;
int sc;

float bc=0;
float rc=255;

void setup(){
  size(1200,1200);
  //make a painting frame
  background(bc);
  fill(rc);
  rectMode(CENTER);
  noStroke();
  rect(width/2,height/2,width-w,width-h);
      
  //using Anton font from google fonts
  font = createFont("Anton-Regular.ttf",24);
  
  //loading images with numbered files
  for(int i=0; i<image.length;i++){
    image[i] = loadImage("image"+ i +".jpg");
    icon[i] = loadImage("icon"+ i + ".png");
  }
    
  frameRate(5);    // lower flicker rate
  smooth();
}

void draw(){
    currentTime=millis();    
    textFont(font);
    textSize(72);
   
    if(currentTime-savedTime > timer){
        fill(random(127,255), random(127,255), random(127,255));
        text("Central Park",width/2-165,90);
        image(icon[0],random(mouseX),random(mouseY),40,40);
        println("X: "+ mouseX,"Y: "+mouseY);
        savedTime=currentTime;
    }
    fill(0);
    text("Central Park",width/2-170,90);
    
 
    //move mouse to the left top, spring picture
    if (mouseX> 100 && mouseX < width/2 && mouseY< height/2 && mouseY > 100){        
         imageDisplay(0,100,100,1000,1000);
         iconSpin(0,350,150,70,70);
         textDisplay(255,54,0);
             
     //move mouse to the left bottom, summer picture
      }else if (mouseX> 100 && mouseX < width/2 && mouseY>height/2 && mouseY < 1100){
         imageDisplay(1,100,100,1000,1000);
         iconSpin(1,350,150,70,70);
         textDisplay(255,54,1);
  
      //move mouse to the right top, fall picture
      } else if (mouseX > width/2 && mouseX< 1100 && mouseY<height/2 && mouseY > 100){
         imageDisplay(2,100,100,1000,1000);
         iconSpin(2,350,150,80,80);
         textDisplay(255,54,2);
              
      //move mouse to the right bottom,winter picture   
      }else if(mouseX > width/2 && mouseX< 1100 && mouseY>height/2 && mouseY < 1100){
         imageDisplay(3,100,100,1000,1000);
         iconSpin(3,350,150,80,80);
         textDisplay(255,54,3);       
      }
      
      //using mousePressed event to pop up texts randomly
      fill(255);
      textSize(42);
      text(text2[textIndex],110,height/2);
      
      clock();   
}
 
void imageDisplay(int i,float x, float y, int imageWidth,int imageHeight){
       imageMode(CORNER);
       image(image[i],x,y,imageWidth,imageHeight);   
}

void textDisplay(float c, float s, int t){
  
       fill(c);     
       textSize(s);
       text(text[t],110,180);
}

void iconSpin(int i,float x, float y,int imageWidth,int imageHeight){
 
      imageMode(CENTER);
      pushMatrix();
      translate(x,y);
      rotate(spinSpeed(2,-15));
      image(icon[i],0,0,imageWidth,imageHeight);
      popMatrix();

}

//use for control the rotate speed
float spinSpeed(float speed, float angle){
    float ss= angle*speed*a;
    a++;
    return ss;  
}

void clock(){
        //make a clock
      hr=hour();
      mn=minute();
      sc=second();
      rectMode(CORNER);
      fill(255);
      noStroke();
      rect(989,1055,113,30);

      fill(0);
      textSize(24);
      text(hr+" : "+ mn+ " : "+ sc,994,1080);
}

void mousePressed(){
      textIndex = int (random(1,6)); //avoid to show up the first index of the text2 array again
      println("Text: "+ textIndex);

}
