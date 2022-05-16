#include <FastLED.h>
#define led_Pin 13
#define NUM_LEDS 60
CRGB leds[NUM_LEDS];

const int trigPin = 11;
const int echoPin = 10;
const int photocellPin = A1;
const int potPin = A0;
const int potPin2 = A5;

int pingTime;
float distance;
int valDistance=0;
int valueOfPhC=0;
int valOfPot=0;
int valOfPot2=0;
int inByte = 0;
int valueOfAmp;
int ampMap;

void setup() {
  Serial.begin(9600);

  while (!Serial) {
    ;
    }
    
  pinMode(trigPin,OUTPUT);
  pinMode(echoPin, INPUT);
//  pinMode(potPin,INPUT);
//  pinMode(potPin2,INPUT);
  pinMode(photocellPin,INPUT);
  
  FastLED.addLeds<WS2812,led_Pin, GRB>(leds,NUM_LEDS);
  FastLED.setMaxPowerInVoltsAndMilliamps(5,500);
  FastLED.clear();
  FastLED.show();

  establishContact();
}

void loop() {
  if(Serial.available()){
    valueOfAmp = Serial.read();
    delay(10);

    }
  ampMap=map(valueOfAmp,0,255,0,25);
  
  digitalWrite(trigPin,LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  pingTime = pulseIn(echoPin,HIGH);
  distance = (pingTime * 0.0343)/2;
  delay(10);

  //  Serial.print("Distance: ");
//  Serial.print(distance);
//  Serial.println(".cm");
//  delay(500);

   
   for(int i=0; i<NUM_LEDS;i++){
      leds[i] = CRGB(20*i,255-20*i,20*i);
      FastLED.setBrightness(ampMap*i);
      FastLED.show();
      delay(10);
      
    } 
    
  
  if(Serial.available()>0) {
   inByte = Serial.read();
   
  valDistance= int (map(distance,0,100,0,255));
  delay(10);
  valOfPot = map(analogRead(potPin),0,1023,0,255);
  delay(10);
  valueOfPhC = map(analogRead(photocellPin),0,1023,0,255);
  delay(10);
  valOfPot2 = map(analogRead(potPin2),0,1023,0,255);
  
  Serial.write(valDistance);
    Serial.write(valOfPot);
  Serial.write(valueOfPhC);

  Serial.write(valOfPot2);
   }
   
  }

void establishContact(){
  while (Serial.available() <=0) {
    Serial.print('A');
    delay(400);
    }
  }
