  // ----
// Executive Summary:
// Users will have several minutes to learn about different ghost stories 
// of Indonesia
// At the end, there will be 3 / 5 questions about the ghost stories
// If the user fail to answer all questions correctly, he or she will be 'haunted' 
// ----

// Credit:
// Mariaban image: https://2.bp.blogspot.com/-D-eifH_EtjY/U-HPMUySuzI/AAAAAAAAAmA/bOLdRv-lGVU/s400/tiamat.jpg
// Suangi image: https://travel.detik.com/read/2015/09/21/191008/3024899/1519/suanggi-hantu-yang-paling-ditakuti-orang-papua
// Pocong image: http://gambar88.com/wp-content/uploads/2016/08/foto-foto-pocong-paling-seram-spot-misteri-pertaining-to-download-gambar-pocong-db-bagus-seiring-dengan-indah-download-gambar-pocong-menyinggung-rumah.png
// Sundel bolong: http://img2.wikia.nocookie.net/__cb20140516200124/dreadout/images/thumb/2/2d/2014-05-16_00079.jpg/640px-2014-05-16_00079.jpg
// Kuntilanak: http://1.bp.blogspot.com/_kdI2XIp5bCE/S-tgIfPeCSI/AAAAAAAAAYg/WF-J_Cjmm6c/s320/kuntilanak.jpg

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
SceneWithDialogBoxAndTimer sceneCorrectAnswer;
SceneWithDialogBoxAndTimer sceneIncorrectAnswer;

ArrayList<Boolean> correctQuizAnswers;
int sceneQuiz;

void setup() {
  fullScreen();
  background(10);
  
  correctQuizAnswers = new ArrayList<Boolean>();
  
  // loading the Indonesia map
  //indonesiaMap = loadImage("indonesia.png");
  
  
  
  // loading the background music
  backgroundMusic = new SoundFile(this, dataPath("lingsirwengi.mp3"));
  
  horrorFont = createFont("csnpwdt NFI.otf",50);
 
  // uncomment this to play the song again
  //backgroundMusic.play(0.9);
  
  // Ghost descriptions
  String beguGanjangDesc = "Begu Ganjang\n" + 
                           "A traditional ghost known among Tapanuli\n" +  
                           "people of North Sumatra.\n" + 
                           "Begu Ganjang is depicted as a ghost whose\nheight reaches the sky.\n\n" + 
                           "Begu Ganjang is a slave of a human master.\n" + 
                           "The master is able to order Begu Ganjang\n" + 
                           "to kill other people or steal from them.";
                           
  String mariabanDesc = "Mariaban\n" + 
                        "A kind of monster living in deep jungles of\n" +
                        "Kalimantan.\n" +
                        "Mariabans are huge and hairy.\n" +
                        "Their hairs are known to be able\nto cast a spell on women.\n\n" + 
                        "Their favourite delicacy is fresh human blood\n" +
                        "from those who are alone and lost in\n" + 
                        "wild Kalimantan jungles...";
  
  // create a suanggi gameplay
  // "Unfortunately, a Papuan shaman is sending you Suanggi. Kill the Suanggis before they kill you!"
  String suanggiDesc = "Suanggi\n" + 
                       "Local Papuans describe them as\nthe flying, firey ball ghosts.\n\n" +
                       "Suanggi is actually a form of black magic\n" +
                       "It is sent by shamans to those the\nblack wizards want to kill..";
  
  String pocongDesc = "Pocong\n" + 
                      "Pocong is the undead.\n" +
                      "It is an Indonesian muslim tradition to\n" +
                      "wrap a dead body in a plain, white sheet.\n" +
                      "The body is tied with rope to tighten\nthe sheet\n\n" +
                      "Pocong roams the earth by jumping forward\n" +
                      "The only body part that can be seen is\nits face" + 
                      " and it becomes handy\nwhen meal time comes...";
                      
  String sundelBolongDesc = "Sundel Bolong\n" + 
                            "The legendary, Indonesian female ghost.\nThe story " +
                            "has been told in\nmajor Indonesian horror movies\n\n" + 
                            "Sundel Bolong is a woman with big hollows\n" +
                            "on her belly and back.\n" +
                            "You can see right into her gut and\nwhatever food " +
                            "she has just consumed..";
                            
  String kuntilanakDesc = "Kuntilanak\n" +
                          "Another legendary female ghost.\n" +
                          "Kuntilanak is also known as Poti in\nNusa Tenggara.\n\n" +
                          "She wears a clean, white robe. She has\nlong hair " + 
                          "and a pale face. She usually\nresides " +
                          "on a big, creepy tree.\n\n" +
                          "She is wandering to look for her\n" +
                          "dead child. And you can know her by\n" +
                          "her signature laughter";
                          
  String leakDesc = "Leak\n" +
                    "Leak was a human who happened to know\n" +
                    "black magic. ";
  
  // index of the scene that the animation will start
  sceneIndex = 0;
  
  // number of scenes 
  numOfScene = 23;
  
  // creating all the scenes
  scene = new Scene[numOfScene];
  scene[0] = new SceneWithDialogBox("Indonesia, a country of thousand islands...",width/2,height/4);
  scene[1] = new SceneWithDialogBox("of hundreds local dialects...",width/2,height/2);
  scene[2] = new SceneWithDialogBox("and of dozens...",width/2,height/4*3);
  scene[3] = new SceneWithDialogBox("GHOST STORIES",width/2,height/2);
  scene[4] = new SceneWithDialogBox("You have 2 minutes to learn about different ghosts\nfrom different parts of Indonesia",width/2,height/2);
  scene[5] = new SceneIndonesiaMap();
  
  // Sumatra
  scene[6] = new SceneWithDialogBoxAndImage(loadImage("begu-ganjang2.jpeg"),beguGanjangDesc, width / 2, height /2);//new SceneWithDialogBox("Sumatera", width / 2, height /2);
  
  // Java
  scene[7] = new SceneWithDialogBoxAndImage(loadImage("sundel-bolong.jpg"),sundelBolongDesc, width / 2, height /2);
  
  // Kalimantan
  // the fact that one of the cities in Kalimantan island literally is translated to Kuntilanak
  scene[8] = new SceneWithDialogBoxAndImage(loadImage("mariaban.jpg"),mariabanDesc, width / 2, height /2);
  
  // Sulawesi
  scene[9] = new SceneWithDialogBoxAndImage(loadImage("pocong.png"),pocongDesc, width / 2, height /2); //
  
  // Maluku
  scene[10] = new SceneWithDialogBoxAndImage(loadImage("kuntilanak.jpg"),kuntilanakDesc, width / 2, height /2); 
  
  // Papua
  scene[11] = new SceneWithDialogBoxAndImage(loadImage("suanggi.jpg"),suanggiDesc, width / 2, height /2);
  
  // Nusa Tenggara
  // Poti seperti kuntilanak
  scene[12] = new SceneWithDialogBoxAndImage(loadImage("leak.jpeg"),leakDesc, width / 2, height /2);
  
  // ******** THE QUIZ SECTION *********
  // Scene 13 - 19
  // Q1 = Scene 15
  // Q2 = Scene 16
  int quizSectionStartIndex = 13;
  // Time is up scene
  scene[quizSectionStartIndex++] = new SceneWithDialogBoxAndTimer("time's up!",width/2,height/2,2);
  
  scene[quizSectionStartIndex++] = new SceneWithDialogBoxAndTimer("Now's the time for the quiz",width/2,height/2,2);
  
  // Question #1
  scene[quizSectionStartIndex++] = new SceneQuizQuestion("Question #1\nHow tall is Begu Ganjang?","Short","Medium","Tall",'A');
  
  // Question #2
  scene[quizSectionStartIndex++] = new SceneQuizQuestion("Question #2\nWhat's the name of the fire ghost?","Mariaban","Suanggi","Kuntilanak",'B');
  
  // Question #3
  scene[quizSectionStartIndex++] = new SceneQuizQuestion("Question #3","","","",'A');
  
  // Question #4
  scene[quizSectionStartIndex++] = new SceneQuizQuestion("Question #4","","","",'A');
  
  // Question #5
  scene[quizSectionStartIndex] = new SceneQuizQuestion("Question #5","","","",'A');
  
  
  // scene for correct or incorrect answer
  scene[20] = new SceneWithDialogBoxAndTimer("Correct", width / 2, height / 2, 2);
  scene[21] = new SceneWithDialogBoxAndTimer("Incorrect", width / 2, height / 2, 2);
  
  scene[22] = new SceneWithDialogBox("Game Over", width/2,height/2);
  
}

void draw() {
  mouseDown = mousePressed && !pmouseDown;
  pmouseDown = mousePressed;
  background(0);
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
      if(scene[5].shouldTransition()) {
        sceneIndex = 13;
      }
      break;
    // --- the quiz scenes   ----
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      // sceneQuiz is used to detect the current
      // sceneIndex
      sceneQuiz = sceneIndex;
      
      displayCurrentScene();
      checkCurrentSceneTransition();
      displayCheckMark();                                    
      resetTransitionScene();
      break;
    
    // correct or incorrect answer scenes
    case 20:
    case 21:
      displayCurrentScene();
      checkCurrentQuizTransition();
      displayCheckMark();
      break;
      
    case 22:
      displayCurrentScene();
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

void checkCurrentQuizTransition() {
  if(scene[sceneIndex].shouldTransition())
    if (sceneQuiz < 19)
      sceneIndex = sceneQuiz + 1;
    else
      sceneIndex = 22;
}


void checkCurrentSceneTransition() {
  if(scene[sceneIndex].shouldTransition())
    sceneIndex++; 
}

void resetTransitionScene() {
  ((SceneWithDialogBoxAndTimer) scene[20]).resetTimer();
  ((SceneWithDialogBoxAndTimer) scene[21]).resetTimer();
}

// @param idx the index where the scene wants to transition
void checkSceneTransition(Scene s, int idx) {
  if(s.shouldTransition()) {
    println("Should transition executed");
    sceneIndex = idx;
  }
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
  // ==== QUIZ MOUSE PRESSED EVENT ====
  
  else if (sceneIndex >= 15 && sceneIndex <= 19) {
    SceneQuizQuestion sq = (SceneQuizQuestion) scene[sceneIndex];
    Boolean answer = null;
    if(sq.isOverAnswerA()) {
      answer = sq.checkAnswer('A');
      sq.isAnswered = true;
    } else if(sq.isOverAnswerB()) {
      answer = sq.checkAnswer('B');
      sq.isAnswered = true;
    } else if(sq.isOverAnswerC()) {
      answer = sq.checkAnswer('C');
      sq.isAnswered = true;
    }
    
    // put the answer into an array list
    // if the answer is not null
    if (answer != null) {
      if (answer == true) {
        sceneIndex = 20;
      } else {
        sceneIndex = 21;
      }
      correctQuizAnswers.add(answer);
    }
  }
}

void keyPressed() {
  // event for each Indonesia island 
  if (sceneIndex >= 6 && sceneIndex <= 12) {    
    // the user wants to get to the Indonesia map scene
    // by pressing 'b' or 'left-arrow'
    if (keyCode == 37 || keyCode == 66) {
      sceneIndex = 5; 
    }
  } 
}

// This is for displaying correct/incorrect quiz answers
void displayCheckMark() {
    for(int i = 0; i < 5; i++) {
      stroke(250,3,3,255);
      if(i < correctQuizAnswers.size()) {
        if(correctQuizAnswers.get(i)) {
          stroke(3,200,3,255);
          fill(0,200,0);
        } else {
          fill(255,3,3);
        }
      } else {
        fill(0);
      }
      //rect(25 * i, 10, 20, 20);
      ellipse(25 * i + 10, 10,   20, 20);
    }
}