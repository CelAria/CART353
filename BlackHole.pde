class BlackHole{
  
  float mass;
  float G;
  PVector position;
  
  
  // constructor for blackhole object, takes in mass value, x, y position
  BlackHole(float m, float x, float y)
  {
    mass = m;
    position = new PVector(x, y);
    G=1; 
  }
  
   void draggable()
  {
    
    if(dist(position.x,position.y, mouseX, mouseY) < mass / 2) 
    {
    cursor(HAND);
    if(mousePressed) 
    {
      position.x = mouseX;
      position.y = mouseY;
    } 
     else 
    {
    cursor(ARROW);
    noStroke();
    }
   } 
  }
  
   PVector attract(Star m) {
    PVector force = PVector.sub(position, m.position);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d, 5.0, 25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d);      // Calculate gravitional force magnitude
    force.mult(strength);                                  // Get force vector --> magnitude * direction
    return force;
  }
  
     PVector attract(Car m) {
    PVector force = PVector.sub(position, m.position);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d, 5.0, 25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d);      // Calculate gravitional force magnitude
    force.mult(strength);                                  // Get force vector --> magnitude * direction
    return force;
  }
  
    PVector attract(Planet m) {
    PVector force = PVector.sub(position, m.position);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d, 5.0, 25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d);      // Calculate gravitional force magnitude
    force.mult(strength);                                  // Get force vector --> magnitude * direction
    return force;
  }
 
   void displayBH()
    {
    stroke(0);
    fill(0);
    ellipse(position.x, position.y, mass, mass);
    }
    
  }