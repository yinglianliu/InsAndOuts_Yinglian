//Four seasons in Central Park by Yinglian Liu
//1- Move the mouse to different location to see different pictures of four seasons.
//2- Press mouse can change the color as adding filter into these pictures.
//3- Prsse any key can back to the initialization color as white.


//empty space for 4 sides
int w=25;
int h=25;
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

float angle=-45;
float speed=20;

void setup(){
  size(1200,1200);
  
  //make a painting frame
  background(0);
  fill(255);
  rectMode(CENTER);
  noStroke();
  rect(width/2,height/2,width-w*2,width-h*2);
  
  spring = loadImage("spring.jpg");
  summer = loadImage("summer.jpg");
  fall = loadImage("fall.jpg");
  winter = loadImage("winter.jpg");
  
  snowflake = loadImage("snowflake.png");
  fallenleaves = loadImage("fallenleaves.png");
  sun = loadImage("sun.png");
  cherry = loadImage("cherry.png");
  
  //using Anton font from google fonts
  font = createFont("Anton-Regular.ttf",24);
  textFont(font);
  fill(0);
  textSize(68);
  text("Central Park",width/2-170,90);
  
  // lower flicker rate
  frameRate(5); 
}

void draw(){
  speed+=40;
  //move mouse to the left top
  if (mouseX> 100 && mouseX < width/2 && mouseY< height/2 && mouseY > 100){  
       imageMode(CORNER);
       image(spring,100,100,1000,1000);
       fill(255);     
       textSize(62);
       text("Spring",110,180);
       
       //spin the little icon cherry
       imageMode(CENTER);
      // image(cherry,350,150,60,60);
       pushMatrix();
       translate(350,150);
       rotate(angle+speed);
       image(cherry,0,0,60,60);
       popMatrix();
       
       
   //move mouse to the left bottom
    }else if (mouseX> 100 && mouseX < width/2 && mouseY>height/2 && mouseY < 1100){
      imageMode(CORNER);
        image(summer,100,100,1000,1000);
        fill(255);
        textSize(62);
        text("Summer",110,180);
        
        //spin the little icon sun
        imageMode(CENTER);
        //image(sun,350,150,60,60);
        pushMatrix();
        translate(350,150);
        rotate(angle+speed);
        image(sun,0,0,60,60);
        popMatrix();
        
    //move mouse to the right top  
    } else if (mouseX > width/2 && mouseX< 1100 && mouseY<height/2 && mouseY > 100){
      imageMode(CORNER);
      image(fall,100,100,1000,1000);
      fill(255);
      textSize(62);
      text("Fall",110,180);
      
      //spin the little icon leaves
      imageMode(CENTER);
      //image(fallenleaves,350,150,60,60);
      pushMatrix();
      translate(350,150);
      rotate(angle+speed);
      image(fallenleaves,0,0,60,60);
      popMatrix();
      
     //move mouse to the right bottom   
    }else if(mouseX > width/2 && mouseX< 1100 && mouseY>height/2 && mouseY < 1100){
      imageMode(CORNER);
      image(winter,100,100,1000,1000);
      fill(255);
      textSize(62);
      text("Winter",110,180);
      
      //spin the little icon snowflake
      imageMode(CENTER);
      //image(snowflake,350,150,60,60);
      pushMatrix();
      translate(350,150);
      rotate(angle+speed);
      image(snowflake,0,0,60,60);
      popMatrix();
      
    }
      
      //draw the pattern,random color and transparency
      for(int i=width/8; i<=width/8*7; i+=100){
          for(int j=width/8; j<=width/8*7; j+=100){ 
              strokeWeight(1.5);
              stroke(255,random(255));
              //noStroke();
              fill(r,g,b,random(127));
              rect(i,j,100,100); 
              
           }
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
