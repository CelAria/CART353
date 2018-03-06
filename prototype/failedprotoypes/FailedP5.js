//test
var diamond;

function preload(){
  diamond =loadModel("/Users/celestepimm/Documents/GitHub/Web_Trial/assets/Diamond2.obj/");
}

 function setup() {
   size(windowWidth, windowHeight, WEBGL);
  // diamond = loadShape("assets/Diamond2.obj");
  // canvas.style('z-index', '-1');
   background(0);


   function windowResized() {
     resizeCanvas(windowWidth, windowHeight);
   }

}

function draw() {
        background(0);
        camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
        translate((width/2), (height/2), 0);
        ambientLight(100);
        noFill();
        stroke(255);
        scale(20);
        model(diamond);

      }
