// === Arduino 程式 ===

const int ledPin = 13;
int sensorValue = 0;

void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // 讀取類比數值並傳送到 Processing
  sensorValue = analogRead(A0);
  Serial.println(sensorValue);

  // 接收來自 Processing 的 LED 控制指令
  if (Serial.available()) {
    char cmd = Serial.read();
    if (cmd == '1') {
      digitalWrite(ledPin, HIGH);
    } else if (cmd == '0') {
      digitalWrite(ledPin, LOW);
    }
  }
  delay(1);
}
