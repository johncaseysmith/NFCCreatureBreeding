import android.content.Intent;
import android.os.Bundle;
import ketai.net.nfc.*;
import java.util.ArrayList;

String tag="";
KetaiNFC ketaiNFC;
Creature creature;
String[] input;
int part;
int total = 0;

ArrayList<String> environments;

PImage frame;
 
  PImage acornArms;
  PImage acornLegs;
  PImage acornHead;
  PImage acornBody;
 
  PImage cactusArms;
  PImage cactusLegs;
  PImage cactusHead;
  PImage cactusBody;
 
  PImage fireArms;
  PImage fireLegs;
  PImage fireHead;
  PImage fireBody;
 
  PImage fishArms;
  PImage fishLegs;
  PImage fishHead;
  PImage fishBody;
 
  PImage roseArms;
  PImage roseLegs;
  PImage roseHead;
  PImage roseBody;
 
  PImage desert;
  PImage forest;
  PImage grass;
  PImage volcano;
  PImage water;

void setup() {
  print("App loaded!");
  
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

  
  size(displayWidth, displayHeight);
  
  if (ketaiNFC == null)
    ketaiNFC = new KetaiNFC(this);
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(36);
  
  print("Loading environments...");
  environments = new ArrayList<String>();
  environments.add("forest");
  environments.add("underwater");
  environments.add("desert");
  environments.add("backyard");
  environments.add("volcano");
  
  creature = new Creature(environments);
  
  if (creature.parts[0].equals("forest")) {
    image(forest,0,0,displayWidth, displayHeight);
    image(acornHead,0,0,displayWidth, displayHeight);
  } else if (creature.parts[0].equals("underwater")) {
    image(water,0,0,displayWidth, displayHeight);
    image(fishHead,0,0,displayWidth, displayHeight);
  } else if (creature.parts[0].equals("desert")) {
    image(desert,0,0,displayWidth, displayHeight);
    image(cactusHead,0,0,displayWidth, displayHeight);
  } else if (creature.parts[0].equals("backyard")) {
    image(grass,0,0,displayWidth, displayHeight);
    image(roseHead,0,0,displayWidth, displayHeight);
  } else if (creature.parts[0].equals("volcano")) {
    image(volcano,0,0,displayWidth, displayHeight);
    image(fireHead,0,0,displayWidth, displayHeight);
  }
  
  if (creature.parts[1].equals("forest")) {
    image(acornBody,0,0,displayWidth, displayHeight);
  } else if (creature.parts[1].equals("underwater")) {
    image(fishBody,0,0,displayWidth, displayHeight);
  } else if (creature.parts[1].equals("desert")) {
    image(cactusBody,0,0,displayWidth, displayHeight);
  } else if (creature.parts[1].equals("backyard")) {
    image(roseBody,0,0,displayWidth, displayHeight);
  } else if (creature.parts[1].equals("volcano")) {
    image(fireBody,0,0,displayWidth, displayHeight);
  }
  
  if (creature.parts[2].equals("forest")) {
    image(acornLegs,0,0,displayWidth, displayHeight);
  } else if (creature.parts[2].equals("underwater")) {
    image(fishLegs,0,0,displayWidth, displayHeight);
  } else if (creature.parts[2].equals("desert")) {
    image(cactusLegs,0,0,displayWidth, displayHeight);
  } else if (creature.parts[2].equals("backyard")) {
    image(roseLegs,0,0,displayWidth, displayHeight);
  } else if (creature.parts[2].equals("volcano")) {
    image(fireLegs,0,0,displayWidth, displayHeight);
  }
  
  if (creature.parts[3].equals("forest")) {
    image(acornArms,0,0,displayWidth, displayHeight);
  } else if (creature.parts[3].equals("underwater")) {
    image(fishArms,0,0,displayWidth, displayHeight);
  } else if (creature.parts[3].equals("desert")) {
    image(cactusArms,0,0,displayWidth, displayHeight);
  } else if (creature.parts[3].equals("backyard")) {
    image(roseArms,0,0,displayWidth, displayHeight);
  } else if (creature.parts[3].equals("volcano")) {
    image(fireArms,0,0,displayWidth, displayHeight);
  }
  
  image(frame, 0,0,displayWidth, displayHeight);
  
  ketaiNFC.beam(creature.parts[0] + " " + creature.parts[1] + " " + creature.parts[2] + " " + creature.parts[3] +
      " " + creature.parents[0].parts[0] + " " + creature.parents[0].parts[1] + " " + creature.parents[0].parts[2] + " " + creature.parents[0].parts[3] + 
      " " + creature.parents[1].parts[0] + " " + creature.parents[1].parts[1] + " " + creature.parents[1].parts[2] + " " + creature.parents[1].parts[3]);
}

void draw()
{
  if (creature.parts[0].equals("forest")) {
    image(forest,0,0,displayWidth, displayHeight);
    image(acornHead,0,0,displayWidth, displayHeight);
  } else if (creature.parts[0].equals("underwater")) {
    image(water,0,0,displayWidth, displayHeight);
    image(fishHead,0,0,displayWidth, displayHeight);
  } else if (creature.parts[0].equals("desert")) {
    image(desert,0,0,displayWidth, displayHeight);
    image(cactusHead,0,0,displayWidth, displayHeight);
  } else if (creature.parts[0].equals("backyard")) {
    image(grass,0,0,displayWidth, displayHeight);
    image(roseHead,0,0,displayWidth, displayHeight);
  } else if (creature.parts[0].equals("volcano")) {
    image(volcano,0,0,displayWidth, displayHeight);
    image(fireHead,0,0,displayWidth, displayHeight);
  }
  
  if (creature.parts[1].equals("forest")) {
    image(acornBody,0,0,displayWidth, displayHeight);
  } else if (creature.parts[1].equals("underwater")) {
    image(fishBody,0,0,displayWidth, displayHeight);
  } else if (creature.parts[1].equals("desert")) {
    image(cactusBody,0,0,displayWidth, displayHeight);
  } else if (creature.parts[1].equals("backyard")) {
    image(roseBody,0,0,displayWidth, displayHeight);
  } else if (creature.parts[1].equals("volcano")) {
    image(fireBody,0,0,displayWidth, displayHeight);
  }
  
  if (creature.parts[2].equals("forest")) {
    image(acornLegs,0,0,displayWidth, displayHeight);
  } else if (creature.parts[2].equals("underwater")) {
    image(fishLegs,0,0,displayWidth, displayHeight);
  } else if (creature.parts[2].equals("desert")) {
    image(cactusLegs,0,0,displayWidth, displayHeight);
  } else if (creature.parts[2].equals("backyard")) {
    image(roseLegs,0,0,displayWidth, displayHeight);
  } else if (creature.parts[2].equals("volcano")) {
    image(fireLegs,0,0,displayWidth, displayHeight);
  }
  
  if (creature.parts[3].equals("forest")) {
    image(acornArms,0,0,displayWidth, displayHeight);
  } else if (creature.parts[3].equals("underwater")) {
    image(fishArms,0,0,displayWidth, displayHeight);
  } else if (creature.parts[3].equals("desert")) {
    image(cactusArms,0,0,displayWidth, displayHeight);
  } else if (creature.parts[3].equals("backyard")) {
    image(roseArms,0,0,displayWidth, displayHeight);
  } else if (creature.parts[3].equals("volcano")) {
    image(fireArms,0,0,displayWidth, displayHeight);
  }
  
  image(frame, 0,0,displayWidth, displayHeight);
  
  //update beam string everys second'ish...
  if (frameCount % (int)frameRate == 0)
  {
    ketaiNFC.beam(creature.parts[0] + " " + creature.parts[1] + " " + creature.parts[2] + " " + creature.parts[3] +
      " " + creature.parents[0].parts[0] + " " + creature.parents[0].parts[1] + " " + creature.parents[0].parts[2] + " " + creature.parents[0].parts[3] + 
      " " + creature.parents[1].parts[0] + " " + creature.parents[1].parts[1] + " " + creature.parents[1].parts[2] + " " + creature.parents[1].parts[3]);
  }
}

void onNFCEvent(String p)
{
  String delims = "[ ]+";
  input = p.split(delims);
  Creature dad = new Creature(input[0], input[0], input[1], input[2], input[3]);
  dad.parents[0] = new Creature(input[4], input[4], input[5], input[6], input[7]);
  dad.parents[1] = new Creature(input[8], input[8], input[9], input[10], input[11]);
  Creature[] parents = new Creature[]{creature, dad};
  println("Mom: " + creature.toString());
  println("Dad: " + dad.toString());
  creature = new Creature(environments, parents);
  println("Baby: " + creature.toString());
  println(p);
  
  
  
}


void mousePressed()
{
  tag = "";
}
