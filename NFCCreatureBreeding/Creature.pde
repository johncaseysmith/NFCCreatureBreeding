public class Creature {
  
  public int numParts = 4;
  
  public int hashCode;
  
  public String environment;
  
  public Creature[] parents;
  public JSON creatureJSON;
  public String familyTree;
  
  public String[] parts;
  // 0: head
  // 1: body
  // 2: legs
  // 3: arms
  
  public Creature() { // for the first time main screen
    
    
    this.parts = new String[numParts];
    this.parents = new Creature[2];
    this.hashCode = this.hashCode();
    
    int r = int(random(environments.size()));
    
    for (int x = 0; x < numParts; x++) {
      this.parts[x] = environments.get(r);
    }
    
    this.environment = environments.get(r);
    creatureToJSON();
    
    print("Creature (constructor one) [ " + this.hashCode() + " ]" + " (" + this.toString() + ") created!");
  }
  
  public Creature(Creature[] p) { // for breeding with other creatures
    
    this.parts = new String[numParts];
    
    float r;
    
    for (int x = 0; x < numParts; x++) {
      
      this.parts[x] = inherit(p, x);
      
    } // end for
    
    this.environment = this.parts[0];
    this.parents = p;
    this.hashCode = this.hashCode();
    creatureToJSON();
  }
  
  public Creature(String environment, String head, String body, String legs, String arms, int hashCode) {
    
    this.parts = new String[numParts];
    this.environment = environment;
    this.parents = new Creature[2];
    
    this.parts[0] = head;
    this.parts[1] = body;
    this.parts[2] = legs;
    this.parts[3] = arms;
    this.hashCode = hashCode;
    creatureToJSON();
    
  } // end Creature
  
  public String toString() {
    String s = "";
    for (int x = 0; x < this.parts.length; x++) {
      s = s + this.parts[x];
    } // end for
    s = s + this.hashCode;
    return s;
  } // end toString
  
  public String inherit(Creature[] p, int x) { // my generation inherit
    float r;
    
    if (p[0].parents != null && p[1].parents != null) { // if has both sets of grandparents
      r = random(2);
      if (r < 2) { // inherits parents'
        r = random(2);
        if (r < 2) { // inherits mom's
          return p[0].parts[x];
        } else { // inherits dad's
          return p[1].parts[x];
        }
      } else { // inherits grandparents'
        r = random(2);
        if (r < 2) {
          return inherit(p[0].parents, x);
        } else {
          return inherit(p[1].parents, x);
        }
      }
    } else if (p[0].parents != null && p[1].parents == null) {
      r = random(2);
      if (r < 2) { // inherits parents'
        r = random(2);
        if (r < 2) { // inherits mom's
          return p[0].parts[x];
        } else { // inherits dad's
          return p[1].parts[x];
        }
      } else { // inherits grandparents'
        return inherit(p[0].parents, x);
      }
    } else if (p[0].parents == null && p[1].parents != null) {
      r = random(2);
      if (r < 2) { // inherits parents'
        r = random(2);
        if (r < 2) { // inherits mom's
          return p[0].parts[x];
        } else { // inherits dad's
          return p[1].parts[x];
        }
      } else { // inherits grandparents'
        return inherit(p[1].parents, x);
      }
    } else {
      r = random(2);
      if (r < 2) { // inherits mom's
        return p[0].parts[x];
      } else { // inherits dad's
        return p[1].parts[x];
      } 
    }
    
  }
  
  public void creatureToJSON() {
    
    print("Creating JSON...");
    
    JSON first = JSON.createObject();
    JSON second = JSON.createObject();
    JSON third = JSON.createObject();
    JSON fourth = JSON.createObject();
    JSON fifth = JSON.createObject();
    print("JSON created!");
    
    first.setInt("hashCode", hashCode);
    second.setString("head", parts[0]);
    third.setString("body", parts[1]);
    fourth.setString("legs", parts[2]);
    fifth.setString("arms", parts[3]);
    
    
    creatureJSON = JSON.createArray();
    creatureJSON.append(first);
    creatureJSON.append(second);
    creatureJSON.append(third);
    creatureJSON.append(fourth);
    creatureJSON.append(fifth);
    
  }
  
  public String createFamilyTree(Creature[] parents, String familyTree) {
    if (parents == null) {
      familyTree = familyTree + "# ";
    } else {
      familyTree = familyTree + this.creatureJSON + " ";
      familyTree = familyTree + createFamilyTree(parents[0].parents, familyTree);
      familyTree = familyTree + createFamilyTree(parents[1].parents, familyTree);
    }
    return familyTree;
  }
  
}
