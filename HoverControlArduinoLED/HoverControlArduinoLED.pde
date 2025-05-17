import processing.serial.*;

Serial myPort;
int bg = 0;
boolean mouseOver = false;

void setup()
{
  size(200, 200);
  background(255);
  printArray(Serial.list());
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  mouseOverRect();
  if (mouseOver) {           // If mouse is over square,
    fill(204);               // change color and
    myPort.write('1');
  } else {                   // If mouse is not over square,
    fill(bg);                // change color and
    myPort.write('0');
  }
  rect(50, 50, 100, 100);    // Draw a square
}

void mouseOverRect() { // Test if mouse is over square
  mouseOver = ((mouseX >= 50) && (mouseX <= 150) &&
               (mouseY >= 50) && (mouseY <= 150));
}

void serialEvent(Serial myPort) {
  bg = myPort.read();
}
