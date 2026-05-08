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
int currentSong = 0; // Start with the first song
float appWidth, appHeight;
float widthOfButton;
int numberOfButtons = 8; // Number of buttons (one for each song)
float buttonY, buttonHeight;
int hoveredButton = -1; // Tracks which button is being hovered over

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
}

void draw() {
  background(20); // Set background color

  // Draw buttons for each song
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

    // Draw button labels (song numbers)
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Song " + (i + 1), x + widthOfButton / 2, buttonY + buttonHeight / 2);
  }

  // Display current song title
  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  if (playList[currentSong] != null) {
    text("Now Playing: Song " + (currentSong + 1), width / 2, height / 4);
  } else {
    text("No song loaded", width / 2, height / 4);
  }
}

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

    // Stop the current song if playing
    if (playList[currentSong] != null && playList[currentSong].isPlaying()) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
    }

    // Play the selected song
    currentSong = buttonIndex;
    if (playList[currentSong] != null) {
      playList[currentSong].play();
    }
  }
}

void keyPressed() {
  // Add keyboard shortcuts for controlling playback
  if (key == 'p' || key == 'P') {
    // Play or pause the current song
    if (playList[currentSong] != null) {
      if (playList[currentSong].isPlaying()) {
        playList[currentSong].pause();
      } else {
        playList[currentSong].play();
      }
    }
  } else if (key == 's' || key == 'S') {
    // Stop the current song
    if (playList[currentSong] != null) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
    }
  } else if (key == 'q' || key == 'Q') {
    // Exit the program
    exit();
  }
}
