class Branch{
  PVector len;
  float theta;
  Branch b0, b1, b2, b3;
  int level;
  Leaf leaf;
  color col;
  
  Branch(PVector l, float t, int lvl, int num){
    len = l;
    theta = t;
    
    float newLen = len.x * random(0.45, 0.80);
    if(newLen > 2){
      b0 = new Branch(new PVector(newLen, 0), theta * 1.1, lvl + 1, num);
      b1 = new Branch(new PVector(newLen, 0), -theta * 1.1, lvl + 1, num);
    }else{
      leaf = new Leaf();
    }
    
    level = lvl;
    
    if(num == 0) col = color(level * 25, 75, 255);
    if(num == 1) col = color(255, level * 25, 75);
    if(num == 2) col = color(75, 255, level * 25);
  }
  
  void Draw(float lvl){
    strokeWeight(len.x * 0.1);
    stroke(col);
    line(0, 0, 0, -len.x);
    pushMatrix();
    translate(0, -len.x);
    rotate(theta);
    
    if(b0 != null && b1 != null){
      b0.Draw(lvl);
      b1.Draw(lvl);
    }else if(leaf != null){
      leaf.Draw();
    }
    popMatrix();
  }
}