public void drawCreature() {
  print("Drawing creature...");
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
  print("Done drawing creature...");
}
