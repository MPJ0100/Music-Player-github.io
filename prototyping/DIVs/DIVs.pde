println(displayWidth, displayHeight);
fullScreen();
int appWidth = displayWidth;
int appHeight = displayHeight;

int paperWidth = 279;
int paperHeight = 216;

float SongImageDivX = appWidth * 70 / paperWidth;
float SongImageDivY = appHeight * 50 / paperHeight;
float SongImageDivWidth = appWidth * 120 / paperWidth;
float SongImageDivHeight = appHeight * 90 / paperHeight;

float RewindDivX = appWidth * 70 / paperWidth;
float RewindDivY = appHeight * 170 / paperHeight;
float RewindDivWidth = appWidth * 25 / paperWidth;
float RewindDivHeight = appHeight * 25 / paperHeight;

float PlayDivX = appWidth * 105 / paperWidth;
float PlayDivY = appHeight * 165 / paperHeight;
float PlayDivWidth = appWidth * 35 / paperWidth;
float PlayDivHeight = appHeight * 35 / paperHeight;

float PauseDivX = appWidth * 145 / paperWidth;
float PauseDivY = appHeight * 170 / paperHeight;
float PauseDivWidth = appWidth * 25 / paperWidth;
float PauseDivHeight = appHeight * 25 / paperHeight;

float SkipDivX = appWidth * 175 / paperWidth;
float SkipDivY = appHeight * 170 / paperHeight;
float SkipDivWidth = appWidth * 25 / paperWidth;
float SkipDivHeight = appHeight * 25 / paperHeight;

float ShuffleDivX = appWidth * 205 / paperWidth;
float ShuffleDivY = appHeight * 170 / paperHeight;
float ShuffleDivWidth = appWidth * 20 / paperWidth;
float ShuffleDivHeight = appHeight * 20 / paperHeight;

float RepeatDivX = appWidth * 230 / paperWidth;
float RepeatDivY = appHeight * 170 / paperHeight;
float RepeatDivWidth = appWidth * 20 / paperWidth;
float RepeatDivHeight = appHeight * 20 / paperHeight;

float Note1X = appWidth * 40 / paperWidth;
float Note1Y = appHeight * 70 / paperHeight;

float Note2X = appWidth * 220 / paperWidth;
float Note2Y = appHeight * 100 / paperHeight;

fill(180);
rect(SongImageDivX, SongImageDivY, SongImageDivWidth, SongImageDivHeight);

fill(120);
triangle(RewindDivX + RewindDivWidth, RewindDivY, RewindDivX, RewindDivY + RewindDivHeight / 2, RewindDivX + RewindDivWidth, RewindDivY + RewindDivHeight);
triangle(PlayDivX, PlayDivY, PlayDivX, PlayDivY + PlayDivHeight, PlayDivX + PlayDivWidth, PlayDivY + PlayDivHeight / 2);

rect(PauseDivX, PauseDivY, PauseDivWidth / 3, PauseDivHeight);
rect(PauseDivX + PauseDivWidth / 2, PauseDivY, PauseDivWidth / 3, PauseDivHeight);

triangle(SkipDivX, SkipDivY, SkipDivX + SkipDivWidth, SkipDivY + SkipDivHeight / 2, SkipDivX, SkipDivY + SkipDivHeight);

line(ShuffleDivX, ShuffleDivY + ShuffleDivHeight, ShuffleDivX + ShuffleDivWidth, ShuffleDivY);
line(ShuffleDivX, ShuffleDivY, ShuffleDivX + ShuffleDivWidth, ShuffleDivY + ShuffleDivHeight);

arc(RepeatDivX + RepeatDivWidth / 2, RepeatDivY + RepeatDivHeight / 2, RepeatDivWidth, RepeatDivHeight, PI, TWO_PI);

fill(100);
ellipse(Note1X, Note1Y, 10, 10);
line(Note1X, Note1Y, Note1X, Note1Y - 20);

ellipse(Note2X, Note2Y, 8, 8);
line(Note2X, Note2Y, Note2X, Note2Y - 15);
