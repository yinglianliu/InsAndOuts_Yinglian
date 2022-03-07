//Dynamic painting by Yinglian Liu
//Press mouse pressed or key pressed to change the pattern of painting


//empty space for 4 sides
int w=25;
int h=25;

float r=150;
float g=24;
float b= 13;

void setup(){
  size(800,800);
  //make a painting frame
  background(0);
  fill(255);
  rectMode(CENTER);
  noStroke();
  rect(width/2,height/2,width-w*2,width-h*2);
  frameRate(10); // lower flicker rate
}

void draw(){
  
  for(int i=width/8; i<=width/8*7; i+=100){
      for(int j=width/8; j<=width/8*7; j+=100){ 
          strokeWeight(random(10));
          stroke(20);
          fill(r,g,b,random(255));
          rect(i,j,100,100); 
          strokeWeight(3);
          line(i-50,j-50,i+50,j+50);
          }
  }
 
      //create ellipse pattern when press key
      if(keyPressed){
            
         for(int i=width/8; i<=width/8*7; i+=100){
                  for(int j=width/8; j<=width/8*7; j+=100){
                    strokeWeight(10);
                    stroke(0);
                    fill(255);
                    rect(i,j,100,100); 
                    strokeWeight(2);
                    stroke(255);
                    fill(random(255));
                    ellipseMode(CENTER);
                    ellipse(i,j,random(80),random(80));
                  }
                }
            }
     
}


void mousePressed(){

r= (random(255));
g= (random(255));
b= (random(255));

}
