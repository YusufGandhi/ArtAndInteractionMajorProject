class SceneWithDialogBox extends Scene {
  DialogBox db;
  float dbX; // x coordinate of dialog box db
  float dbY; // y coordinate of dialog box db

  SceneWithDialogBox() {}
  
  SceneWithDialogBox(String text, float x, float y) {
    db = new DialogBox(text, horrorTextColor);
    dbX = x;
    dbY = y;
  }
  
  void display() {
    db.drawBox(dbX, dbY);//, width-200, 200, 5);

    
  }
  
  void display(int alignX, int alignY, int fontSize) {
    db.drawBox(dbX,dbY,alignX,alignY,fontSize);    
  }
  
  boolean shouldTransition() {
    // transition on click - but you can transition however you like!
    if (db.isDone())
      return mouseDown;
    return false;
  }
}