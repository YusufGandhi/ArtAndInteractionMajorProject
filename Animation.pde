// inspired by: https://processing.org/examples/animatedsprite.html

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int addFactor;

  Animation(PImage[] img, int count) {
    imageCount = count;
    images = img;
    frame = 0;
    addFactor = 1;
  }
  
  void display(float xpos, float ypos) {
    // direction 0: facing forward
    // direction 1: facing left
    // direction 2: facing right
    // direction 3: facing backward
    if (frameCount % 10 == 0) {
      frame = (frame+1) % imageCount; // frame + addFactor;
      //if (frame == 0 || frame == imageCount - 1)
      //  addFactor = -addFactor;
    }
    image(images[frame], xpos, ypos);
  }

  int getWidth() {
    if (images != null)
      return images[0].width;
    return 0;
  }
}