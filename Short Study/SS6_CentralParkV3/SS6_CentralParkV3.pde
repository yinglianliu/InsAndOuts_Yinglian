//Four seasons in Central Park V.3 by Yinglian Liu
//Using array to store the images and text
//Using time event to chage the random colors of "Central Park"
//Using mousePressed to pop up difference texts


//empty space for 4 sides
int w=50;
int h=50;

PImage [] image=new PImage[4];
PImage [] icon=new PImage[4];
String [] text={"Spring","Summer","Fall","Winter"};
String [] text2={"Try press the mouse","Beautiful place to go","Hello","Welcome","Have you been here?",
                "Boating","Enjoy biking"};
PFont font;

float a = 1.5;  //speed factor

int timer= 800; 
int currentTime=0; 
int savedTime=0; 

int textIndex=0;

void setup(){
  size(1200,1200);
  //make a painting frame
  background(0);
  fill(255);
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
    
  frameRate(10);    // lower flicker rate
}

void draw(){
    currentTime=millis();
    
    textFont(font);
    textSize(72);
    //shadow of central park
    if(currentTime-savedTime > timer){
        fill(random(127,255), random(127,255), random(127,255));
        text("Central Park",width/2-165,90);
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
      rotate(spinSpeed(2,15));
      image(icon[i],0,0,imageWidth,imageHeight);
      popMatrix();

}
//use for control the rotate speed
float spinSpeed(float speed, float angle){
    float ss= angle*speed*a;
    a++;
    return ss;  
}

void mousePressed(){
      textIndex = int (random(1,6)); //avoid to show up the first index of the text2 array again
      println(textIndex);

}
