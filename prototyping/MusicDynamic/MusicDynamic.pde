/* Library Notes
 - File / Sketch / Import Library / Manage Libraries
 - Documentation: https://code.compartmental.net/minim/
 
 */
//Library - Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;  //initates entire class
int numberOfSongs = 8; //Best Practcie
int numberOfSoundEffect = 1;
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffect ];
int currentSong = numberOfSongs - numberOfSongs; //ZERO, Math Property
//
void setup() {
  //Display
  size( 700, 500 ); //width //height
  //fullScreen();  //displayWidth //displayHeight
  int appWidth = width; //Best Practice
  int appHeight = height;
  //
  //Music Loading - STRUCTURED Review
  minim = new Minim(this); //Manditory
  String upArrow = "..";
  String open = "/";
  String musicFolder = "Music"; //Developer Specific
  String soundEffectsFolder = "Sound Effects"; //Developer Specific
  String dependanciesFolder = "Dependencies"; //Developer Specific
  //
  String[] songName = new String[numberOfSongs];
  songName[currentSong] = "Beat_Your_Competition";
  currentSong++;
  songName[currentSong] = "Cycles";
  currentSong++;
  songName[currentSong] = "Eureka";
  currentSong++;
  songName[currentSong] = "Ghost_Walk";
  currentSong++;
  songName[currentSong] = "groove";
  currentSong++;
  songName[currentSong] = "Newsroom";
  currentSong++;
  songName[currentSong] = "Start_Your_Engines";
  currentSong++;
  songName[currentSong] = "The_Simplest";
  currentSong=0;
  //
  /* Alternate Song Name Text
   String songName1 = "groove";
   String songName2 = "Beat_Your_Competition";
   String songName3 = "Cycles";
   String ongName4 = "Eureka";
   String ongName5 = "Ghost_Walk";
   String ongName7 = "Newsroom";
   String ongName8 = "Start_Your_Engines";
   String ongName9 = "The_Simplest";
   */
  String soundEffect1 = "Car_Door_Closing";
  String fileExtension_mp3 = ".mp3";
  //
  //CAUTION: Mistakes Below
  String musicDirectory = upArrow + open + upArrow + open + dependanciesFolder + open + musicFolder + open ; //Concatenation
  String soundEffectsDirectory = upArrow + open + upArrow + open + dependanciesFolder + open + soundEffectsFolder + open ; //Concatenation
  String pathway;
  for ( int i=0; i<numberOfSongs; i++ ) {
    pathway = musicDirectory + songName[i] + fileExtension_mp3; //TO BE Rewritten and deleted once file is LOADED
    println("Insdei FOR, pathway:", pathway);
    playList[ currentSong ] = minim.loadFile( pathway ); //ERROR: Verify Spelling & Library installed, Sketch / Import Library
  }
  pathway = soundEffectsDirectory + soundEffect1 + fileExtension_mp3; //Rewritting FILE
  soundEffects[currentSong] = minim.loadFile( pathway ); //ERROR: Verify Spelling & Library installed, Sketch / Import Library
  //
  for ( int i=0; i<numberOfSongs; i++ ) {
    if ( playList[i]==null ) { //ERROR, play list is NULL
      //See FILE or minim.loadFile
      println("The Play List did not load properly");
      printArray(playList);
      exit();
    }
  }
  if ( soundEffects[currentSong]==null ) { //ERROR, play list is NULL
    println("The Sound Effects did not load properly");
    printArray(soundEffects);
    exit();
  }
  //
}//End Setup
//
void draw() {
  playList[currentSong].play();
}//End Draw
//
void mousePressed() {
}//End Mouse Pressed
//
void keyPressed() {
}//End Key Pressed
//
//End MAIN Program
