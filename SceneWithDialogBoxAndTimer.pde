class SceneWithDialogBoxAndTimer extends SceneWithDialogBox {
  int timer;
  boolean timerStarted;
  int initialTimerDuration;
  
  // the timer passed in seconds (NOT milliseconds)
  SceneWithDialogBoxAndTimer(String text, float x, float y, int t) {
    super(text, x, y);
    timer = t * 1000;
    initialTimerDuration = t;
  }
  
  void display() {
    super.display();
    startTimer();
  }
  
  void display(int alignX, int alignY, int fontSize) {
    super.display(alignX,alignY,fontSize);
    startTimer();
  }
  
  boolean startTimer() {
    if(!timerStarted) {
      timer = millis() + timer;
      timerStarted = true;
    }
    return timerStarted;
  }
  
  boolean shouldTransition() {
    if(timerStarted) {
      return (timer - millis() <= 0);  
    }
    return false;
  }
  
  void resetTimer() {
    timer = initialTimerDuration * 1000;
    timerStarted = false;
  }
  
}