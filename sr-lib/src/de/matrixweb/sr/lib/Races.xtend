package de.matrixweb.sr.lib

/**
 * @author markusw
 */
abstract class Race {
  
  def getName() { class.simpleName }

  def getBody() { 0 }
  
  def getQuickness() { 0 }
  
  def getStrength() { 0 }
  
  def getCharisma() { 0 }
  
  def getIntelligence() { 0 }
  
  def getWillpower() { 0 }
  
}

class Human extends Race {
}

class Elf extends Race {
  
  override getQuickness() { 1 }
  
  override getCharisma() { 2 }
  
}

class Dwarf extends Race {
  
  override getBody() { 1 }
  
  override getStrength() { 2 }
  
  override getWillpower() { 1 }
  
}

class Ork extends Race {
  
  override getBody() { 3 }
  
  override getStrength() { 2 }
  
  override getCharisma() { -1 }
  
  override getIntelligence() { -1 }
  
}

class Troll extends Race {
  
  override getBody() { 5 }
  
  override getQuickness() { -1 }
  
  override getStrength() { 4 }
  
  override getIntelligence() { -2 }
  
  override getCharisma() { -2 }
  
}
