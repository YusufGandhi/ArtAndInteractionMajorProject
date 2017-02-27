class SceneQuizQuestion extends Scene {
  DialogBox question;
  DialogBox answerA;
  DialogBox answerB;
  DialogBox answerC;
  int fontSize;
  
  float centerXAnswer;
  
  float centerYAnswerA;
  float centerYAnswerB;
  float centerYAnswerC;
  
  char correctAnswer;
  
  boolean isAnswered;
  
  SceneQuizQuestion(String q, String a, String b, String c, char answer) {
    question = new DialogBox(q,horrorTextColor);
    answerA = new DialogBox("A. " + a, horrorTextColor);
    answerB = new DialogBox("B. " + b, horrorTextColor);
    answerC = new DialogBox("C. " + c, horrorTextColor);
    fontSize = 50;
    
    centerXAnswer = width / 2;

  
    centerYAnswerA = height / 2;
    centerYAnswerB = height / 2 + 100;
    centerYAnswerC = height / 2 + 200;
    
    correctAnswer = answer;
    
    isAnswered = false;
  }
  
  void display() {
    question.drawBox(width / 2,height / 5,CENTER,CENTER,fontSize);
    if(isOverAnswerA()) {
      answerA.drawBox(centerXAnswer, centerYAnswerA, CENTER, CENTER, fontSize, color(150,3,3));
      answerB.drawBox(centerXAnswer, centerYAnswerB, CENTER, CENTER, fontSize);
      answerC.drawBox(centerXAnswer, centerYAnswerC, CENTER, CENTER, fontSize);
    } else if(isOverAnswerB()) {
      answerA.drawBox(centerXAnswer, centerYAnswerA, CENTER, CENTER, fontSize);
      answerB.drawBox(centerXAnswer, centerYAnswerB, CENTER, CENTER, fontSize, color(150,3,3));
      answerC.drawBox(centerXAnswer, centerYAnswerC, CENTER, CENTER, fontSize);
    } else if(isOverAnswerC()) {
      answerA.drawBox(centerXAnswer, centerYAnswerA, CENTER, CENTER, fontSize);
      answerB.drawBox(centerXAnswer, centerYAnswerB, CENTER, CENTER, fontSize);
      answerC.drawBox(centerXAnswer, centerYAnswerC, CENTER, CENTER, fontSize, color(150,3,3));
    }
    else {
      answerA.drawBox(centerXAnswer, centerYAnswerA, CENTER, CENTER, fontSize);
      answerB.drawBox(centerXAnswer, centerYAnswerB, CENTER, CENTER, fontSize);
      answerC.drawBox(centerXAnswer, centerYAnswerC, CENTER, CENTER, fontSize);
    }
    
  }
  
  boolean shouldTransition() {
    return isAnswered;
  }
  
  boolean isOverAnswerA() {
    if(mouseY >= centerYAnswerA - 50 && mouseY <= centerYAnswerA + 50) {
      return true;
    }
    return false;
  }
  
  boolean isOverAnswerB() {
    if(mouseY >= centerYAnswerB - 50 && mouseY <= centerYAnswerB + 50) {
      return true;
    }
    return false; 
  }
  
  boolean isOverAnswerC() {
    if(mouseY >= centerYAnswerC - 50 && mouseY <= centerYAnswerC + 50) {
      return true;
    }
    return false;  
  }
  
  boolean checkAnswer(char answer) {
    if (answer == correctAnswer)
      return true;
    return false;
  }
}