package de.matrixweb.sr.lib

/**
 * @author markusw
 */
class CombatTurn {
  
  @Property
  Character character
  
  @Property
  int combatPool
  
  @Property
  int spellPool
  
  @Property
  int hackingPool
  
  @Property
  int controlPool
  
  @Property
  int astralCombatPool

  @Property
  int initiative
  
  int actions = 0
  
  new(Character character) {
    this.character = character
    combatPool = character.combatPool
    spellPool = character.spellPool
    hackingPool = character.hackingPool
    controlPool = character.controlPool
    astralCombatPool = character.astralCombatPool
    initiative = character.newInitiative
  }
  
  def getAvailableActionPoints() { 2 - actions }
  def act(Action action) { actions = actions + action.actionPoints }
  def nextInitiativePass() {
    initiative = initiative - 10
    actions = 0
  }
  
}

abstract class Action {
  package def int getActionPoints()
}

abstract class SimpleAction extends Action {
  override getActionPoints() { 1 }
}

abstract class ComplexAction extends Action  {
  override getActionPoints() { 2 }
}
