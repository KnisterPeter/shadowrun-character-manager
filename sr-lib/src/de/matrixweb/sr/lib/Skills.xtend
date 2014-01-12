package de.matrixweb.sr.lib

import java.util.List

/**
 * @author markusw
 */
abstract class Skill implements Testable {
  
  @Property
  Attribute attribute
  
  @Property
  int level = 0
  
  @Property
  List<? extends Class<? extends Skill>> group = #[]
  
  new(Attribute attribute) { 
    this.attribute = attribute
  }
  
  override getName() { class.simpleName }
  override getModifiedLevel() { level }
  
}

// -- Body Skills --------------------------------------------------------------

class Athletics extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Diving extends Skill {
  new(Attribute attribute) { super(attribute) }
}

// -- Strength Skills ----------------------------------------------------------

class EdgedWeapons extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[EdgedWeapons, Clubs, PoleArms]
  }
}
class Clubs extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[EdgedWeapons, Clubs, PoleArms]
  }
}
class PoleArms extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[EdgedWeapons, Clubs, PoleArms]
  }
}

class CyberImplantCombat extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[CyberImplantCombat, UnarmedCombat]
  }
}
class UnarmedCombat extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[CyberImplantCombat, UnarmedCombat]
  }
}
class ThrowingWeapons extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class ProjectileWeapons extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class HeavyWeapons extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class UnderwaterCombat extends Skill {
  new(Attribute attribute) { super(attribute) }
}

// -- Quickness Skills ---------------------------------------------------------

class Pistols extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Pistols, SubmachineGuns, Rifles, AssaultRifles, Shotguns]
  }
}
class SubmachineGuns extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Pistols, SubmachineGuns, Rifles, AssaultRifles, Shotguns]
  }
}
class Rifles extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Pistols, SubmachineGuns, Rifles, AssaultRifles, Shotguns]
  }
}
class AssaultRifles extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Pistols, SubmachineGuns, Rifles, AssaultRifles, Shotguns]
  }
}
class Shotguns extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Pistols, SubmachineGuns, Rifles, AssaultRifles, Shotguns]
  }
}
class LaserWeapons extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Whips extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Stealth extends Skill {
  new(Attribute attribute) { super(attribute) }
}

// -- Intelligence Skills ------------------------------------------------------

class AuraReading extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Demolitions extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Gunnery extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Gunnery, LaunchWeapons]
  }
}
class LaunchWeapons extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Gunnery, LaunchWeapons]
  }
}
class Computer extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Computer, Electronics]
  }
}
class Electronics extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Computer, Electronics]
  }
}
class Biotech extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class BuildRepair extends Skill {
  new(Attribute attribute) { super(attribute) }
}

// -- Charisma Skills ----------------------------------------------------------

class Etiquette extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Instruction extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Interrogation extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Interrogation, Intimidation]
  }
}
class Intimidation extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Interrogation, Intimidation]
  }
}
class Leadership extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Negotiation extends Skill {
  new(Attribute attribute) { super(attribute) }
}

// -- Willpower Skills ---------------------------------------------------------

class Conjuring extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Sorcery extends Skill {
  new(Attribute attribute) { super(attribute) }
}

// -- Reaction Skills ----------------------------------------------------------

class Bike extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Car extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Hovercraft extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class Motorboat extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Motorboat, Ship]
  }
}
class Ship extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[Motorboat, Ship]
  }
}
class Sailboat extends Skill {
  new(Attribute attribute) { super(attribute) }
}
class WingedAircraft extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[WingedAircraft, RotorAircraft, VectorThrustAircraft, LighterThanAirAircraft]
  }
}
class RotorAircraft extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[WingedAircraft, RotorAircraft, VectorThrustAircraft, LighterThanAirAircraft]
  }
}
class VectorThrustAircraft extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[WingedAircraft, RotorAircraft, VectorThrustAircraft, LighterThanAirAircraft]
  }
}
class LighterThanAirAircraft extends Skill {
  new(Attribute attribute) { 
    super(attribute)
    group = #[WingedAircraft, RotorAircraft, VectorThrustAircraft, LighterThanAirAircraft]
  }
}
class Submarine extends Skill {
  new(Attribute attribute) { super(attribute) }
}

// -- Specializations ----------------------------------------------------------

class Specialization implements Testable {
  
  @Property
  Skill skill
  
  @Property
  int level
  
  @Property
  String name
  
  override getModifiedLevel() { level }
  
}
