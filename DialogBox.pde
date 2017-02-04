class DialogBox {
  String boxText;
  int charCounter;
  int displayCounter;
  color textColor;

  DialogBox(String boxText, color c){
    charCounter = 0;
    displayCounter = 0;
    this.boxText = boxText;
    textColor = c;
  }

  void drawBox(float x, float y) {//, float boxWidth, float boxHeight, int wordRate){
    // if you want a "background box", put the drawing code here


    // set text colour and size
    fill(textColor);//240);
    textSize(30);
    
    textAlign(CENTER, CENTER);
    text(boxText, x, y); //, boxWidth, boxHeight);
    
    // draw the text (one char at a time)
    //text(boxText.substring(0, charCounter), x, y, width, height);
 
    //if (displayCounter % wordRate == 0 && charCounter < boxText.length()) {
    //  charCounter++;
    //}
    //displayCounter++;
    // end of drawing the text (one char at a time)
  }

  boolean isDone() {
    return true;
    //return charCounter >= boxText.length();
  }
}