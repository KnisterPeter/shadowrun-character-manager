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
  Gender gender
  
  @Property
  int age
  
  @Property
  int karmapool = 1
  
  @Property
  int karma
  
  @Property
  int reputation
  
  Body body = new Body
  
  Quickness quickness = new Quickness
  
  Strength strength = new Strength
  
  Charisma charisma = new Charisma
  
  Intelligence intelligence = new Intelligence
  
  Willpower willpower = new Willpower
  
  Essence essence = new Essence
  
  Magic magic = new Magic(essence)
  
  Reaction reaction = new Reaction(quickness, intelligence)
  
  @Property
  int initiative = 1
  
  @Property
  int stunDamage
  
  @Property
  int physicalDamage
  
  @Property
  List<? extends Skill> activeSkills = #[
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
  
  def getBodyValue() { body.level + race.body }
  def getQuicknessValue() { quickness.level + race.quickness }
  def getStrengthValue() { strength.level + race.strength }
  def getCharismaValue() { charisma.level + race.charisma }
  def getIntelligenceValue() { intelligence.level + race.intelligence }
  def getWillpowerValue() { willpower.level + race.willpower }
  def getEssenceValue() { essence.level }
  def getMagicValue() { magic.level }
  def getReactionValue() { reaction.level }
  
  def getCombatPool() { (intelligence.level + quickness.level + willpower.level) / 2 }
  def getSpellPool() { (intelligence.level + willpower.level + magic.level) / 3 }
  // TODO
  def getHackingPool() { (intelligence.level + /*mpcp-level*/0) / 3 }
  // TODO
  def getControlPool() { reaction.level + (/*vcr-rating*/0 * 2) }
  def getAstralCombatPool() { (intelligence.level + willpower.level + charisma.level) / 2 }
  
  def getNewInitiative() { initiative.rollSum + reaction.level - damageInitiativeModificator }
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
  
  def dispatch Pair<Integer, Integer> getDiceAndModifier(Attribute attribute) {
    attribute.level -> 0
  }
  
  def dispatch Pair<Integer, Integer> getDiceAndModifier(Skill skill) {
    if (skill.level > 0) 
      skill.level -> 0
    else {
      val defaultSkill = skill.group.map[cls | activeSkills.findFirst[class === cls]].findFirst[level > 0]
      if (defaultSkill !== null) defaultSkill.diceAndModifier.key -> 2
      else skill.attribute.diceAndModifier.key -> 4
    }
  }
  
}

enum Gender {
  Male,
  Female
}
