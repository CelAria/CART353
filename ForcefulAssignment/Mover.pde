//// The Nature of Code
//// Daniel Shiffman
//// http://natureofcode.com
////
////
////Non useful class. Will be used for code simplification in the future to add object oriented 
////approach where all "movers" aka planet, star,car, inherit from Mover
////
////
//class Mover {

//  PVector position;
//  PVector velocity;
//  PVector acceleration;
//  float mass;

//  void applyForce(PVector force) {
//    PVector f = PVector.div(force, mass);
//    acceleration.add(f);
//  }

//  void update() {
//    velocity.add(acceleration);
//    position.add(velocity);
//    acceleration.mult(0);
//  }

//  void display() {
//    noStroke();
//    fill(0,100);
//    ellipse(position.x, position.y, mass*25, mass*25);
//  }
//}