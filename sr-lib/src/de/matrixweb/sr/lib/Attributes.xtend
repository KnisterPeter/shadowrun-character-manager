package de.matrixweb.sr.lib

/**
 * @author markusw
 */
abstract class Attribute implements Testable {
  
  @Property
  Character character
  
  @Property
  int level
  
  override getName() { class.simpleName }
  
  new(int level, Character character) {
    this.level = level
    this.character = character
  }
  
}

class Body extends Attribute {
  
  new(int level, Character character) {
    super(level, character)
  }
  
  override getModifiedLevel() { level + character.race.body }
  
}

class Quickness extends Attribute {
  
  new(int level, Character character) {
    super(level, character)
  }
  
  override getModifiedLevel() { level + character.race.quickness }
  
}

class Strength extends Attribute {
  
  new(int level, Character character) {
    super(level, character)
  }
  
  override getModifiedLevel() { level + character.race.strength }
  
}

class Charisma extends Attribute {
  
  new(int level, Character character) {
    super(level, character)
  }
  
  override getModifiedLevel() { level + character.race.charisma }
  
}

class Intelligence extends Attribute {
  
  new(int level, Character character) {
    super(level, character)
  }
  
  override getModifiedLevel() { level + character.race.intelligence }
  
}

class Willpower extends Attribute {
  
  new(int level, Character character) {
    super(level, character)
  }
  
  override getModifiedLevel() { level + character.race.willpower }
  
}

class Essence extends Attribute {
  
  new(Character character) {
    super(60, character)
  }
  
  override getLevel() { super.getLevel() / 10 }
  override getModifiedLevel() { level }
  
}

class Magic extends Attribute {
  
  Essence essence
  
  new(int level, Character character, Essence essence) {
    super(level, character)
    this.essence = essence
  }
  
  override getLevel() { Math.min(super.level, essence.level / 10) }
  override getModifiedLevel() { level }
  
}

class Reaction extends Attribute {
  
  Quickness quickness
  
  Intelligence intelligence
  
  new(Character character, Quickness quickness, Intelligence intelligence) {
    super(0, character)
    this.quickness = quickness
    this.intelligence = intelligence
  }
  
  override getLevel() { (quickness.level + intelligence.level) / 2 }
  override getModifiedLevel() { level }
  
}

class Initiative extends Attribute {
  
  new(int level, Character character) {
    super(level, character)
  }
  
  override getModifiedLevel() { level }
  
}
