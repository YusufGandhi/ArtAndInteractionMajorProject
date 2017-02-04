// ----
// Executive Summary:
// Users will have several minutes to learn about different ghost stories 
// of Indonesia
// At the end, there will be 3 / 5 questions about the ghost stories
// If the user fail to answer all questions correctly, he or she will be 'haunted' 
// ----

// to-do:
// color each major island with red the rest with blue

// Plot
// Scene 1:
// Indonesia, a country of thousand islands ..
// of hundreds local dialects..
// and of dozens of ... ghost stories


// Scene 2:
// You have a few minutes to learn different type of ghost of Indonesia
// and you'll take a "death-or-alive" quiz.


// Scene 3:
// ** MAP OF INDONESIA **
// [update 2017-02-02: Indonesia map https://www.borntocontrol.com/assets/css/images/indonesia.png]
// * Users can select the islands:
//   There's a timer on the top right of the screen to limit the study time 

// Java island

import processing.sound.*;

SoundFile backgroundMusic;

float backgroundMusicVolume = 0.7;

boolean mouseDown;
boolean pmouseDown;

color horrorTextColor = color(200, 3, 3);
PFont horrorFont;

int sceneIndex;
int numOfScene;

PImage indonesiaMap;

Scene [] scene;

void setup() {
  fullScreen();
  background(10);
  
  // loading the Indonesia map
  //indonesiaMap = loadImage("indonesia.png");
  
  // index of the scene that the animation will start
  sceneIndex = 0;
  
  // number of scenes 
  numOfScene = 6;
  
  // loading the background music
  backgroundMusic = new SoundFile(this, dataPath("lingsirwengi.mp3"));
  
  horrorFont = createFont("csnpwdt NFI.otf",200);
 
  backgroundMusic.play(0.9);
  scene = new Scene[numOfScene];
  scene[0] = new SceneWithDialogBox("Indonesia, a country of thousand islands...",width/2,height/4);
  scene[1] = new SceneWithDialogBox("of hundreds local dialects...",width/2,height/2);
  scene[2] = new SceneWithDialogBox("and of dozens...",width/2,height/4*3);
  scene[3] = new SceneWithDialogBox("GHOST STORIES",width/2,height/2);
  scene[4] = new SceneWithDialogBox("You have 2 minutes to learn about different ghosts\nfrom different parts of Indonesia",width/2,height/2);
  scene[5] = new SceneIndonesiaMap();
}

void draw() {
  mouseDown = mousePressed && !pmouseDown;
  pmouseDown = mousePressed;
  background(30);
  textFont(horrorFont);
  switch(sceneIndex) {
    case 0:
      displayCurrentScene();
      checkCurrentSceneTransition();
      break;
    case 1:
    case 2:
      displayScenes();
      checkCurrentSceneTransition();
      break;
    case 3:
    case 4:
    case 5:
      displayCurrentScene();
      checkCurrentSceneTransition();
      break;
  }
}

// displaying scenes from index start to end (inclusive)
void displayScenes(int start, int end) {
  for(int i = start; i <= end; i++) {
     scene[i].display(); 
  }
}

void displayScenes() {
  for(int i = 0; i <= sceneIndex; i++) {
    scene[i].display();
  }
}

void displayCurrentScene() {
  scene[sceneIndex].display();
}

void checkCurrentSceneTransition() {
  if(scene[sceneIndex].shouldTransition())
    sceneIndex++; 
}