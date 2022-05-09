const int trigPin = 11;
const int echoPin = 10;
//const int photocellPin = A1;
const int led1=12;
const int led2=8;
const int led3=7;
const int led4=4;
const int led5= 2;
int pingTime;
float distance;
int valDistance;

void setup() {
  pinMode(trigPin,OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(photocellPin, INPUT);
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);
  pinMode(led4, OUTPUT);
  pinMode(led5, OUTPUT);
  Serial.begin(9600);

}

void loop() {
  digitalWrite(trigPin,LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  pingTime = pulseIn(echoPin,HIGH);
  distance = (pingTime * 0.0343)/2;
  delay(100);
//  Serial.print("Distance: ");
//  Serial.print(distance);
//  Serial.println(".cm");
//  delay(500);

  valDistance= int (map(distance,0,100,0,255));
  Serial.write(valDistance);

  if(distance < 20){
   
          digitalWrite(led1,HIGH);
//          delay(50);
          digitalWrite(led2,HIGH);
//          delay(50);
          digitalWrite(led3,HIGH);
//          delay(100);
          digitalWrite(led4,HIGH);
          digitalWrite(led5,HIGH);
  }else{
          digitalWrite(led5,LOW);
          digitalWrite(led4,LOW);
          digitalWrite(led3,LOW);
//          delay(50);
          digitalWrite(led2,LOW);
          //delay(50);
          digitalWrite(led1,LOW);
          //delay(100);
          }
}
