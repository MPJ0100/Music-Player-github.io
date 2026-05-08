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
//
Minim minim;  // Initiates the Minim library
int numberOfSongs = 8; // Number of songs in the playlist
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs];
int currentSong = 0; // Start with the first song

float songTitleDivX, songTitleDivY, songTitleDivWidth, songTitleDivHeight;
color purpleInk, resetInk;

void setup() {
  size(700, 500); // Set the canvas size

  // Initialize Minim
  minim = new Minim(this);

  // Load songs into the playlist
  for (int i = 0; i < numberOfSongs; i++) {
    String fileName = "song" + (i + 1) + ".mp3"; // song1.mp3, song2.mp3, etc.
    println("Loading file: " + fileName);
    playList[i] = minim.loadFile(fileName);
    if (playList[i] == null) {
      println("Error: Could not load " + fileName);
    } else {
      println("Successfully loaded: " + fileName);
      playListMetaData[i] = playList[i].getMetaData();
    }
  }

  // Initialize colors
  purpleInk = color(128, 0, 128);
  resetInk = color(255);
}

void draw() {
  background(20);

  // Display the current song title
  fill(purpleInk);
  textSize(20);
  textAlign(CENTER, CENTER);
  if (playList[currentSong] != null && playListMetaData[currentSong] != null) {
    text("Now Playing: " + playListMetaData[currentSong].title(), width / 2, height / 4);
  } else {
    text("No song loaded", width / 2, height / 4);
  }
}

void mousePressed() {
  if (playList[currentSong] != null) {
    if (playList[currentSong].isPlaying()) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].play();
    }
  }
}

void keyPressed() {
  if (key == 'n' || key == 'N') {
    if (playList[currentSong] != null) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
    }
    currentSong = (currentSong + 1) % numberOfSongs;
    if (playList[currentSong] != null) {
      playList[currentSong].play();
    }
  } else if (key == 'p' || key == 'P') {
    if (playList[currentSong] != null) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
    }
    currentSong = (currentSong - 1 + numberOfSongs) % numberOfSongs;
    if (playList[currentSong] != null) {
      playList[currentSong].play();
    }
  }
}
