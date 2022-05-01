const int Led1 = 2;
const int Led2 = 4;
const int Led3 = 7;
const int Led4 = 8;
const int Led5 = 12;
const int PIEZO = 5;

int duration=20; 
int val =0;
int piezoVal=0;
int frequency=0;

void setup() {
  pinMode(PIEZO,OUTPUT);
  pinMode(Led1,OUTPUT);
  pinMode(Led2, OUTPUT);
  pinMode(Led3,OUTPUT);
  pinMode(Led4, OUTPUT);
  pinMode(Led5, OUTPUT);
  Serial.begin(9600);

}

void loop() {
  if(Serial.available()){
    val = Serial.read();
    piezoVal = Serial.read();
    delay(10);
    }
    //mapping mouseX value from processing to freqiency
    frequency =map(piezoVal,0,255,500,1500);
    
 if (val ==1) {
    tone(PIEZO,frequency,duration);
    digitalWrite(Led1,HIGH);
    digitalWrite(Led2,LOW);
    digitalWrite(Led3,LOW);  
    digitalWrite(Led4,LOW);            
    digitalWrite(Led5,LOW); 
    delay(duration);

  }else if (val ==2) {
    tone(PIEZO,frequency,duration);
    digitalWrite(Led1,HIGH);
    digitalWrite(Led2,HIGH);
    digitalWrite(Led3,LOW);  
    digitalWrite(Led4,LOW);            
    digitalWrite(Led5,LOW); 
    delay(duration);
    } else if (val ==3) {
    tone(PIEZO,frequency,duration);
    digitalWrite(Led1,HIGH);
    digitalWrite(Led2,HIGH);
    digitalWrite(Led3,HIGH); 
    digitalWrite(Led4,LOW);            
    digitalWrite(Led5,LOW); 

    }else if (val ==4) {
    tone(PIEZO,frequency,duration);
    digitalWrite(Led1,HIGH);
    digitalWrite(Led2,HIGH);
    digitalWrite(Led3,HIGH);  
    digitalWrite(Led4,HIGH); 
    digitalWrite(Led5,LOW);
    delay(duration);
      }else if (val ==5) {
        tone(PIEZO,frequency,duration);
      digitalWrite(Led1,HIGH);
      digitalWrite(Led2,HIGH);
      digitalWrite(Led3,HIGH);  
      digitalWrite(Led4,HIGH);            
      digitalWrite(Led5,HIGH); 
      delay(50);
      digitalWrite(Led1,LOW);
      digitalWrite(Led2,LOW);
      digitalWrite(Led3,LOW);  
      digitalWrite(Led4,LOW);            
      digitalWrite(Led5,LOW); 
      delay(50);
       
    }else if (val ==0) {
      digitalWrite(Led1,LOW);
      digitalWrite(Led2,LOW);
      digitalWrite(Led3,LOW);  
      digitalWrite(Led4,LOW);            
      digitalWrite(Led5,LOW); 
      }
}
