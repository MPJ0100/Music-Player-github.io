/* Aspect Ratio
 */
//
//Display
fullScreen();
//
String[] imageName = new String[3];
String upArow = "..";
String dependanciesFolder = "Dependencies";
String imagesFolder = "Images";
imageName[1] = "Mona-Lisa-67-805x1200";
imageName[2] = "bike";
imageName[3] = "SoccerBall";
String fileExension = ".jpg";
String open = "/";

//
//Concatenation
//Note, Cut Out, See Absolute Pathway:
//See Relative Pathway: Dependencies\Images
String imageDirectory = upArow + open + upArow + open + dependanciesFolder + open + imagesFolder + open;
String[] pathway = new String[3];
//
//Loading Images
PImage[] image = new PImage[3];
for ( int i=1; i<=pathway.length; i++ ) {
  pathway[i] = imageDirectory + imageName[i] + fileExension;
  image[i] = loadImage( pathway[i] );
}
//
//Drawing Images
for ( int i=1; i<=pathway.length; i++ ) {
  image(image[i], 0, 0);
}
//
//End
