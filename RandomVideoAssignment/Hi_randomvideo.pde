/*´hi`*•.¸¸.•*´hi`*•.¸•*´hi`*•.¸¸.•*´hi`*•.¸•*´hi`*•.¸¸.•*´hi`*•.¸•*´hi`*•.¸¸.•*´hi`*•.
          _       _     _     
        / /\    / /\  /\ \   
       / / /   / / /  \ \ \  
      / /_/   / / /   /\ \_\ 
     / /\ \__/ / /   / /\/_/ 
    / /\ \___\/ /   / / /    
   / / /\/___/ /   / / /     
  / / /   / / /   / / /      
 / / /   / / /___/ / /__     
/ / /   / / //\__\/_/___\    
\/_/    \/_/ \/_________/    
                             
•*´hi`*•.¸¸.•*´hi`*•.¸•*´hi`*•.¸¸.•*´hi`*•.¸•*´hi`*•.¸¸.•*´hi`*•.¸•*´hi`*•.¸¸.•*´hi`*•.

prints HI in the colour & location of a pixel from the video feed chosen based off 
Gaussian Distribution 
Changes rotation of "hi" based on perlin noise

Celeste Pimm
26885063
Cart 353
January 6 2018

References:

line tracking
https://processing.org/tutorials/video/

noise
https://processing.org/reference/noise_.html

graphics
https://processing.org/discourse/beta/num_1197673835.html


--------------------------------------------------------------------------------------
*/



//import necessary library for video and random objects 
import processing.video.*;
import java.util.Random;

//declare generator variable
Random generator;

//intialize x, y points
float x;
float y;

//declare video variable
Capture video;

//declare graphics toplayer   
PGraphics toplayer;

void setup() {
  
  //set screen size to be display size
  size(displayWidth,displayHeight);
  
  //declare size of graphics (all "hi")
  toplayer= createGraphics(displayWidth, displayHeight);
  
  //set background to black
  background(0);
  
  //make starting points the center of the screen
  x =width/2;
  y =height/2;
  
  //new random object
  generator = new Random();
  
  // Start the capture
  video = new Capture(this, width, height);  
  video.start();
}

  //function to read video
  void captureEvent(Capture video) {  
  // Read image from the camera
  video.read();
}

void draw() {
  
  //draw video before drawing "hi"
  image(video, 0, 0, width, height); 
  
  //begin drawing "hi" layer
  toplayer.beginDraw();
  toplayer.noFill();
  
 //pick a new x and y value for the pixel using Gaussian distribution 
 //that will be constrained to the screen size
  float newx= constrain(x +(float)generator.nextGaussian()*15, 0 , width);
  float newy= constrain(y +(float)generator.nextGaussian()*15, 0 , height-1);
  
 //// Find the midpoint of the old coordinates and new coordinates 
  int midx = int((newx + x) / 2);
  int midy = int((newy + y) / 2);
  
  //Pick the color from the inbetween point from the video
  color c = video.pixels[(width-1-midx) + midy*video.width];
  
  //set scale for perlin noise directed text rotation
  float noiseScale = 0.2;
  
  //function for noise value for text rotation 
  float noiseVal = noise((newx)*noiseScale);
  
  //push into matrix to rotate text based off of perlin noise
  pushMatrix();
  //start at x, y in center
  toplayer.translate(x,y);
  
  //rotate the text based off of perlin noise
  toplayer.rotate(HALF_PI/noiseVal*4);
  toplayer.translate(-x,-y);
  
  //make text 100 pixels
  toplayer.textSize(100);
  
  //make text chosen from colour function line 80 the text colour
  toplayer.fill(c);
  
  //write hi at the new x, y position
  toplayer.text("hi", newx, newy); 
  //end of text rotation function
  popMatrix();
  //end of graphics for rendering as top layer above video 
  toplayer.endDraw();
  //draw "hi" on top of video 
  image(toplayer, 0, 0);

  // Save (newx,newy) in (x,y)  
  x = newx;  
  y = newy;
  
}