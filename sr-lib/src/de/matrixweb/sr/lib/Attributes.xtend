package de.matrixweb.sr.lib

/**
 * @author markusw
 */
abstract class Attribute implements Testable {
  
  @Property
  int level
  
  def getName() { class.simpleName }
  
}

class Body extends Attribute {
}

class Quickness extends Attribute {
}

class Strength extends Attribute {
}

class Charisma extends Attribute {
}

class Intelligence extends Attribute {
}

class Willpower extends Attribute {
}

class Essence extends Attribute {
  
  new() {
    setLevel(60)
  }
  
}

class Magic extends Attribute {
  
  Essence essence
  
  new(Essence essence) {
    this.essence = essence
  }
  
  override getLevel() { Math.min(super.level, essence.level / 10) }
  
}

class Reaction extends Attribute {
  
  Quickness quickness
  
  Intelligence intelligence
  
  new(Quickness quickness, Intelligence intelligence) {
    this.quickness = quickness
    this.intelligence = intelligence
  }
  
  override getLevel() { (quickness.level + intelligence.level) / 2 }
  
}
