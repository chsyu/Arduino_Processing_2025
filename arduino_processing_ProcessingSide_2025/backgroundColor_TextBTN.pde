import processing.serial.*;

Serial myPort;
int sensorValue = 0;
boolean ledOn = false;

void setup() {
  size(400, 400);
  //println(Serial.list()); // print Serial Port
  //println(Serial.list()[3]);
  myPort = new Serial(this, Serial.list()[3], 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  // Setting Background Color by Arduino's Input
  int c = (int)map(sensorValue, 0, 1023, 0, 255);
  background(c, 100, 150);

  // Draw 
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(24);
  text(ledOn ? "LED ON" : "LED OFF", width / 2, height - 40);
}

void serialEvent(Serial myPort) {
  String inString = trim(myPort.readStringUntil('\n'));
  if (inString != null) {
    try {
      sensorValue = Integer.parseInt(inString);
    } catch (NumberFormatException e) {
      println("Data Error !!" + inString);
    }
  }
}

void mousePressed() {
  ledOn = !ledOn;
  myPort.write(ledOn ? '1' : '0');
}
