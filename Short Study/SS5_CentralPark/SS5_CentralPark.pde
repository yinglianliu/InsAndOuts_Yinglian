//Four seasons in Central Park by Yinglian Liu
//1- Move the mouse to different location to see different pictures of four seasons.
//2- Press mouse can change the color as adding filter into these pictures.
//3- Prsse any key can back to the initialization color as white.
//4- When move the mouse to left and right corner of top,a new pattern will show up.

//empty space for 4 sides
int w=50;
int h=50;
PImage spring;
PImage summer;
PImage fall;
PImage winter;
PImage snowflake;
PImage fallenleaves;
PImage sun;
PImage cherry;
PFont font;

//initialize pattern color is white
float r=255;
float g=255;
float b= 255;

//speed factor
float a = 1.5;

void setup(){
  size(1200,1200);
  //make a painting frame
  background(0);
  fill(255);
  rectMode(CENTER);
  noStroke();
  rect(width/2,height/2,width-w,width-h);
  
  //loading different pictures for seasons
  spring = loadImage("spring.jpg");
  summer = loadImage("summer.jpg");
  fall = loadImage("fall.jpg");
  winter = loadImage("winter.jpg");

  //loading different icons for seasons
  snowflake = loadImage("snowflake.png");
  fallenleaves = loadImage("fallenleaves.png");
  sun = loadImage("sun.png");
  cherry = loadImage("cherry.png");
  
  //using Anton font from google fonts
  font = createFont("Anton-Regular.ttf",24);
  
  // lower flicker rate
  frameRate(5); 
}

void draw(){
  //make text looks like 3D and every click change the color of shadow
    textFont(font);
    textSize(72);
    fill(r,g,b);
    text("Central Park",width/2-165,90);
    fill(0);
    text("Central Park",width/2-170,90);

  //move mouse to the left top, spring picture
  if (mouseX> 100 && mouseX < width/2 && mouseY< height/2 && mouseY > 100){        
       imageDisplay(spring,100,100,1000,1000);
       iconSpin(cherry,350,150,60,60);
       textDisplay(255,62,"Sping");
           
   //move mouse to the left bottom, summer picture
    }else if (mouseX> 100 && mouseX < width/2 && mouseY>height/2 && mouseY < 1100){
       imageDisplay(summer,100,100,1000,1000);
       iconSpin(sun,350,150,60,60);
       textDisplay(255,62,"Summer");

    //move mouse to the right top, fall picture
    } else if (mouseX > width/2 && mouseX< 1100 && mouseY<height/2 && mouseY > 100){
       imageDisplay(fall,100,100,1000,1000);
       iconSpin(fallenleaves,350,150,60,60);
       textDisplay(255,62,"Fall");
            
    //move mouse to the right bottom,winter picture   
    }else if(mouseX > width/2 && mouseX< 1100 && mouseY>height/2 && mouseY < 1100){
       imageDisplay(winter,100,100,1000,1000);
       iconSpin(snowflake,350,150,60,60);
       textDisplay(255,62,"Winter");       
    }
    
    //move the mouse to left and right corner of top
    if(mouseX<100 && mouseY<100 || mouseX > width-100 && mouseY<100){
      pattern2();
    }
    
    pattern(1.5,255,255,127);   

}


//imageDisplay function
void imageDisplay(PImage i,float x, float y, int imageWidth,int imageHeight){
       imageMode(CORNER);
       image(i,x,y,imageWidth,imageHeight);
       
}

//textDisplay function, c for color, s for textsize, t for string text
void textDisplay(float c, float s, String t){
  
       fill(c);     
       textSize(s);
       text(t,110,180);
       
}

void iconSpin(PImage i,float x, float y,int imageWidth,int imageHeight){
 
      imageMode(CENTER);
      pushMatrix();
      translate(x,y);
      rotate(spinSpeed(2,15));
      image(i,0,0,imageWidth,imageHeight);
      popMatrix();

}

//use for control the rotate speed
float spinSpeed(float speed, float angle){
    float ss= angle*speed*a;
    a++;
    return ss;  
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

void pattern2(){
  for (int i=width-200; i>0;i-=100){

    fill(r-70,g-70,b-70,random(75));
    //stroke(255);
    noStroke();
    ellipse(width/2,height/2,i,i);
 
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

//Back to the initialization color
void keyPressed(){
      r=255;
      g=255;
      b=255;
      
      println("r: "+ r);
      println("g: "+ g);
      println("b: "+ b);
      println("keypressed");
}
