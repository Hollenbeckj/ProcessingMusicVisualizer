import ddf.minim.*;
import ddf.minim.signals.*; 
import ddf.minim.analysis.*;
visualizer classicVi;

Minim minim;
FFT fft;

AudioOutput out;
AudioPlayer mp3;

PFont directions;
PImage fade;
float rWidth,rHeight;
int hVal;

boolean started; //boolean for telling if the program has started 
boolean selection; //boolean for telling if a song has been selected
boolean canPlay;//boolean for allowing the audio to play 
boolean canPauseAndPlay; //boolean for allowing the pause and play function 
PImage title;//Image etup for the title screen 

void setup()
{
  //program setup 
  size(900,500,P3D);
  title = loadImage("VisualZtitle .png");
  frameRate(60);
  started = false;
  selection = false;
  
// sound and minim setup parameters
  minim = new Minim(this);
  mp3 = minim.loadFile("mashUp.mp3",2048);// load your mp3 file here make sure you use processing's built in add file feature and type the name of the loaded mp3 inside the quotation marks
  out = minim.getLineOut(Minim.STEREO,44100);
  fft = new FFT(mp3.bufferSize(),mp3.sampleRate());//allows for the decription of the sound waves 
  rectMode(CORNERS);
  mp3.loop();
  
  //background fader parameters
  fade = get(0,0, width,height);// parameter for making the background fade
  rWidth = width*0.99;
  rHeight = height*0.99;
  classicVi = new visualizer(); // initializes the class visualizer 
  
  if(!started)
  {
    mp3.pause();
  }
}

void draw()
{
  if(!started)
  {
    background(title);
    canPauseAndPlay = false;
  }
  else if(started)
  {
    canPlay = true;
    background(0);
    classicVi.drawEQ();
    if(canPlay)
    {
    mp3.play();
    pauseAndPlay();
    }
  }  
}
// Start Button Parameters 
void mouseClicked()
{
  started = true;// tells the program its started playing 
}
void keyPressed()
{
  if(key == ESC)
  {
    started = false; //kills the program 
    mp3.pause();
  }
}
// function for pausing and playing the audio 
void pauseAndPlay()
{
  if(key == 'p')
  {
    mp3.pause();
  }
  else if(key == 'q')
  {
    mp3.play();
  }
}


void close()
{
  out.close();
  minim.stop();
  super.stop();
}


