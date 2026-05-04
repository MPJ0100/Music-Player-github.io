
void setup() {
  fullScreen();
}

void draw() {
  background(20);

  int appWidth = width;
  int appHeight = height;

  // ================= LAYOUT SYSTEM =================
  int numberOfButtons = 13;
  float widthOfButton = appWidth / (float)numberOfButtons;
  float beginningButtonSpace = widthOfButton;

  // ================= QUIT BUTTON =================
  float quitX = appWidth - appHeight * 0.08;
  float quitY = 0;
  float quitWidth = appHeight * 0.08;
  float quitHeight = appHeight * 0.08;

  // ================= LEFT PANEL (SONG TITLE) =================
  float songTitleDivX = beginningButtonSpace;
  float songTitleDivY = appHeight * 0.08;
  float songTitleDivWidth = appWidth * 0.5 - beginningButtonSpace * 1.2;
  float songTitleDivHeight = appHeight * 0.15;

  // ================= RIGHT PANEL (MESSAGE AREA) =================
  float messageDIV_X = appWidth * 0.5 + beginningButtonSpace * 0.2;
  float messageDIV_Y = appHeight * 0.08;
  float messageDIV_Width = appWidth * 0.5 - beginningButtonSpace * 1.4;
  float messageDIV_Height = appHeight * 0.55;

  // ================= DRAW DIVS =================
  stroke(255);
  noFill();

  rect(songTitleDivX, songTitleDivY, songTitleDivWidth, songTitleDivHeight);
  rect(messageDIV_X, messageDIV_Y, messageDIV_Width, messageDIV_Height);
  rect(quitX, quitY, quitWidth, quitHeight);

  // ================= FAKE TEXT =================
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);

  text("SONG TITLE AREA", songTitleDivX + songTitleDivWidth/2, songTitleDivY + songTitleDivHeight/2);

  text("MESSAGE / VISUAL AREA", messageDIV_X + messageDIV_Width/2, messageDIV_Y + messageDIV_Height/2);

  text("X", quitX + quitWidth/2, quitY + quitHeight/2);

  // ================= BOTTOM BUTTON STRIP =================
  float buttonY = appHeight * 0.75;
  float buttonH = appHeight * 0.1;

  for (int i = 0; i < numberOfButtons; i++) {
    float x = i * widthOfButton;

    fill(40);
    stroke(255);
    rect(x, buttonY, widthOfButton, buttonH);

    fill(255);
    textSize(12);

    if (i == 6) {
      text("PLAY", x + widthOfButton/2, buttonY + buttonH/2);
    } else if (i == 5) {
      text("PREV", x + widthOfButton/2, buttonY + buttonH/2);
    } else if (i == 7) {
      text("NEXT", x + widthOfButton/2, buttonY + buttonH/2);
    } else {
      text(i, x + widthOfButton/2, buttonY + buttonH/2);
    }
  }
}
