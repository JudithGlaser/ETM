import processing.io.*;
import mqtt.*;
MQTTClient client;
int a0;

int PIN_A = 18; // AUF PI 18;
int PIN_B = 23; // AUF PI 24;

Avarage aX;

void setup() {
  client = new MQTTClient(this);
  client.connect("mqtt://localhost", "processing");
  client.subscribe("a0");
  aX = new Avarage();

}

void discharge() {
  GPIO.pinMode(PIN_A, GPIO.INPUT);
  GPIO.pinMode(PIN_B, GPIO.OUTPUT);
  GPIO.digitalWrite(PIN_B, 0);
  delay(int(1000 * 0.005));
}


int charge_time() {
  GPIO.pinMode(PIN_B, GPIO.INPUT);
  GPIO.pinMode(PIN_A, GPIO.OUTPUT);
  int count = 0;
  GPIO.digitalWrite(PIN_A, 1);
  while(GPIO.digitalRead(PIN_B) != 1) {
    count = count + 1;
  }
  return count;
}

int analogRead() {
  discharge();
  return charge_time();
}
void draw() {
  aX.update(a0);
  // int value = analogRead();
  
  // println(a0);
  background(map(aX.value(), 200, 2000, 0, 255));
}

void messageReceived(String topic, byte[] payload)  {
  a0 = Integer.parseInt(new String(payload));
}
