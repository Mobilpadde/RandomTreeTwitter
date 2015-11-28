Tree tree;

void settings(){
  size(720, 640);
}

void setup(){
  tree = new Tree(new PVector(width * 0.5, height), height * random(0.15, 0.3));

  background(25);
  tree.Draw();
  saveFrame("tree.png");
  exit();
}
