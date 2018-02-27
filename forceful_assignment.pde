//black hole gravity 
// mouse draggable black hole with multiple objects and stars being sucked into it 
//
//Celeste Pimm
//26885063
//Cart 353
//Rilla Khaled


// array of mover objects, "stars" which are attracted to the blackhole, planets 
Star [] stars = new Star[1000];
Planet[] planets= new Planet[4];

// the only black hole object
BlackHole bh;

void setup(){
  //set up to be screen size canvas
  size(displayWidth,displayHeight); 
  
  //set background to grey-black 
  background(30);
  
  //instatiating the blackhole
  bh = new BlackHole(100, random(width), random(height)); 
 
  //initializing the stars within array
  for (int i=0; i < stars.length; i++){
    stars[i] = new Star(random(0.5, 5), random(width), random(height));
  }
//initializing the planets within array
for (int i=0; i < planets.length; i++){
    planets[i] = new Planet(100, random(width), random(height));
    PImage img= loadImage("planet[" + i +"].png");
      
  }
}
//creating one car object
  Car tesla= new Car(20, random(width), random(height));
  
void draw() {
  
  background(30);
  //make blackhole draggable and display it
  bh.draggable();
  bh.displayBH();
  //loop through array to display stars
  for(int i=0; i < stars.length; i++)
  { 
    stars[i].displayStar();
    
  //  if( stars[i].position.x > width ||  stars[i].position.x < 0 ||  stars[i].position.y < 0 || stars[i].position.y > height)
  //{// do something }
     PVector f = bh.attract(stars[i]);

      // apply that attractor's force on that mover, update its overall force
      stars[i].applyForce(f);
      bh.displayBH();
   // now that we've accumulated the net force, call update and display on the mover
      stars[i].update();
      stars[i].displayStar();
  
     
    } 
    //apply forces to tesla
    PVector f = bh.attract(tesla);
    tesla.applyForce(f);
    tesla.update();
    tesla.displayCar();
    
    for(int j=0; j < planets.length; j++)
  {
    
    PVector q = bh.attract(planets[j]);
    planets[j].applyForce(q);
    planets[j].update();
    planets[j].displayPlanet(planets);
    }
  }