class SceneIndonesiaMap extends Scene {
  PImage [] indonesiaMap;
  int numOfMapImage;
  int indexOfDisplayedImage;
  float topLeftCornerCoordX;
  float topLeftCornerCoordY;
  Timer timer;
  DialogBox db; // for containing the name of the island

  SceneIndonesiaMap() {
    db = new DialogBox("", horrorTextColor);
    numOfMapImage = 8;
    indexOfDisplayedImage = 0;
    indonesiaMap = new PImage[numOfMapImage];
    indonesiaMap[0] = loadImage("indonesia_map_vector_blue_2.png");
    indonesiaMap[1] = loadImage("indonesia_map_vector_blue_2_sumatra_red.png");
    indonesiaMap[2] = loadImage("indonesia_map_vector_blue_2_java_red.png");
    indonesiaMap[3] = loadImage("indonesia_map_vector_blue_2_kalimantan_red.png");
    indonesiaMap[4] = loadImage("indonesia_map_vector_blue_2_sulawesi_red.png");
    indonesiaMap[5] = loadImage("indonesia_map_vector_blue_2_maluku_red.png");
    indonesiaMap[6] = loadImage("indonesia_map_vector_blue_2_papua_red.png");
    indonesiaMap[7] = loadImage("indonesia_map_vector_blue_2_nusatenggara_red.png");
    topLeftCornerCoordX = width/2-indonesiaMap[indexOfDisplayedImage].width/2;
    topLeftCornerCoordY = height/2-indonesiaMap[indexOfDisplayedImage].height/2;
    println("Indonesia Map's size: " + indonesiaMap[indexOfDisplayedImage].width + "x" + indonesiaMap[indexOfDisplayedImage].height);

    timer = new Timer();
  }

  void display() {
    if (!timer.running) {
      timer.start();
    }
    //background(250);
    pushMatrix();
    //scale(1.5);
    translate(topLeftCornerCoordX, topLeftCornerCoordY);
    image(indonesiaMap[indexOfDisplayedImage], 0, 0);
    popMatrix();

    // showing the timer on the topleftcorner
    displayTimer();

    // navigation
    textSize(30);
    textAlign(LEFT, CENTER);
    text("Click on any major island", 20, height - 20);

    this.checkMousePosition();
    //System.out.println(mouseX + " " + mouseY);
  }

  void displayTimer() {
    pushMatrix();
    translate(width/2, 100);
    textAlign(CENTER, CENTER);
    text(timer.display(), 0, 0);
    popMatrix();
  }

  boolean shouldTransition() {
    return this.timer.isTimeUp();
  }

  void checkMousePosition() {
    if (this.isOverSumatra()) {
      indexOfDisplayedImage = 1;
      db.boxText = "Sumatra";
    } else if (this.isOverJava()) {
      indexOfDisplayedImage = 2;
      db.boxText = "Java";
    } else if (this.isOverKalimantan()) {
      indexOfDisplayedImage = 3;
      db.boxText = "Kalimantan";
    } else if (this.isOverSulawesi()) {
      indexOfDisplayedImage = 4;
      db.boxText = "Sulawesi";
    } else if (this.isOverMaluku()) {
      indexOfDisplayedImage = 5;
      db.boxText = "Maluku";
    } else if (this.isOverPapua()) {
      indexOfDisplayedImage = 6;
      db.boxText = "Papua";
    } else if (this.isOverNusaTenggara()) {
      indexOfDisplayedImage = 7;
      db.boxText = "Bali-Nusa Tenggara";
    } else {
      indexOfDisplayedImage = 0;
      db.boxText = "";
    }

    db.drawBox(width/2, height / 8 * 7);
  }

  // sumatra's width is topLeftCornerCoordX + 400
  // sumatra's height is topLeftCornerCoordY + 500
  boolean isOverSumatra() {
    boolean result = false;
    if ((mouseX >= topLeftCornerCoordX && mouseX <= topLeftCornerCoordX + 250) && (mouseY >= topLeftCornerCoordY && mouseY <= topLeftCornerCoordY + 250))
      result = true;
    return result;
  }

  // java's position is topLeftCornerCoordX + 400
  // sumatra's height is topLeftCornerCoord
  boolean isOverJava() {
    boolean result = false;
    float xPos = topLeftCornerCoordX + 200;
    float yPos = topLeftCornerCoordY + 225;
    if ((mouseX >= xPos  && mouseX <= xPos + 200) && (mouseY >= yPos  && mouseY <= yPos + 100))
      result = true;
    return result;
  }

  // kalimantan uses the right edge of sumatra
  // and the top edge of java as the border
  boolean isOverKalimantan() {
    boolean result = false;
    float xPos = topLeftCornerCoordX + 250;
    float yPos = topLeftCornerCoordY;
    if ((mouseX >= xPos  && mouseX <= xPos + 200) && (mouseY >= yPos  && mouseY <= yPos + 200))
      result = true;
    return result;
  }

  // sulawesi is using the right edge of kalimantan
  // and the top edge of jawa as a border
  boolean isOverSulawesi() {
    boolean result = false;
    float xPos = topLeftCornerCoordX + 400;
    float yPos = topLeftCornerCoordY;
    if ((mouseX >= xPos  && mouseX <= xPos + 150) && (mouseY >= yPos  && mouseY <= yPos + 225))
      result = true;
    return result;
  }

  // maluku uses the right edge of sulawesi
  boolean isOverMaluku() {
    boolean result = false;
    float xPos = topLeftCornerCoordX + 550;
    float yPos = topLeftCornerCoordY;
    if ((mouseX >= xPos  && mouseX <= xPos + 200) && (mouseY >= yPos  && mouseY <= yPos + 200))
      result = true;
    return result;
  }

  boolean isOverPapua() {
    boolean result = false;
    float xPos = topLeftCornerCoordX + 750;
    float yPos = topLeftCornerCoordY;
    if ((mouseX >= xPos  && mouseX <= xPos + 200) && (mouseY >= yPos  && mouseY <= yPos + 300))
      result = true;
    return result;
  }

  boolean isOverNusaTenggara() {
    boolean result = false;
    float xPos = topLeftCornerCoordX + 450;
    float yPos = topLeftCornerCoordY + 225;
    if ((mouseX >= xPos  && mouseX <= xPos + 300) && (mouseY >= yPos  && mouseY <= yPos + 100))
      result = true;
    return result;
  }
}