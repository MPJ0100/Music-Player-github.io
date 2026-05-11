/* Music App, Final Project
*/
//
//Minim Libary
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables
Minim minim;
AudioPlayer[] playList = new AudioPlayer[8]; // Array for 8 music tracks
String[] songTitles = { // Titles for each song
  "Song 1: Beat_Your_Competition",
  "Song 2: Cycles",
  "Song 3: Eureka",
  "Song 4: Ghost_Walk",
  "Song 5: groove",
  "Song 6: Newsroom",
  "Song 7: Start_Your_Engines",
  "Song 8: The_Simplest"
};
int currentSong = 0; // Start with the first song
float appWidth, appHeight;
float widthOfButton;
int numberOfButtons = 5; // Buttons: Prev, Play, Pause, Next, Stop
float buttonY, buttonHeight;
int hoveredButton = -1; // Tracks which button is being hovered over

// Button labels
String[] buttonLabels = {"⏮", "⏵", "⏸", "⏭", "⏹"}; // Music symbols for buttons

// Font for displaying symbols
PFont symbolFont;

void setup() {
  size(800, 600); // Set the canvas size
  appWidth = width;
  appHeight = height;
  widthOfButton = appWidth / numberOfButtons; // Calculate the width of each button

  // Set button dimensions
  buttonY = appHeight * 0.75; // Position buttons at 75% of the screen height
  buttonHeight = appHeight * 0.1; // Height of each button

  // Initialize Minim and load 8 music tracks
  minim = new Minim(this);
  playList[0] = minim.loadFile("Beat_Your_Competition.mp3");
  playList[1] = minim.loadFile("Cycles.mp3");
  playList[2] = minim.loadFile("Eureka.mp3");
  playList[3] = minim.loadFile("Ghost_Walk.mp3");
  playList[4] = minim.loadFile("groove.mp3");
  playList[5] = minim.loadFile("Newsroom.mp3");
  playList[6] = minim.loadFile("Start_Your_Engines.mp3");
  playList[7] = minim.loadFile("The_Simplest.mp3");

  // Load a font that supports symbols
  symbolFont = createFont("Arial Unicode MS", 32); // Use a font that supports music symbols
  textFont(symbolFont); // Set the font for the sketch
} // End Setup

void draw() {
  background(20); // Set background color

  // Draw buttons
  for (int i = 0; i < numberOfButtons; i++) {
    float x = i * widthOfButton; // Calculate x position for each button

    // Change color if the button is hovered
    if (i == hoveredButton) {
      fill(80); // Hover color
    } else {
      fill(40); // Default button color
    }

    stroke(255); // Button border color
    rect(x, buttonY, widthOfButton, buttonHeight); // Draw the button

    // Draw button labels
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text(buttonLabels[i], x + widthOfButton / 2, buttonY + buttonHeight / 2);
  }

  // Display current song title
  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  if (playList[currentSong] != null && playList[currentSong].isPlaying()) {
    text("Now Playing: " + songTitles[currentSong], width / 2, height / 4);
  } else {
    text("No song playing", width / 2, height / 4);
  }
} // End Draw

void mouseMoved() {
  // Detect which button is being hovered over
  if (mouseY > buttonY && mouseY < buttonY + buttonHeight) {
    hoveredButton = int(mouseX / widthOfButton);
  } else {
    hoveredButton = -1; // No button is hovered
  }
}

void mousePressed() {
  // Detect which button was clicked
  if (mouseY > buttonY && mouseY < buttonY + buttonHeight) {
    int buttonIndex = int(mouseX / widthOfButton);

    // Perform actions based on the button clicked
    if (buttonIndex == 0) { // Prev button
      playPreviousSong();
    } else if (buttonIndex == 1) { // Play button
      playCurrentSong();
    } else if (buttonIndex == 2) { // Pause button
      pauseCurrentSong();
    } else if (buttonIndex == 3) { // Next button
      playNextSong();
    } else if (buttonIndex == 4) { // Stop button
      stopCurrentSong();
    }
  }
} // End Mouse Pressed

void keyPressed() {
  // Add keyboard shortcuts for controlling playback
  if (key == 'p' || key == 'P') {
    playCurrentSong();
  } else if (key == 's' || key == 'S') {
    stopCurrentSong();
  } else if (key == 'n' || key == 'N') {
    playNextSong();
  } else if (key == 'q' || key == 'Q') {
    exit(); // Exit the program
  }
} // End Key Pressed

// Helper Functions
void playCurrentSong() {
  if (playList[currentSong] != null) {
    playList[currentSong].play();
  }
}

void pauseCurrentSong() {
  if (playList[currentSong] != null) {
    playList[currentSong].pause();
  }
}

void stopCurrentSong() {
  if (playList[currentSong] != null) {
    playList[currentSong].pause();
    playList[currentSong].rewind();
  }
}

void playNextSong() {
  if (playList[currentSong] != null) {
    playList[currentSong].pause();
    playList[currentSong].rewind();
  }
  currentSong = (currentSong + 1) % playList.length;
  if (playList[currentSong] != null) {
    playList[currentSong].play();
  }
}

void playPreviousSong() {
  if (playList[currentSong] != null) {
    playList[currentSong].pause();
    playList[currentSong].rewind();
  }
  currentSong = (currentSong - 1 + playList.length) % playList.length;
  if (playList[currentSong] != null) {
    playList[currentSong].play();
  }
}
