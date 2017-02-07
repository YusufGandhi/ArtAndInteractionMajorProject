class Timer {
  int startTime;
  int stopTime;
  boolean running; 
  
  Timer() {
    startTime = 0; 
    stopTime = 0;
    running = false;
  }
  
  void start() {
    startTime = millis() + 121000; // 2 minutes in milliseconds
    running = true;
  }
  
  void stop() {
    stopTime = millis();
    running = false; 
  }
  
  int getElapsedTime() {
    int elapsed;
    if(running) {
      elapsed = (startTime - millis()); 
    }
    else {
      elapsed = stopTime - startTime; 
    }
    
    return elapsed;
  }
  
  int getSecond() {
    return (this.getElapsedTime() / 1000) % 60;  
  }
  
  int getMinute() {
    return (this.getElapsedTime() / (1000 * 60)) % 60;
  }
  
  String display() {
     return getMinute() + ":" + nf(getSecond(),2); 
  }
  
  
}