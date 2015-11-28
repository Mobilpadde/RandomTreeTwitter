class Tree{
  Branch b0, b1;
  float len, theta, level;
  PVector location;
  
  Tree(PVector lo, float le){
    location = lo;
    len = le;
    theta = random(PI / 25, PI / 5);
    
    PVector lenVector = new PVector(len, 0);
    int rnd = int(random(0, 3));
    b0 = new Branch(lenVector, theta, 1, rnd);
    b1 = new Branch(lenVector, -theta, 1, rnd);
    level = 50000;
  }
  
  void Draw(){
    pushMatrix();
    strokeWeight(len * 0.1);
    translate(location.x, location.y);
    
    b0.Draw(level);
    b1.Draw(level);
    
    popMatrix();
  }
}