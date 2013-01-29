public class Creature {
  
  public int numParts = 4;
  
  public String environment;
  
  public Creature[] parents;
  
  public String[] parts;
  
  public Creature(ArrayList<String> environments) {
    
    this.parts = new String[numParts];
    
    int r = 0;
    String[] momParts = new String[numParts];
    String[] dadParts = new String[numParts];
    
    for (int x = 0; x < numParts; x++) {
      r = int(random(environments.size()));
      this.parts[x] = environments.get(r);
      
      r = int(random(environments.size()));
      momParts[x] = environments.get(r);
      
      r = int(random(environments.size()));
      dadParts[x] = environments.get(r);
    }
    
    this.parents = new Creature[2];
    this.environment = this.parts[0];
    this.parents[0] = new Creature(momParts[0], momParts[0], momParts[1], momParts[2], momParts[3]);
    this.parents[1] = new Creature(dadParts[0], dadParts[0], dadParts[1], dadParts[2], dadParts[3]);
    
    print("Creature (constructor one) (" + this.toString() + ") created! Its mom is ("
      + this.parents[0].toString() + ") and its dad is (" + this.parents[1].toString() + ").");
  }
  
  public Creature(ArrayList<String> environments, Creature[] p) {
    
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
