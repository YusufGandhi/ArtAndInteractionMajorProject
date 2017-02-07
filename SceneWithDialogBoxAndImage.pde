class SceneWithDialogBoxAndImage extends SceneWithDialogBox {
  PImage img;
  float imgX;
  float imgY;
  
  SceneWithDialogBoxAndImage(PImage img, String text, float dbX, float dbY) {
    super(text,dbX,dbY);
    this.img = img;
    
    // by default, the image will be the center of the left side of the screen
    this.imgX = width / 4 - this.img.width / 2;
    this.imgY = height / 2 - this.img.height / 2;
  }
  
  void display() {
    super.display();
    image(img,imgX,imgY);
  }
  
}