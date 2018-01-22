class Image{
  
  PImage back, front;
  
  // constructor for image object
  Image(String background, String foreground){
  back= loadImage(background);
  front= loadImage(foreground);
  }
    // transparency function makes foreground image more transparent based on Y axis
    void transparency(){
      
      float scale =500.00/255.00;
      float posX= (mouseX/scale);
      background(back);
      tint(255, posX); 
      image(front, 0, 0);
      textSize(32);
      fill(0, 102, 153);
      
    }
    //blend function 
  void mix(){
    float scale =500.00/255.00;
    int posY=int(mouseY/scale);
    image(front, 0, 0);
    blend(front, posY, posY, 500, 500, posY, posY, mouseX, mouseX, BURN);
  }
    // invert function
      void invert(){
      loadPixels();
      front.loadPixels();
      
         //pixel location
        for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
        int loc = x + y*width;
        
        
        // get pixel colours
        float r = (red(front.pixels[loc]));
        float g = (green(front.pixels[loc]));
        float b = (blue(front.pixels[loc]));
        color c = color(255-r,255-g,255-b);
        pixels[loc] =  c;   
        }  
      }
      updatePixels();
    }
}
