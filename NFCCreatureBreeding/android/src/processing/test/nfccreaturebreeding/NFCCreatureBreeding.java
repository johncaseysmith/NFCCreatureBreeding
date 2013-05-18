package processing.test.nfccreaturebreeding;

import processing.core.*; 
import processing.data.*; 
import processing.opengl.*; 

import android.content.Intent; 
import android.os.Bundle; 
import ketai.net.nfc.*; 
import java.util.ArrayList; 

import android.view.MotionEvent; 
import android.view.KeyEvent; 
import android.graphics.Bitmap; 
import java.io.*; 
import java.util.*; 

public class NFCCreatureBreeding extends PApplet {






// NFC stuff
KetaiNFC ketaiNFC; // initialize NFC features
String[] input;

Creature creature; // initialize creature
ArrayList<String> environments;

public void setup() {
  load();
}

public void draw()
{
  if ( creature == null) { firstTimeMainScreen(); }
  else {
    
  }
  
  //update beam string everys second'ish...
  if (frameCount % (int)frameRate == 0)
  {
    ketaiNFC.beam(creature.parts[0] + " " + creature.parts[1] + " " + creature.parts[2] + " " + creature.parts[3] +
      " " + creature.parents[0].parts[0] + " " + creature.parents[0].parts[1] + " " + creature.parents[0].parts[2] + " " + creature.parents[0].parts[3] + 
      " " + creature.parents[1].parts[0] + " " + creature.parents[1].parts[1] + " " + creature.parents[1].parts[2] + " " + creature.parents[1].parts[3]);
  }
}

public void onNFCEvent(String p)
{
  String delims = "[ ]+";
  input = p.split(delims);
  Creature dad = new Creature(input[0], input[0], input[1], input[2], input[3]);
  dad.parents[0] = new Creature(input[4], input[4], input[5], input[6], input[7]);
  dad.parents[1] = new Creature(input[8], input[8], input[9], input[10], input[11]);
  Creature[] parents = new Creature[]{creature, dad};
  println("Mom: " + creature.toString());
  println("Dad: " + dad.toString());
  creature = new Creature(parents);
  println("Baby: " + creature.toString());
  println(p);
}

/*
  The following code allows the sketch to handle all NFC events
 when it is running.  Eventually we would like to handle this
 in a more elegant manner for now cut'n'paste will suffice.  
 */
//====================================================================
public void onCreate(Bundle savedInstanceState) { 
  super.onCreate(savedInstanceState);
  ketaiNFC = new KetaiNFC(this);
}

public void onNewIntent(Intent intent) { 
  if (ketaiNFC != null)
    ketaiNFC.handleIntent(intent);
}
//====================================================================

public class Creature {
  
  public int numParts = 4;
  
  public String environment;
  
  public Creature[] parents;
  
  public String[] parts;
  // 0: head
  // 1: body
  // 2: legs
  // 3: arms
  
  public Creature() { // for the first time main screen
    
    this.parts = new String[numParts];
    this.parents = new Creature[2];
    
    int r = PApplet.parseInt(random(environments.size()));
    
    for (int x = 0; x < numParts; x++) {
      this.parts[x] = environments.get(r);
    }
    
    this.environment = environments[r];
    
    print("Creature (constructor one) [ " + this + " ]" + " (" + this.toString() + ") created!");
  }
  
  public Creature(Creature[] p) {
    
    this.parts = new String[numParts];
    
    float r;
    
    
    for (int x = 0; x < numParts; x++) {
      r = random(4);
      if (r < 3) { // inherits parents'
        r = random(2);
        if (r < 1) { // inherits mom's
          this.parts[x] = p[0].parts[x];
        } else { // inherits dad's
          this.parts[x] = p[1].parts[x];
        } 
      } else { // inherits grandparents'
        r = random(4);
        if (r < 1) { // inherits mom's mom
          this.parts[x] = p[0].parents[0].parts[x];
        } else if (r < 2) { // inherits mom's dad
          this.parts[x] = p[0].parents[1].parts[x];
        } else if (r < 3) { // inherits dad's mom
          this.parts[x] = p[1].parents[0].parts[x];
        } else { // inherits dad's dad
          this.parts[x] = p[1].parents[1].parts[x];
        }
      } // end inherits
    } // end for
    
    this.environment = this.parts[0];
    this.parents = p;
  }
  
  public Creature(String environment, String head, String body, String legs, String arms) {
    
    this.parts = new String[numParts];
    this.environment = environment;
    this.parents = new Creature[2];
    
    this.parts[0] = head;
    this.parts[1] = body;
    this.parts[2] = legs;
    this.parts[3] = arms;
  } // end Creature
  
  public String toString() {
    String s = "";
    for (int x = 0; x < parts.length; x++) {
      if (x == parts.length - 1) {
        s = s + parts[x] + ".";
      } else {
        s = s + parts[x] + ", ";
      } // end if
    } // end for
    return s;
  } // end toString
  
}
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
public void drawCreature() {
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
}
public void firstTimeMainScreen() {
  
  creature = new Creature();
  
  drawCreature();
  
  image(frame, 0,0,displayWidth, displayHeight);
  
}


}
