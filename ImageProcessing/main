Image i1;

void setup(){
  size(500, 500);
 i1 = new Image("flowers500.jpg", "rosepicture.jpg");
}

void draw(){
  if (keyPressed){
    if(key=='s'||key=='S'){
        // Saves each frame as roseoutput-000001.png, roseoutput-000002.png, etc.
        saveFrame("roseoutput-######.png");
    }
}
  if (mousePressed){
    i1.invert();
    }else
i1.transparency();
i1.mix();
}
