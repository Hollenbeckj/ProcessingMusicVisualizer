class visualizer{
  PImage fade;
  float rWidth,rHeight;
  int hVal;
  visualizer(){  
  hVal = 0;
  rectMode(CORNERS);
  fade = get(0,0, width,height);
  rWidth = width*0.99;
  rHeight = height*0.99;
  }  
  
  void drawEQ()
{
  //creates the values needed to make the 3D effect 
  tint(255,255,255,254);
  image(fade,(width-rWidth)/2,(height-rHeight)/2, rWidth,rHeight);
  noTint();
  
  // rainbow Effect parameters
  smooth();
  colorMode(HSB);// sets color mode value 
  fill(hVal, 255,255);//cycles through hue and brightness to expose a greater color palete
  stroke(hVal, 255,225);// sets the stroke to cycle through the whole color spectrum 
  colorMode(RGB);//sets color mode back to Red green and blue 
  //fill(EQColorR,EQColorG,EQColorB);
  
  
  //for loop for creating the audio bars
  
  fft.forward(mp3.mix);// used to analyze the frequency coming from the mix 
  for(int i = 0; i < fft.specSize(); i += 50)// specSize is changing the range of analysis
  {
    rect(i,height, i + 50, height - fft.getFreq(i/2)*1.2);// draws a rect and alters its height based on the translated frequency 

  }
  fade = get(0,0, width,height);
  hVal +=1;
  
  if(hVal > 255)
  {
    hVal = 0;
  }
}

  
}
