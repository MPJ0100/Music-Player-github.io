/* Aspect Ratio
 */
//
//Display
fullScreen();
int appWidth = displayWidth;
int appHeight = displayHeight;
//
String upArow = "..;
String dependanciesFolder = "Dependencies";
String imagesFolder = "Images";
String imageName1 = "Mona-Lisa-67-805x1200";
String imageName2 = "bike";
String imageName3 = "SoccerBall";
String fileExension = ".jpg";
String open = "/";
//
//Concatenation
//Note, Cut Out, See Absolute Pathway
//See Relative Pathway DependenciesImages
String imageDirectory = upArow + open + upArow + open + dependanciesFolder + open + imagesFolder + open;
String pathway1 = imageDirectory + imageName1 + fileExension;
String pathway2 = imageDirectory + imageName2 + fileExension;
String pathway3 = imageDirectory + imageName3 + fileExension;
//println(pathway);
//
PImage image1 = loadImage( pathway1 );
PImage image2 = loadImage( pathway2 );
int imageWidth2 = 860;
int imageHeight2 = 529;
PImage image3 = loadImage( pathway3 );
//
//Population DIVs
int numberOfButtons = 13; Half a button on either side as space, Center Button is Play
int widthOfButton = appWidthnumberOfButtons;
int beginningButtonSpace = widthOfButton;
float imageDivX = beginningButtonSpace;
float imageDivY = appHeight4.520;
float imageDivWidth = appWidth12 - beginningButtonSpace1.5;
float imageDivHeight = appHeight1.55; 1+1.5=2.5, half of the total height

//Image Aspect Ratio Algorithm
//Ternary Operator for As[pect Ratio



//DIV Image
rect(imageDivX, imageDivY, imageDivWidth, imageDivHeight);
//
image(image1, 0, 0);
//image(image2, imageDivX, imageDivY, imageDivWidth+1, imageDivHeight);
//image(image3, 0, 0);
