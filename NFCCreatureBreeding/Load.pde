ArrayList<String> environments;
ArrayList<Creature> creatureList;

PImage frame;

// creature images and background images
PImage acornArms, acornLegs, acornHead, acornBody,
       cactusArms, cactusLegs, cactusHead, cactusBody,
       fireArms, fireLegs, fireHead, fireBody,
       fishArms, fishLegs, fishHead, fishBody,
       roseArms, roseLegs, roseHead, roseBody,
       desert, forest, grass, volcano, water;

public void load() {

  print("App loaded!");
  
  size(displayWidth, displayHeight);
  
  // load all the images

  frame = loadImage("nonButtonBack.png");
   
  acornArms = loadImage("acornArms.png");
  acornLegs = loadImage("acornLegs.png");
  acornHead = loadImage("acornHead.png");
  acornBody = loadImage("acornBody.png");
   
  cactusArms = loadImage("cactusArms.png");
  cactusLegs = loadImage("cactusLegs.png");
  cactusHead = loadImage("cactusHead.png");
  cactusBody = loadImage("cactusBody.png");
   
  fireArms = loadImage("fireArms.png");
  fireLegs = loadImage("fireLegs.png");
  fireHead = loadImage("fireHead.png");
  fireBody = loadImage("fireBody.png");
   
  fishArms = loadImage("fishArms.png");
  fishLegs = loadImage("fishLegs.png");
  fishHead = loadImage("fishHead.png");
  fishBody = loadImage("fishBody.png");
   
  roseArms = loadImage("roseArms.png");
  roseLegs = loadImage("roseLegs.png");
  roseHead = loadImage("roseHead.png");
  roseBody = loadImage("roseBody.png");
   
  desert = loadImage("desert.png");
  forest = loadImage("forest.png");
  grass = loadImage("grass.png");
  volcano = loadImage("volcano.png");
  water = loadImage("water.png"); 
  
  if (ketaiNFC == null)
    ketaiNFC = new KetaiNFC(this);
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(36);
  
  environments = new ArrayList<String>();
  environments.add("forest");
  environments.add("underwater");
  environments.add("desert");
  environments.add("backyard");
  environments.add("volcano");
  
  creatureList = new ArrayList<Creature>();
      
}
