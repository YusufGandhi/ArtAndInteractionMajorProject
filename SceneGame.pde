// Suanggi game
class SceneGame extends Scene {
  ArrayList<GameObject> go;
  int numberOfMonsters;
  
  SceneGame() {
    PImage img = loadImage("suanggi.jpg");
    go = new ArrayList<GameObject>();
    numberOfMonsters = 10;
    randomSeed(10);
    for (int i = 0; i < numberOfMonsters; i++) {
      println(width - img.width);
      go.add(new GameObject(img,random(width - img.width),random(height - img.height)));
    }
  }
  
  void display() {
    for(GameObject g : go)
      g.display();
  }
  
  boolean shouldTransition() {
    return numberOfMonsters == 0;
  }
}