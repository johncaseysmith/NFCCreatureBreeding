public void firstTimeMainScreen() {
  
  creature = new Creature();
  creatureList.add(creature);
  
  drawCreature();
  
  image(frame, 0,0,displayWidth, displayHeight);
  print("Done with first main screen...");
}
