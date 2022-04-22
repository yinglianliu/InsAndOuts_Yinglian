const int SENSOR = A0;
const int Led1 = 10;
const int Led2 = 9;
const int Led3 = 6;
const int Led4 = 5;
const int Led5 = 3;

int val =0;

void setup() {
  pinMode(SENSOR,INPUT);
  pinMode(Led1,OUTPUT);
  pinMode(Led2, OUTPUT);
  pinMode(Led3,OUTPUT);
  pinMode(Led4, OUTPUT);
  pinMode(Led5, OUTPUT);
  Serial.begin(9600);

}

void loop() {
  val = analogRead(SENSOR);
  val = val /4 ;
  delay(100);



//  Serial.println(val);
  Serial.write(val);

  if(val ==0){
    analogWrite(Led1,0);
    analogWrite(Led2,0);
    analogWrite(Led3,0);  
    analogWrite(Led4,0);            
    analogWrite(Led5,0);  
    
    }else if (val <=35) {
    analogWrite(Led1,val);
    
  }else if (val <=70) {
    analogWrite(Led1,val);
    analogWrite(Led2,val);
    delay(400);
    } else if (val <=105) {
    analogWrite(Led1,val);
    analogWrite(Led2,val);
    analogWrite(Led3,val); 
    delay(350);     
    }else if (val <=140) {
    analogWrite(Led1,val);
    analogWrite(Led2,val);
    analogWrite(Led3,val);  
    analogWrite(Led4,val); 
    delay(300);         
      }else if (val <=175) {
    analogWrite(Led1,val);
    analogWrite(Led2,val);
    analogWrite(Led3,val);  
    analogWrite(Led4,val);            
    analogWrite(Led5,val); 
    delay(250);
        } else if (val >175 && val < 230) {
    analogWrite(Led1,val);
    analogWrite(Led2,val);
    analogWrite(Led3,val);  
    analogWrite(Led4,val);            
    analogWrite(Led5,val);
    delay(200);  
             
          } else if( val >=230 && val <=255) {
    analogWrite(Led1,val);
    analogWrite(Led2,val);
    analogWrite(Led3,val);  
    analogWrite(Led4,val);            
    analogWrite(Led5,val);  
    delay(150);
    analogWrite(Led1,0);
    analogWrite(Led2,0);
    analogWrite(Led3,0);  
    analogWrite(Led4,0);            
    analogWrite(Led5,0);  
    delay(150);
            }
    }
 
