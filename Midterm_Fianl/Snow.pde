class Snow{
  float x,y;
  
  Snow(int tempX, int tempY){
    x = tempX;
    y = tempY;
  }
  
  void fall(){
    if(y>1100){
      y=100;
    }else{
      y+=10;
    }
   
  }
  
  void display(){
    //x=random(100,1100);
    //y=random(100,1100);
    stroke(255,random(255));
    strokeWeight(random(15));
    point(x,y);
  }
  
  


}
