class Circle{
  int x,y;
  int diameter;
  int transparency;
  
  Circle(int tempX, int tempY, int tempD, int tempT){
    x= tempX;
    y= tempY;
    diameter = tempD;
    transparency = tempT;
  }
  
  void display(){

    //stroke(#FBFFD1,random(transparency));
    fill(r,g,b,random(transparency));
    ellipse(x,y,diameter,diameter);
  }
  
}
