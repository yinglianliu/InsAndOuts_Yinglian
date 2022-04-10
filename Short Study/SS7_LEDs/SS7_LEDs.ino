const int buttonPin = 2;

int ledPins[ ]= {6,7,8,9,10,11,12,13};

int buttonState = 0;

void setup() {
  pinMode(buttonPin, INPUT);
  
  for (int i = 0; i <=7; i++) {
    
    pinMode(ledPins[i],OUTPUT);
    
    }
}

void loop() {
   buttonState = digitalRead(buttonPin); // read the state of the pushbutton    
   delay (10); 
  
  if (buttonState == HIGH) {
    ledsLightUp();     
  } else {  
    ledsOff();  
  }
  
}

void ledsLightUp(){
  int delayTime = 100;
  int delayTime2 = 300;

  for(int i =0; i<=7;i++)
  {
    digitalWrite(ledPins[i],HIGH);
    delay(delayTime);
  }

  for(int i =0; i<=7;i++)
  {
    digitalWrite(ledPins[i],HIGH);
  }
  
  delay(delayTime2);

  for(int i =7; i>=0;i--)
  {
    digitalWrite(ledPins[i],LOW);
    delay(delayTime);
  }
  
    delay(delayTime2);
  
}

void ledsOff(){
  int delayTime = 50;

  for(int i=7; i >=0; i--)
  {
    digitalWrite(ledPins[i],LOW);
    delay(delayTime);
    }
  }
