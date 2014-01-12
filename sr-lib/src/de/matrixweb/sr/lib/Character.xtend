package de.matrixweb.sr.lib

import java.util.List
import org.eclipse.xtext.xbase.lib.Pair

import static extension de.matrixweb.sr.lib.Dice.*

/**
 * Basic character description
 * 
 * @author markusw
 */
class Character {
  
  @Property
  String name
  
  @Property
  Race race
  
  @Property
  Gender gender = Gender::Male
  
  @Property
  int age = 0
  
  @Property
  int karmapool = 1
  
  @Property
  int karma = 0
  
  @Property
  int reputation = 0
  
  @Property
  List<? extends Attribute> attributes
  
  @Property
  int stunDamage
  
  @Property
  int physicalDamage
  
  @Property
  List<? extends Skill> activeSkills
  
  @Property
  List<? extends Skill> knowledgeSkills = #[]
  
  @Property
  List<? extends Skill> languageSkills = #[]
  
  @Property
  long resources
  
  @Property
  List<String> equipment
  
  @Property
  List<String> contacts
  
  @Property
  String notes
  
  /**
   * Free text for character description. Could include stereotype, 
   * look, clothes...
   */
  @Property
  String description
  
  new() {
    val quickness = new Quickness(1, this)
    val intelligence = new Intelligence(1, this)
    val essence = new Essence(this)
    attributes = #[
      new Body(1, this),
      quickness,
      new Strength(1, this),
      new Charisma(1, this),
      intelligence,
      new Willpower(1, this),
      essence,
      new Magic(0, this, essence),
      new Reaction(this, quickness, intelligence),
      new Initiative(1, this)
    ]
    activeSkills = #[
      new Athletics(body),
      new Diving(body),
      
      new EdgedWeapons(strength),
      new Clubs(strength),
      new PoleArms(strength),
      new CyberImplantCombat(strength),
      new UnarmedCombat(strength),
      new ThrowingWeapons(strength),
      new ProjectileWeapons(strength),
      new HeavyWeapons(strength),
      new UnderwaterCombat(strength),
      
      new Pistols(quickness),
      new SubmachineGuns(quickness),
      new Rifles(quickness),
      new AssaultRifles(quickness),
      new Shotguns(quickness),
      new LaserWeapons(quickness),
      new Whips(quickness),
      new Stealth(quickness),
      
      new AuraReading(intelligence),
      new Demolitions(intelligence),
      new Gunnery(intelligence),
      new LaunchWeapons(intelligence),
      new Computer(intelligence),
      new Electronics(intelligence),
      new Biotech(intelligence),
      new BuildRepair(intelligence),
      
      new Etiquette(charisma),
      new Instruction(charisma),
      new Interrogation(charisma),
      new Intimidation(charisma),
      new Leadership(charisma),
      new Negotiation(charisma),
      
      new Conjuring(willpower),
      new Sorcery(willpower),
      
      new Bike(reaction),
      new Car(reaction),
      new Hovercraft(reaction),
      new Motorboat(reaction),
      new Ship(reaction),
      new Sailboat(reaction),
      new WingedAircraft(reaction),
      new RotorAircraft(reaction),
      new VectorThrustAircraft(reaction),
      new LighterThanAirAircraft(reaction),
      new Submarine(reaction)
    ]
  }
  
  def getBody() { attributes.get(0) as Body }
  def getQuickness() { attributes.get(1) as Quickness }
  def getStrength() { attributes.get(2) as Strength }
  def getCharisma() { attributes.get(3) as Charisma }
  def getIntelligence() { attributes.get(4) as Intelligence }
  def getWillpower() { attributes.get(5) as Willpower }
  def getEssence() { attributes.get(6) as Essence }
  def getMagic() { attributes.get(7) as Magic }
  def getReaction() { attributes.get(8) as Reaction }
  def getInitiative() { attributes.get(9) as Initiative }
  
  def getCombatPool() { (intelligence.level + quickness.level + willpower.level) / 2 }
  def getSpellPool() { (intelligence.level + willpower.level + magic.level) / 3 }
  // TODO
  def getHackingPool() { (intelligence.level + /*mpcp-level*/0) / 3 }
  // TODO
  def getControlPool() { reaction.level + (/*vcr-rating*/0 * 2) }
  def getAstralCombatPool() { (intelligence.level + willpower.level + charisma.level) / 2 }
  
  def getNewInitiative() { initiative.level.rollSum + reaction.level - damageInitiativeModificator }
  private def getDamageInitiativeModificator() {
    val calc = [int damage |
      if (damage > 5) {
        return -3
      } else if (damage > 2) {
        return -2
      } else if (damage > 0) {
        return -1
      }
      return 0
    ]
    return calc.apply(stunDamage) + calc.apply(physicalDamage)
  }
  
  /**
   * @returns Returns a pair consisting of the number of dice to use for a 
   *          test and the required target-number modifier
   */
  def dispatch Pair<Integer, Integer> getDiceAndModifier(Testable testable) {
    testable.level -> 0
  }
  
  /**
   * @returns Returns a pair consisting of the number of dice to use for a 
   *          test and the required target-number modifier
   */
  def dispatch Pair<Integer, Integer> getDiceAndModifier(Skill skill) {
    if (skill.level > 0) 
      skill.level -> 0
    else {
      // First try defaulting to another skill in the same group...
      val defaultSkill = skill.group.map[cls | activeSkills.findFirst[class === cls]].findFirst[level > 0]
      if (defaultSkill !== null) defaultSkill.diceAndModifier.key -> 2
      // ... otherwise default to the attached attribute
      else skill.attribute.diceAndModifier.key -> 4
    }
  }
  
}

enum Gender {
  Male,
  Female
}
