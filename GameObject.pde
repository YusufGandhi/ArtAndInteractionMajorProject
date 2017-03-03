class GameObject {
  PImage objImg;
  float posX;
  float posY;
  boolean isKilled;
  float scale;
  int strikeCount;
  
  GameObject(PImage i, float x, float y) {
    objImg = i;
    posX = x;
    posY = y;
    isKilled = false;
    println("GameObject created at " + x + ", " + y);
    scale = 0.1;
    strikeCount = 3;
  }
  
  void display() {
    if(!isKilled){
      pushMatrix();
      translate(posX - (objImg.width * scale / 2), posY - (objImg.height * scale / 2));
      //translate(posX, posY);
      scale(scale);
      image(objImg,0,0);
      stroke(200,3,3);
      strokeWeight(2);
      line(0,0,objImg.width / 3 * strikeCount,0);
      popMatrix();
      
      if(scale < 0.5)
        scale += 0.01;
      
    }
  }
  
  boolean isMouseOver() {
    if(sq(posX - mouseX) + sq(posY - mouseY) <= 40000){
      return true; 
    }
    return false;
  }
  
}