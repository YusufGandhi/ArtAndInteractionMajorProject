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
PImage beguGanjang;

Scene [] scene;

void setup() {
  fullScreen();
  background(10);
  
  // loading the Indonesia map
  //indonesiaMap = loadImage("indonesia.png");
  
  // index of the scene that the animation will start
  sceneIndex = 0;
  
  // number of scenes 
  numOfScene = 13;
  
  // loading the background music
  backgroundMusic = new SoundFile(this, dataPath("lingsirwengi.mp3"));
  
  horrorFont = createFont("csnpwdt NFI.otf",50);
 
  backgroundMusic.play(0.9);
  
  // creating all the scenes
  scene = new Scene[numOfScene];
  scene[0] = new SceneWithDialogBox("Indonesia, a country of thousand islands...",width/2,height/4);
  scene[1] = new SceneWithDialogBox("of hundreds local dialects...",width/2,height/2);
  scene[2] = new SceneWithDialogBox("and of dozens...",width/2,height/4*3);
  scene[3] = new SceneWithDialogBox("GHOST STORIES",width/2,height/2);
  scene[4] = new SceneWithDialogBox("You have 2 minutes to learn about different ghosts\nfrom different parts of Indonesia",width/2,height/2);
  scene[5] = new SceneIndonesiaMap();
  scene[6] = new SceneWithDialogBoxAndImage(loadImage("begu-ganjang.jpg"),"Sumatera", width / 2, height /2);//new SceneWithDialogBox("Sumatera", width / 2, height /2);
  scene[7] = new SceneWithDialogBox("Java", width / 2, height /2);
  scene[8] = new SceneWithDialogBox("Kalimantan", width / 2, height /2);
  scene[9] = new SceneWithDialogBox("Sulawesi", width / 2, height /2);
  scene[10] = new SceneWithDialogBox("Maluku", width / 2, height /2);
  scene[11] = new SceneWithDialogBox("Papua", width / 2, height /2);
  scene[12] = new SceneWithDialogBox("Nusa Tenggara", width / 2, height /2);
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
      displayCurrentScene();
      checkCurrentSceneTransition();
      break;
    case 5: // the Indonesia scene map; no transition needed
      displayCurrentScene();
      break;
    
    // scene of each island
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      displayCurrentScene();
      ((SceneIndonesiaMap) scene[5]).displayTimer();
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

void mousePressed() {
  // the mousePressed() method for sceneIndonesia map (index = 5)
  if(sceneIndex == 5) {
    
    // getting the SceneIndonesiaMap object in the scene[5] instance
    // to have an acces to SceneIndonesiaMap object's methods
    SceneIndonesiaMap scene5 = (SceneIndonesiaMap) scene[5];
    
    if(scene5.isOverSumatra()) {
      sceneIndex = 6;
    } else if(scene5.isOverJava()) {
      sceneIndex = 7;
    } else if(scene5.isOverKalimantan()) {
      sceneIndex = 8;
    } else if(scene5.isOverSulawesi()) {
      sceneIndex = 9;
    } else if(scene5.isOverMaluku()) {
      sceneIndex = 10;
    } else if(scene5.isOverPapua()) {
      sceneIndex = 11;
    } else if(scene5.isOverNusaTenggara()) {
      sceneIndex = 12;
    }
  }
}

void keyPressed() {
  // keyPressed() event for each Indonesia island 
  if (sceneIndex >= 6 && sceneIndex <= 12) {
    
    // the user wants to get to the Indonesia map scene
    // by pressing 'b' or 'left-arrow'
    if (keyCode == 37 || keyCode == 66) {
      sceneIndex = 5; 
    }
  }
  
  
}