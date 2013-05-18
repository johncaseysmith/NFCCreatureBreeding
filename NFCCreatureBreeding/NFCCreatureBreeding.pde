import org.json.*;
import android.content.Intent;
import android.os.Bundle;
import ketai.net.nfc.*;
import java.util.ArrayList;

// NFC stuff
KetaiNFC ketaiNFC; // initialize NFC features
String[] input;

Creature creature; // initialize creature

String screen;

void setup() {
  load();
}

void draw()
{
  if ( creature == null) {
    screen = "firstTimeMainScreen";
    firstTimeMainScreen();
  } else if ( screen.equals("mainScreen")) {
    mainScreen();
  }
  
  
  ketaiNFC.beam(creature.toString());

  
}

void onNFCEvent(String p)
{
  String delims = "[ ]+";
  input = p.split(delims);
  Creature dad = new Creature(input[0], input[0], input[1], input[2], input[3], Integer.parseInt(input[4]));
  dad.parents[0] = new Creature(input[5], input[5], input[6], input[7], input[8], Integer.parseInt(input[9]));
  dad.parents[1] = new Creature(input[10], input[10], input[11], input[12], input[13], Integer.parseInt(input[14]));
  Creature[] parents = new Creature[]{creature, dad};
  println("Mom: " + creature.toString());
  println("Dad: " + dad.toString());
  creature = new Creature(parents);
  println("Baby: " + creature.toString());
  println(p);
}
