
//A Lego Batman by Yinglian Liu

// set up the canvas
size(1080,720);
background(230,180,17);
noStroke();
fill(10,10,10,90);
rect(0,0,1080,30);
rect(0,30,30,705);
rect(30,690,1050,30);
rect(1050,30,30,660);

//base
fill(0,0,0);
rect(340,640,370,20);

//head
noStroke();
fill(0,0,0);
rect(400,120,250,120);
strokeWeight(2);
stroke(59,58,56);
rect(400,240,250,60);

//face
strokeWeight(2);
stroke(0,0,0);
fill(245,205,126);
rect(400,300,250,70);

//glasses
strokeWeight(2);
stroke(0,0,0);
fill(255,255,255);
square(400,240,60);
square(590,240,60);
fill(0,0,0);

//top of head
fill(44,43,50);
rect(400,110,250,10);
rect(430,95,40,15);
rect(500,95,40,15);
rect(570,95,40,15);
triangle(430,95,470,60,470,95);
triangle(570,95,570,60,610,95);

strokeWeight(2);
stroke(0,0,0);
rect(380,120,20,240);
rect(650,120,20,240);
triangle(380,120,400,60,400,120);
triangle(650,120,650,60,670,120);

fill(255,255,255);
quad(380,220,400,240,400,300,380,280);
quad(650,240,670,220,670,280,650,300);


//body

//top of body
fill(125,125,125);
rect(405,370,240,50);
//left line of body
line(410,400,420,410);
line(420,410,510,415);
//right line of body
line(640,400,630,410);
line(630,410,540,415);
//bat logo(No idea how to draw it >.<)

//middle of body
fill(100,100,100);
rect(405,420,240,50);
//belt
rect(465,420,120,50);
fill(0,0,0);
rect(405,439,60,19);
rect(585,439,60,19);
fill(140,140,140);
rect(470,424,110,42);

//bottom of body
fill(0,0,0);
rect(405,470,240,50);

//legs
fill(125,125,125);
rect(405,520,60,100);
rect(585,520,60,100);
rect(465,520,120,45);
fill(0,0,0);
rect(405,620,60,20);
rect(585,620,60,20);

//cloak
fill(0,0,0);
rect(360,370,45,250);
rect(645,370,45,250);

//arms
fill(67,67,67);
//left
rect(363,370,43,130);
rect(373,500,25,15);
//right
rect(645,370,43,130);
rect(655,500,25,15);

//hands
noFill();
strokeWeight(6);
stroke(67,67,67);
arc(386, 529, 25, 25, PI, TWO_PI);
arc(668, 529, 25, 25, PI, TWO_PI);
